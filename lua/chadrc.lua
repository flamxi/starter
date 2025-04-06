---@class ChadrcConfig
local M = {}

M.base46 = {
  theme = "rosepine",
  theme_toggle = { "rosepine", "rosepine-dawn" },

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
}

M.nvdash = { load_on_startup = true }
M.ui = {
  tabufline = {
    lazyload = false,
  },
}

return M
