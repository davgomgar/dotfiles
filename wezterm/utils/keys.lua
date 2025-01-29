local wezterm = require("wezterm")
local act = wezterm.action
-- local mux = wezterm.mux

-- Create a function that takes config parameters and returns a config table

local function make_config(config)
  -- This will hold keys configuration
  config.leader = { key = "a", mods = "CTRL" }
  config.keys = {
    { key = "l",     mods = "CMD|SHIFT",  action = act.ActivateTabRelative(1) },
    { key = "h",     mods = "CMD|SHIFT",  action = act.ActivateTabRelative(-1) },
    { key = "j",     mods = "CMD",        action = act.ActivatePaneDirection("Down") },
    { key = "k",     mods = "CMD",        action = act.ActivatePaneDirection("Up") },
    { key = "Enter", mods = "CMD",        action = act.ActivateCopyMode },
    { key = "R",     mods = "SHIFT|CTRL", action = act.ReloadConfiguration },
    { key = "+",     mods = "CTRL",       action = act.IncreaseFontSize },
    { key = "-",     mods = "CTRL",       action = act.DecreaseFontSize },
    { key = "0",     mods = "CTRL",       action = act.ResetFontSize },
    { key = "C",     mods = "SHIFT|CTRL", action = act.CopyTo("Clipboard") },
    { key = "N",     mods = "SHIFT|CTRL", action = act.SpawnWindow },
    {
      key = "U",
      mods = "SHIFT|CTRL",
      action = act.CharSelect({ copy_on_select = true, copy_to = "ClipboardAndPrimarySelection" }),
    },
    { key = "v",          mods = "CMD",        action = act.PasteFrom("Clipboard") },
    { key = "PageUp",     mods = "CTRL",       action = act.ActivateTabRelative(-1) },
    { key = "PageDown",   mods = "CTRL",       action = act.ActivateTabRelative(1) },
    { key = "LeftArrow",  mods = "SHIFT|CTRL", action = act.ActivatePaneDirection("Left") },
    { key = "RightArrow", mods = "SHIFT|CTRL", action = act.ActivatePaneDirection("Right") },
    { key = "UpArrow",    mods = "SHIFT|CTRL", action = act.ActivatePaneDirection("Up") },
    { key = "DownArrow",  mods = "SHIFT|CTRL", action = act.ActivatePaneDirection("Down") },
    { key = "|",          mods = "LEADER",     action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
    { key = "-",          mods = "LEADER",     action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
    { key = "h",          mods = "CMD",        action = act.ActivatePaneDirection("Left") },
    { key = "l",          mods = "CMD",        action = act.ActivatePaneDirection("Right") },
    { key = "t",          mods = "CMD",        action = act.SpawnTab("CurrentPaneDomain") },
    { key = "w",          mods = "CMD",        action = act.CloseCurrentTab({ confirm = false }) },
    { key = "x",          mods = "CMD",        action = act.CloseCurrentPane({ confirm = false }) },
    { key = "Enter",      mods = "LEADER",     action = act.ActivateCopyMode },
    { key = "p",          mods = "LEADER",     action = act.PasteFrom("PrimarySelection") },
    { key = "m",          mods = "LEADER",     action = act.TogglePaneZoomState },
    {
      key = "k",
      mods = "CTRL|ALT",
      action = act.Multiple({
        act.ClearScrollback("ScrollbackAndViewport"),
        act.SendKey({ key = "L", mods = "CTRL" }),
      }),
    },
    {
      key = "r",
      mods = "LEADER",
      action = act.ActivateKeyTable({ name = "resize_panes", one_shot = false, timeout_milliseconds = 1000 }),
    },
    { key = "f", mods = "LEADER", action = wezterm.action.ToggleFullScreen },
    {
      key = ",",
      mods = "CMD",
      action = act.SpawnCommandInNewTab({
        cwd = os.getenv("WEZTERM_CONFIG_DIR"),
        set_environment_variables = {
          TERM = "screen-256color",
        },
        args = {
          "/opt/homebrew/bin/nvim",
          os.getenv("WEZTERM_CONFIG_FILE"),
        },
      }),
    },
  }
end

return {
  make_config = make_config,
}
