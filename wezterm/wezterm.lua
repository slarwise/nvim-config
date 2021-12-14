local wezterm = require 'wezterm'

return {
    font = wezterm.font("JetBrains Mono"),
    font_size = 16,
    color_scheme = "Tomorrow Night Eighties",
    hide_tab_bar_if_only_one_tab = true,
    default_cwd = "/Users/arvidbjurklint/Dropbox/projects",
    -- Maximize the window on start-up
    initial_cols = 82,
    initial_rows = 999,
}
