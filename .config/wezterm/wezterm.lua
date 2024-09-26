local wezterm = require 'wezterm'
local config = wezterm.config_builder()
config.automatically_reload_config = true
local mux = wezterm.mux

config.font_size = 15.0
config.use_ime = true
config.font = wezterm.font('HackGen Console NF', { weight = 'Regular', italic = false })

config.window_background_opacity = 0.90
config.quit_when_all_windows_are_closed = true
config.color_scheme = 'Gray'
config.color_schemes = {
  ['Gray'] = {
	background = '#1a1a1a',
  },
}
config.window_background_gradient = {
  colors = { "#1a1a1a" },
}

config.hide_tab_bar_if_only_one_tab = false
config.show_tabs_in_tab_bar = true
config.window_frame = {
  inactive_titlebar_bg = "none",
  active_titlebar_bg = "none",
}
config.window_decorations = "RESIZE"

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local background = "#5c6d74"
  local foreground = "#FFFFFF"

  if tab.is_active then
    background = "#ae8b2d"
    foreground = "#FFFFFF"
  end

  local title = "   " .. wezterm.truncate_right(tab.active_pane.title, max_width - 1) .. "   "

  return {
    { Background = { Color = background } },
    { Foreground = { Color = foreground } },
    { Text = title },
  }
end)

return config
