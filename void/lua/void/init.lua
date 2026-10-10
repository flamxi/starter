-- Palette for the `void` colorscheme and its lualine theme.
-- Variant follows `vim.o.background` ("dark" | "light").
-- Accent: set `vim.g.void_accent = "green" | "amber"` before `:colorscheme void`.
local M = {}

local accents = {
  dark = { green = "#3ee0a1", amber = "#e8b04f" },
  light = { green = "#1f9a68", amber = "#a8730f" },
}

local variants = {
  dark = {
    bg = "#121212",
    bg1 = "#1a1a1a", -- cursor line, floats, statusline
    bg2 = "#222222", -- selection, menus
    bg3 = "#2e2e2e", -- borders, visual
    gray0 = "#3a3a3a", -- non-text, inactive
    gray1 = "#5a5a5a", -- line numbers
    gray2 = "#858585", -- secondary UI text
    fg = "#d4d4d4",
    fg_bright = "#ededed",
    -- syntax gray ramp, most to least prominent
    type = "#bdbdbd", -- types, self/this
    str = "#aaaaaa", -- strings, punctuation
    kw = "#9a9a9a", -- keywords (bold)
    call = "#8a8a8a", -- function/method calls
    param = "#7a7a7a", -- parameters
    lit = "#6c6c6c", -- numbers, null, booleans, builtins
    comment = "#555555",
    red = "#d47070",
    yellow = "#cdb76a",
    blue = "#7f9fbf",
    green = "#8fb573",
    diff_add = "#16241c",
    diff_change = "#1c1c1c",
    diff_delete = "#261616",
    vt_error = "#1f1414",
    vt_warn = "#1e1b12",
    vt_info = "#141a20",
  },
  light = {
    bg = "#e2e2e2",
    bg1 = "#d7d7d7",
    bg2 = "#cdcdcd",
    bg3 = "#bfbfbf",
    gray0 = "#b4b4b4",
    gray1 = "#919191",
    gray2 = "#6e6e6e",
    fg = "#262626",
    fg_bright = "#111111",
    type = "#3c3c3c",
    str = "#4e4e4e",
    kw = "#666666",
    call = "#747474",
    param = "#838383",
    lit = "#8a8a8a",
    comment = "#9c9c9c",
    red = "#b03a3a",
    yellow = "#8f6f0c",
    blue = "#356592",
    green = "#3f7f34",
    diff_add = "#cadccf",
    diff_change = "#d7d7d7",
    diff_delete = "#e6caca",
    vt_error = "#e8d2d2",
    vt_warn = "#e4dcc6",
    vt_info = "#d0dae4",
  },
}

function M.palette()
  local variant = vim.o.background == "light" and "light" or "dark"
  local name = vim.g.void_accent or "green"
  local accent = accents[variant][name]
  if not accent then
    vim.notify("void: unknown accent '" .. tostring(name) .. "', using green", vim.log.levels.WARN)
    accent = accents[variant].green
  end
  return vim.tbl_extend("force", variants[variant], { accent = accent })
end

-- Neovim reloads the active colorscheme when 'background' changes.
function M.toggle()
  vim.o.background = vim.o.background == "dark" and "light" or "dark"
end

return M
