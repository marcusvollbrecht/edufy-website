// Gemeinsamer Supabase-Client. Einbinden in dieser Reihenfolge:
// <script src="https://cdn.jsdelivr.net/npm/@supabase/supabase-js@2.45.4/dist/umd/supabase.js"></script>
// <script src="js/supabase-config.js"></script>
// <script src="js/supabase-client.js"></script>
// Danach: window.edufyDb (Client oder null) und window.edufyDbReady (true/false).
(function () {
  var cfg = window.EDUFY_SUPABASE || {};
  window.edufyDb = null;
  window.edufyDbReady = false;
  if (!cfg.url || !cfg.anonKey) {
    console.warn('[edufy] Supabase nicht konfiguriert: js/supabase-config.js ausfüllen.');
    return;
  }
  if (!window.supabase || typeof window.supabase.createClient !== 'function') {
    console.error('[edufy] supabase-js wurde nicht geladen.');
    return;
  }
  window.edufyDb = window.supabase.createClient(cfg.url, cfg.anonKey);
  window.edufyDbReady = true;
})();
