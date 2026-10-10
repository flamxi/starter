-- lualine theme for the `void` colorscheme: flat gray bars, mode shown by the text color in section a.
local p = require("void").palette()

local function mode(fg)
  return {
    a = { fg = fg, bg = p.bg1, gui = "bold" },
    b = { fg = p.fg, bg = p.bg2 },
    c = { fg = p.gray2, bg = p.bg1 },
  }
end

return {
  normal = mode(p.fg_bright),
  insert = mode(p.accent),
  visual = mode(p.accent),
  replace = mode(p.red),
  command = mode(p.fg_bright),
  terminal = mode(p.fg_bright),
  inactive = {
    a = { fg = p.gray1, bg = p.bg1 },
    b = { fg = p.gray1, bg = p.bg1 },
    c = { fg = p.gray1, bg = p.bg1 },
  },
}
