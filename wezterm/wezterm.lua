-- Pull in the wezterm API
local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.adjust_window_size_when_changing_font_size = false
config.warn_about_missing_glyphs = false

config.color_scheme = 'zenwritten_dark'
config.default_prog = { '/usr/bin/fish' }
config.enable_tab_bar = false

config.font = wezterm.font_with_fallback {
    "SauceCodePro Nerd Font",
    "Noto Color Emoji",
    "Noto Sans Mono CJK SC",
    "Noto Sans Mono CJK HK",
    "Noto Sans Mono CJK JP",
    "Noto Sans Arabic",
    "Hanazono Mincho Ex B",
    "Hanazono Mincho Ex C",
}

return config
