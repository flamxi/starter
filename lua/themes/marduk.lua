local M = {}

-- Base colors
M.base_30 = {
  white = "#c1c1c1",
  darker_black = "#000000",
  black = "#000000", -- nvim bg
  black2 = "#090009", -- alt_bg
  one_bg = "#333333", -- visual
  one_bg2 = "#505050", -- comment tone
  one_bg3 = "#5f8787", -- alt accent
  grey = "#505050",
  grey_fg = "#888888", -- func
  grey_fg2 = "#999999", -- keyword
  light_grey = "#aaaaaa", -- constant/number
  red = "#5f8787", -- diag_red
  baby_pink = "#6e4c4c", -- diag_green
  pink = "#9b99a3", -- operator
  line = "#000000",
  green = "#c1c1c1", -- property
  vibrant_green = "#a5aaa7", -- string
  blue = "#999999", -- diag_blue
  nord_blue = "#aaaaaa",
  yellow = "#5f8787", -- diag_yellow
  sun = "#888888",
  purple = "#999999",
  dark_purple = "#626b67",
  teal = "#a5aaa7",
  orange = "#aaaaaa",
  cyan = "#a5aaa7",
  statusline_bg = "#090009",
  lightbg = "#333333",
  pmenu_bg = "#999999",
  folder_bg = "#5f8787",
}

M.base_16 = {
  base00 = "#000000", -- bg
  base01 = "#000000", -- alt_bg
  base02 = "#333333", -- visual
  base03 = "#505050", -- comment
  base04 = "#888888", -- func
  base05 = "#c1c1c1", -- fg
  base06 = "#aaaaaa", -- constant
  base07 = "#ffffff", -- bright white (approx)
  base08 = "#5f8787", -- red
  base09 = "#aaaaaa", -- orange/number
  base0A = "#5f8787", -- yellow
  base0B = "#6e4c4c", -- green
  base0C = "#a5aaa7", -- cyan/string
  base0D = "#999999", -- blue/keyword
  base0E = "#626b67", -- purple/type
  base0F = "#9b99a3", -- operator
}

M.type = "dark"

return M
