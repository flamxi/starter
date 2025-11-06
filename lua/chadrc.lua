---@class ChadrcConfig
local M = {}

M.base46 = {
  theme = "marduk",
  -- theme = "mountain",
  theme_toggle = { "marduk", "ayu_light" },
  -- theme_toggle = { "mountain", "ayu_light" },

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
