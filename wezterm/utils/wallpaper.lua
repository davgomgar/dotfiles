local wezterm = require("wezterm")
local h = require("utils/helpers")
local M = {}

M.get_wallpaper = function(dir)
  local wallpapers = {}
  for _, v in ipairs(wezterm.glob(dir)) do
    if not string.match(v, "%.DS_Store$") then
      table.insert(wallpapers, v)
    end
  end
  local wallpaper = h.get_random_entry(wallpapers)
  return {
    source = { File = { path = wallpaper } },
    height = "Cover",
    width = "Cover",
    horizontal_align = "Center",
    repeat_x = "Repeat",
    repeat_y = "Repeat",
    opacity = 1,
    -- speed = 200,
  }
end

return M
