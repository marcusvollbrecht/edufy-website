// =====================================================================
// Edufy – Edge Function „schueler-eltern-freigabe“ (Aufgabe S-002)
//
// Verschickt die Freigabe-E-Mail an ein Elternteil, wenn ein Schülerkonto
// unter 16 angelegt wurde oder der Schüler „erneut senden“ wählt.
//
// Ablauf
//   1. Aufruf durch die Seite mit dem JWT des angemeldeten Schülers
//      (supabase.functions.invoke('schueler-eltern-freigabe', { body })).
//      Body (optional): { "eltern_email": "neue@adresse.de" } – nur um eine
//      vertippte Eltern-Adresse zu korrigieren.
//   2. Nutzer über /auth/v1/user prüfen (JWT echt?).
//   3. Zufälliges Token (32 Byte, base64url) erzeugen, SHA-256-Hash bilden.
//   4. Mit Service-Role: rpc schueler_eltern_mail_vorbereiten(student_id,
//      token_hash, eltern_email) – speichert NUR den Hash, prüft Status und
//      Rate-Limit (3 je Schüler / 5 je Eltern-Adresse in 24 h).
//   5. E-Mail mit Link <SITE_URL>/eltern-freigabe.html#token=<token> senden.
//      Das Token steht im URL-Fragment (#) und landet so nicht in Server-Logs.
//   6. rpc schueler_eltern_mail_ergebnis(consent_id, erfolg).
//   Das Klartext-Token existiert danach nur noch in der E-Mail.
//
// Secrets (Supabase → Edge Functions → Secrets bzw.
//   `supabase secrets set NAME=wert`). NIE im Code oder im Repo!
//   Automatisch vorhanden: SUPABASE_URL, SUPABASE_ANON_KEY, SUPABASE_SERVICE_ROLE_KEY
//   Pflicht:
//     EDUFY_SITE_URL        z. B. https://edufy.world (ohne / am Ende) – Basis für den Link
//     EDUFY_MAIL_PROVIDER   brevo | postmark | resend | smtp
//     EDUFY_MAIL_FROM       Absenderadresse, z. B. hallo@edufy.world (beim Anbieter verifiziert)
//   Je nach Anbieter:
//     EDUFY_MAIL_API_KEY    API-Schlüssel (brevo, postmark, resend)
//     EDUFY_SMTP_HOST, EDUFY_SMTP_PORT (Standard 465), EDUFY_SMTP_USER, EDUFY_SMTP_PASS (smtp)
//       Hinweis: Supabase Edge Functions sperren ausgehend Port 25 und 587 → Port 465 (TLS) nutzen.
//   Optional:
//     EDUFY_MAIL_FROM_NAME  Standard „Edufy“
//     EDUFY_MAIL_REPLY_TO   Standard hallo@edufy.world
//     EDUFY_MAIL_API_URL    abweichender API-Endpunkt des Anbieters (z. B. EU-Region oder lokaler Test)
//     EDUFY_ALLOWED_ORIGINS kommagetrennt, z. B. https://edufy.world,https://www.edufy.world
//                           (leer = jede Herkunft; Schutz ist ohnehin das JWT)
//
// Fehler (JSON { error: "EDUFY:<CODE>" }):
//   MAIL_NICHT_KONFIGURIERT (503), NICHT_ANGEMELDET (401), METHODE (405),
//   UNGUELTIGE_ANFRAGE (400), LIMIT_ERREICHT (429), KEIN_SCHUELERKONTO (404),
//   KEINE_FREIGABE_NOETIG / GESPERRT (409), ELTERN_EMAIL_* (400),
//   MAIL_VERSAND_FEHLGESCHLAGEN (502), INTERN (500)
//
// Deploy: supabase functions deploy schueler-eltern-freigabe
// (JWT-Prüfung durch Supabase bleibt an – Standard.)
// Datenschutz: Es werden weder Token noch E-Mail-Adressen geloggt.
// =====================================================================

type Json = Record<string, unknown>;

interface MailDaten {
  consent_id: string;
  eltern_email: string;
  vorname: string;
  geburtsmonat: number;
  geburtsjahr: number;
  klassenstufe: number;
  schulform: string;
  schule_name: string | null;
  ablauf_am: string;
}

interface MailConfig {
  provider: "brevo" | "postmark" | "resend" | "smtp";
  from: string;
  fromName: string;
  replyTo: string;
  apiKey: string;
  apiUrl: string;
  smtpHost: string;
  smtpPort: number;
  smtpUser: string;
  smtpPass: string;
}

interface Mail {
  to: string;
  subject: string;
  text: string;
  html: string;
}

const TEXT_VERSION = "eltern-mail-2026-11-25";

const SCHULFORMEN: Record<string, string> = {
  hauptschule: "Hauptschule / Mittelschule",
  realschule: "Realschule",
  gymnasium: "Gymnasium",
  gesamtschule: "Gesamtschule",
  oberschule: "Oberschule / Sekundarschule",
  gemeinschaftsschule: "Gemeinschaftsschule / Stadtteilschule",
  foerderschule: "Förderschule",
  berufsbildende_schule: "Berufsbildende Schule / Berufskolleg",
  sonstige: "andere Schulform",
};

const MONATE = [
  "Januar", "Februar", "März", "April", "Mai", "Juni",
  "Juli", "August", "September", "Oktober", "November", "Dezember",
];

const HTTP_STATUS: Record<string, number> = {
  NICHT_ANGEMELDET: 401,
  UNGUELTIGE_ANFRAGE: 400,
  KEIN_SCHUELERKONTO: 404,
  GESPERRT: 409,
  KEINE_FREIGABE_NOETIG: 409,
  ELTERN_EMAIL_FEHLT: 400,
  ELTERN_EMAIL_UNGUELTIG: 400,
  ELTERN_EMAIL_GLEICH: 400,
  UNGUELTIGER_HASH: 500,
  LIMIT_ERREICHT: 429,
  MAIL_NICHT_KONFIGURIERT: 503,
  MAIL_VERSAND_FEHLGESCHLAGEN: 502,
  METHODE: 405,
  INTERN: 500,
};

function env(name: string): string {
  return (Deno.env.get(name) ?? "").trim();
}

// ---------- CORS ----------
function corsHeaders(req: Request): Record<string, string> {
  const origin = req.headers.get("origin") ?? "";
  const allowed = env("EDUFY_ALLOWED_ORIGINS")
    .split(",")
    .map((s) => s.trim())
    .filter((s) => s !== "");
  let allow = "*";
  if (allowed.length > 0) {
    allow = allowed.indexOf(origin) !== -1 ? origin : allowed[0];
  }
  return {
    "Access-Control-Allow-Origin": allow,
    "Access-Control-Allow-Methods": "POST, OPTIONS",
    "Access-Control-Allow-Headers": "authorization, x-client-info, apikey, content-type",
    "Vary": "Origin",
  };
}

function antwort(req: Request, status: number, body: Json): Response {
  return new Response(JSON.stringify(body), {
    status,
    headers: { ...corsHeaders(req), "Content-Type": "application/json; charset=utf-8", "Cache-Control": "no-store" },
  });
}

function fehler(req: Request, code: string): Response {
  return antwort(req, HTTP_STATUS[code] ?? 500, { error: "EDUFY:" + code });
}

// ---------- Konfiguration ----------
function mailConfig(): MailConfig | null {
  const provider = env("EDUFY_MAIL_PROVIDER").toLowerCase();
  const from = env("EDUFY_MAIL_FROM");
  if (!from || !env("EDUFY_SITE_URL")) return null;
  const cfg: MailConfig = {
    provider: provider as MailConfig["provider"],
    from,
    fromName: env("EDUFY_MAIL_FROM_NAME") || "Edufy",
    replyTo: env("EDUFY_MAIL_REPLY_TO") || "hallo@edufy.world",
    apiKey: env("EDUFY_MAIL_API_KEY"),
    apiUrl: env("EDUFY_MAIL_API_URL"),
    smtpHost: env("EDUFY_SMTP_HOST"),
    smtpPort: Number(env("EDUFY_SMTP_PORT") || "465"),
    smtpUser: env("EDUFY_SMTP_USER"),
    smtpPass: env("EDUFY_SMTP_PASS"),
  };
  if (provider === "brevo" || provider === "postmark" || provider === "resend") {
    return cfg.apiKey ? cfg : null;
  }
  if (provider === "smtp") {
    return cfg.smtpHost && cfg.smtpUser && cfg.smtpPass ? cfg : null;
  }
  return null;
}

function siteUrl(): string {
  let url = env("EDUFY_SITE_URL");
  while (url.endsWith("/")) url = url.slice(0, -1);
  return url;
}

// ---------- Token ----------
function base64url(bytes: Uint8Array): string {
  let bin = "";
  for (let i = 0; i < bytes.length; i++) bin += String.fromCharCode(bytes[i]);
  return btoa(bin).replaceAll("+", "-").replaceAll("/", "_").replaceAll("=", "");
}

async function sha256Hex(text: string): Promise<string> {
  const digest = await crypto.subtle.digest("SHA-256", new TextEncoder().encode(text));
  return Array.from(new Uint8Array(digest)).map((b) => b.toString(16).padStart(2, "0")).join("");
}

// ---------- Supabase (ohne Bibliothek, nur fetch) ----------
async function angemeldeterNutzer(authHeader: string): Promise<string | null> {
  const res = await fetch(env("SUPABASE_URL") + "/auth/v1/user", {
    headers: { Authorization: authHeader, apikey: env("SUPABASE_ANON_KEY") },
  });
  if (!res.ok) return null;
  const user = (await res.json()) as { id?: string };
  return typeof user.id === "string" ? user.id : null;
}

class RpcFehler extends Error {
  code: string;
  constructor(code: string) {
    super(code);
    this.code = code;
  }
}

async function rpc(name: string, params: Json): Promise<unknown> {
  const key = env("SUPABASE_SERVICE_ROLE_KEY");
  const res = await fetch(env("SUPABASE_URL") + "/rest/v1/rpc/" + name, {
    method: "POST",
    headers: { apikey: key, Authorization: "Bearer " + key, "Content-Type": "application/json" },
    body: JSON.stringify(params),
  });
  const text = await res.text();
  if (!res.ok) {
    let msg = "";
    try {
      msg = String((JSON.parse(text) as { message?: string }).message ?? "");
    } catch (_e) {
      msg = "";
    }
    const idx = msg.indexOf("EDUFY:");
    throw new RpcFehler(idx !== -1 ? msg.slice(idx + 6).split(" ")[0] : "INTERN");
  }
  return text ? JSON.parse(text) : null;
}

// ---------- E-Mail-Text ----------
function ohneZeilenumbruch(s: string): string {
  return s.replaceAll("\r", " ").replaceAll("\n", " ").trim();
}

function htmlEscape(s: string): string {
  return s.replaceAll("&", "&amp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;")
    .replaceAll('"', "&quot;").replaceAll("'", "&#39;");
}

function datumDe(iso: string): string {
  const d = new Date(iso);
  return d.toLocaleDateString("de-DE", { day: "numeric", month: "long", year: "numeric", timeZone: "Europe/Berlin" });
}

function baueMail(d: MailDaten, link: string, base: string): Mail {
  const vorname = ohneZeilenumbruch(d.vorname);
  const bis = datumDe(d.ablauf_am);
  const angaben: Array<[string, string]> = [
    ["Vorname", vorname],
    ["Geburtsmonat und -jahr", (MONATE[d.geburtsmonat - 1] ?? "") + " " + d.geburtsjahr],
    ["Klasse", String(d.klassenstufe)],
    ["Schulform", SCHULFORMEN[d.schulform] ?? d.schulform],
  ];
  if (d.schule_name) angaben.push(["Schule (eigene Angabe)", ohneZeilenumbruch(d.schule_name)]);
  angaben.push(["E-Mail-Adresse", "die E-Mail-Adresse von " + vorname + " für die Anmeldung"]);

  const datenschutz = base + "/datenschutz.html#minderjaehrige";
  const impressum = base + "/impressum.html";
  const subject = "Bitte um Ihre Freigabe: " + vorname + " möchte Edufy nutzen";

  const text = [
    "Guten Tag,",
    "",
    vorname + " hat sich bei Edufy ein Konto angelegt und Ihre E-Mail-Adresse als Adresse eines Elternteils angegeben. Weil " + vorname + " jünger als 16 Jahre ist, brauchen wir Ihre Freigabe.",
    "",
    "WAS IST EDUFY?",
    "Edufy hilft Schülerinnen und Schülern bei der Berufs- und Studienorientierung: Berufe und Ausbildungsvergütungen, Studiengänge, Förderungen und Bildungswege. Für Schülerinnen und Schüler ist Edufy kostenlos.",
    "",
    "WELCHE ANGABEN HAT " + vorname.toUpperCase() + " GESPEICHERT?",
    ...angaben.map(([k, v]) => "- " + k + ": " + v),
    "- eine Merkliste mit Berufen, Studiengängen und Förderungen (falls angelegt)",
    "",
    "WAS BEDEUTET IHRE FREIGABE?",
    "Bis zu Ihrer Freigabe ist das Konto eingeschränkt: " + vorname + " kann Inhalte ansehen und eine Merkliste führen, aber keinen Kontakt zu Unternehmen aufnehmen.",
    "Mit Ihrer Freigabe darf " + vorname + " später auch selbst Kontakt zu Unternehmen aufnehmen (diese Funktion ist noch in Vorbereitung). Unternehmen sehen nur anonyme Statistiken je Schule. Persönliche Angaben bekommt ein Unternehmen nur, wenn " + vorname + " selbst Kontakt aufnimmt.",
    "",
    "FREIGEBEN ODER ABLEHNEN",
    link,
    "",
    "Zum Freigeben ist der Link 14 Tage gültig (bis " + bis + "). Auf derselben Seite können Sie auch ablehnen und das Konto löschen lassen – und eine Freigabe später jederzeit widerrufen. Bitte heben Sie diese E-Mail dafür auf.",
    "Wenn Sie nichts tun, bleibt das Konto eingeschränkt.",
    "",
    "Sie kennen " + vorname + " nicht? Dann wurde Ihre Adresse vermutlich vertippt. Sie können die Anfrage über den Link ablehnen und das Konto löschen lassen oder diese E-Mail einfach ignorieren.",
    "",
    "Datenschutz: " + datenschutz,
    "Impressum: " + impressum,
    "Fragen? Schreiben Sie uns: hallo@edufy.world",
    "",
    "Viele Grüße",
    "Ihr Edufy-Team",
    "",
    "(" + TEXT_VERSION + ")",
  ].join("\n");

  const e = htmlEscape;
  const li = angaben.map(([k, v]) => "<li><strong>" + e(k) + ":</strong> " + e(v) + "</li>").join("");
  const p = (s: string) => '<p style="margin:0 0 14px">' + s + "</p>";
  const h = (s: string) => '<h2 style="font-size:17px;color:#0B1F3A;margin:22px 0 8px">' + s + "</h2>";
  const html = [
    '<!DOCTYPE html><html lang="de"><head><meta charset="utf-8"><title>' + e(subject) + "</title></head>",
    '<body style="margin:0;padding:0;background:#F8FAFC;font-family:Arial,Helvetica,sans-serif;color:#1E293B;font-size:16px;line-height:1.55">',
    '<div style="max-width:600px;margin:0 auto;padding:24px 18px;background:#FFFFFF">',
    '<p style="font-size:24px;font-family:Georgia,serif;color:#0B1F3A;margin:0 0 18px">Edu<span style="color:#0B7A70">fy</span></p>',
    p("Guten Tag,"),
    p(e(vorname) + " hat sich bei Edufy ein Konto angelegt und Ihre E-Mail-Adresse als Adresse eines Elternteils angegeben. Weil " + e(vorname) + " jünger als 16 Jahre ist, brauchen wir Ihre Freigabe."),
    h("Was ist Edufy?"),
    p("Edufy hilft Schülerinnen und Schülern bei der Berufs- und Studienorientierung: Berufe und Ausbildungsvergütungen, Studiengänge, Förderungen und Bildungswege. Für Schülerinnen und Schüler ist Edufy kostenlos."),
    h("Welche Angaben hat " + e(vorname) + " gespeichert?"),
    '<ul style="margin:0 0 14px;padding-left:20px">' + li + "<li>eine Merkliste mit Berufen, Studiengängen und Förderungen (falls angelegt)</li></ul>",
    h("Was bedeutet Ihre Freigabe?"),
    p("Bis zu Ihrer Freigabe ist das Konto eingeschränkt: " + e(vorname) + " kann Inhalte ansehen und eine Merkliste führen, aber keinen Kontakt zu Unternehmen aufnehmen."),
    p("Mit Ihrer Freigabe darf " + e(vorname) + " später auch selbst Kontakt zu Unternehmen aufnehmen (diese Funktion ist noch in Vorbereitung). Unternehmen sehen nur anonyme Statistiken je Schule. Persönliche Angaben bekommt ein Unternehmen nur, wenn " + e(vorname) + " selbst Kontakt aufnimmt."),
    h("Freigeben oder ablehnen"),
    '<p style="margin:0 0 14px"><a href="' + e(link) + '" style="display:inline-block;background:#0B7A70;color:#FFFFFF;text-decoration:none;font-weight:bold;padding:12px 22px;border-radius:8px">Zur Freigabe-Seite</a></p>',
    p('Falls der Knopf nicht funktioniert, kopieren Sie diesen Link in Ihren Browser:<br><a href="' + e(link) + '" style="color:#0B7A70;word-break:break-all">' + e(link) + "</a>"),
    p("Zum Freigeben ist der Link 14 Tage gültig (bis " + e(bis) + "). Auf derselben Seite können Sie auch ablehnen und das Konto löschen lassen – und eine Freigabe später jederzeit widerrufen. Bitte heben Sie diese E-Mail dafür auf. Wenn Sie nichts tun, bleibt das Konto eingeschränkt."),
    p("Sie kennen " + e(vorname) + " nicht? Dann wurde Ihre Adresse vermutlich vertippt. Sie können die Anfrage über den Link ablehnen und das Konto löschen lassen oder diese E-Mail einfach ignorieren."),
    p('<a href="' + e(datenschutz) + '" style="color:#0B7A70">Datenschutzerklärung</a> · <a href="' + e(impressum) + '" style="color:#0B7A70">Impressum</a> · Fragen: <a href="mailto:hallo@edufy.world" style="color:#0B7A70">hallo@edufy.world</a>'),
    p("Viele Grüße<br>Ihr Edufy-Team"),
    '<p style="margin:18px 0 0;font-size:12px;color:#475569">' + e(TEXT_VERSION) + "</p>",
    "</div></body></html>",
  ].join("\n");

  return { to: d.eltern_email, subject, text, html };
}

// ---------- Versand ----------
async function sendeMail(cfg: MailConfig, mail: Mail): Promise<boolean> {
  let res: Response;
  if (cfg.provider === "brevo") {
    res = await fetch(cfg.apiUrl || "https://api.brevo.com/v3/smtp/email", {
      method: "POST",
      headers: { "api-key": cfg.apiKey, "Content-Type": "application/json", Accept: "application/json" },
      body: JSON.stringify({
        sender: { email: cfg.from, name: cfg.fromName },
        to: [{ email: mail.to }],
        replyTo: { email: cfg.replyTo },
        subject: mail.subject,
        htmlContent: mail.html,
        textContent: mail.text,
      }),
    });
  } else if (cfg.provider === "postmark") {
    res = await fetch(cfg.apiUrl || "https://api.postmarkapp.com/email", {
      method: "POST",
      headers: { "X-Postmark-Server-Token": cfg.apiKey, "Content-Type": "application/json", Accept: "application/json" },
      body: JSON.stringify({
        From: cfg.fromName + " <" + cfg.from + ">",
        To: mail.to,
        ReplyTo: cfg.replyTo,
        Subject: mail.subject,
        HtmlBody: mail.html,
        TextBody: mail.text,
        MessageStream: "outbound",
        TrackOpens: false,
        TrackLinks: "None",
      }),
    });
  } else if (cfg.provider === "resend") {
    res = await fetch(cfg.apiUrl || "https://api.resend.com/emails", {
      method: "POST",
      headers: { Authorization: "Bearer " + cfg.apiKey, "Content-Type": "application/json" },
      body: JSON.stringify({
        from: cfg.fromName + " <" + cfg.from + ">",
        to: [mail.to],
        reply_to: cfg.replyTo,
        subject: mail.subject,
        html: mail.html,
        text: mail.text,
      }),
    });
  } else {
    // SMTP über nodemailer (npm-Import erst zur Laufzeit; Port 465 mit TLS)
    const spec = "npm:nodemailer@6.9.16";
    // deno-lint-ignore no-explicit-any
    const mod: any = await import(spec);
    const transporter = mod.default.createTransport({
      host: cfg.smtpHost,
      port: cfg.smtpPort,
      secure: cfg.smtpPort === 465,
      auth: { user: cfg.smtpUser, pass: cfg.smtpPass },
    });
    await transporter.sendMail({
      from: { name: cfg.fromName, address: cfg.from },
      to: mail.to,
      replyTo: cfg.replyTo,
      subject: mail.subject,
      text: mail.text,
      html: mail.html,
    });
    return true;
  }
  if (!res.ok) {
    console.error("[schueler-eltern-freigabe] Mail-Anbieter antwortet mit Status " + res.status);
    await res.body?.cancel();
    return false;
  }
  await res.body?.cancel();
  return true;
}

// ---------- Handler ----------
async function handle(req: Request): Promise<Response> {
  if (req.method === "OPTIONS") return new Response(null, { status: 204, headers: corsHeaders(req) });
  if (req.method !== "POST") return fehler(req, "METHODE");

  const cfg = mailConfig();
  if (!cfg) {
    console.error("[schueler-eltern-freigabe] Mail-Anbieter oder EDUFY_SITE_URL nicht konfiguriert");
    return fehler(req, "MAIL_NICHT_KONFIGURIERT");
  }

  const auth = req.headers.get("authorization") ?? "";
  if (!auth.toLowerCase().startsWith("bearer ")) return fehler(req, "NICHT_ANGEMELDET");
  const studentId = await angemeldeterNutzer(auth);
  if (!studentId) return fehler(req, "NICHT_ANGEMELDET");

  let elternEmail: string | null = null;
  const raw = await req.text();
  if (raw.length > 2000) return fehler(req, "UNGUELTIGE_ANFRAGE");
  if (raw.trim() !== "") {
    try {
      const body = JSON.parse(raw) as { eltern_email?: unknown };
      if (body.eltern_email !== undefined && body.eltern_email !== null) {
        if (typeof body.eltern_email !== "string") return fehler(req, "UNGUELTIGE_ANFRAGE");
        elternEmail = body.eltern_email.trim().toLowerCase() || null;
      }
    } catch (_e) {
      return fehler(req, "UNGUELTIGE_ANFRAGE");
    }
  }

  const token = base64url(crypto.getRandomValues(new Uint8Array(32)));
  const tokenHash = await sha256Hex(token);

  let daten: MailDaten;
  try {
    daten = (await rpc("schueler_eltern_mail_vorbereiten", {
      p_student_id: studentId,
      p_token_hash: tokenHash,
      p_eltern_email: elternEmail,
    })) as MailDaten;
  } catch (e) {
    const code = e instanceof RpcFehler ? e.code : "INTERN";
    if (code === "INTERN") console.error("[schueler-eltern-freigabe] Vorbereitung fehlgeschlagen");
    return fehler(req, code in HTTP_STATUS ? code : "INTERN");
  }

  const base = siteUrl();
  const link = base + "/eltern-freigabe.html#token=" + token;
  let ok = false;
  try {
    ok = await sendeMail(cfg, baueMail(daten, link, base));
  } catch (_e) {
    console.error("[schueler-eltern-freigabe] Versand mit Ausnahme abgebrochen");
    ok = false;
  }

  try {
    await rpc("schueler_eltern_mail_ergebnis", { p_consent_id: daten.consent_id, p_erfolg: ok });
  } catch (_e) {
    console.error("[schueler-eltern-freigabe] Versandergebnis konnte nicht gespeichert werden");
  }

  if (!ok) return fehler(req, "MAIL_VERSAND_FEHLGESCHLAGEN");
  return antwort(req, 200, { ok: true, eltern_email: daten.eltern_email, ablauf_am: daten.ablauf_am });
}

Deno.serve(async (req: Request): Promise<Response> => {
  try {
    return await handle(req);
  } catch (_e) {
    console.error("[schueler-eltern-freigabe] Unerwarteter Fehler");
    return fehler(req, "INTERN");
  }
});
