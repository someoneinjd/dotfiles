require 'compe'.setup {
    enable = true;
    autocomplete = true;
    debug = false;
    min_length = 1;
    preselect = 'enable';
    throttle_time = 80;
    source_timeout = 200;
    resolve_timeout = 800;
    incomplete_delay = 400;
    max_abbr_width = 100;
    max_menu_width = 100;
    documention = true;

    source = {
        path = {kind = ""};
        buffer = {kind = ""};
        calc = {kind = ""};
        nvim_lsp = {kind = ""};
    };
}
