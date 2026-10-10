-- void: grayscale code, bold keywords, one accent for operators.
-- Dark or light variant follows 'background'; :VoidToggle switches it.
vim.cmd "hi clear"
if vim.fn.exists "syntax_on" == 1 then vim.cmd "syntax reset" end
vim.o.termguicolors = true
vim.g.colors_name = "void"

local p = require("void").palette()
-- lualine reloads its theme on ColorScheme; drop the cached one so it picks up the new variant
package.loaded["lualine.themes.void"] = nil
vim.api.nvim_create_user_command("VoidToggle", require("void").toggle, { desc = "Toggle void dark/light" })

local groups = {
  -- Editor UI
  Normal = { fg = p.fg, bg = p.bg },
  NormalNC = { link = "Normal" },
  NormalFloat = { fg = p.fg, bg = p.bg1 },
  FloatBorder = { fg = p.bg3, bg = p.bg1 },
  FloatTitle = { fg = p.fg_bright, bg = p.bg1, bold = true },
  Cursor = { fg = p.bg, bg = p.fg },
  CursorLine = { bg = p.bg1 },
  CursorColumn = { link = "CursorLine" },
  ColorColumn = { bg = p.bg1 },
  LineNr = { fg = p.gray1 },
  CursorLineNr = { fg = p.fg_bright },
  SignColumn = { bg = p.bg },
  FoldColumn = { fg = p.gray0 },
  Folded = { fg = p.gray1, bg = p.bg1 },
  VertSplit = { fg = p.bg3 },
  WinSeparator = { fg = p.bg3 },
  StatusLine = { fg = p.fg, bg = p.bg1 },
  StatusLineNC = { fg = p.gray1, bg = p.bg1 },
  TabLine = { fg = p.gray1, bg = p.bg },
  TabLineFill = { bg = p.bg },
  TabLineSel = { fg = p.fg_bright, bg = p.bg2 },
  WinBar = { fg = p.fg, bg = p.bg },
  WinBarNC = { fg = p.gray1, bg = p.bg },
  Visual = { bg = p.bg3 },
  VisualNOS = { link = "Visual" },
  Search = { fg = p.bg, bg = p.gray2 },
  IncSearch = { fg = p.bg, bg = p.accent },
  CurSearch = { link = "IncSearch" },
  Substitute = { link = "IncSearch" },
  MatchParen = { fg = p.fg_bright, bg = p.bg3, bold = true },
  NonText = { fg = p.gray0 },
  Whitespace = { fg = p.gray0 },
  SpecialKey = { fg = p.gray0 },
  EndOfBuffer = { fg = p.bg },
  Conceal = { fg = p.gray1 },
  Directory = { fg = p.fg_bright },
  Title = { fg = p.fg_bright, bold = true },
  Question = { fg = p.fg },
  MoreMsg = { fg = p.fg },
  ModeMsg = { fg = p.fg },
  MsgArea = { fg = p.fg },
  OkMsg = { fg = p.green },
  ErrorMsg = { fg = p.red },
  WarningMsg = { fg = p.yellow },
  QuickFixLine = { bg = p.bg2 },
  Pmenu = { fg = p.fg, bg = p.bg1 },
  PmenuSel = { fg = p.fg_bright, bg = p.bg3 },
  PmenuKind = { fg = p.gray2, bg = p.bg1 },
  PmenuKindSel = { fg = p.gray2, bg = p.bg3 },
  PmenuExtra = { fg = p.gray1, bg = p.bg1 },
  PmenuExtraSel = { fg = p.gray1, bg = p.bg3 },
  PmenuMatch = { fg = p.accent, bg = p.bg1 },
  PmenuMatchSel = { fg = p.accent, bg = p.bg3 },
  PmenuSbar = { bg = p.bg1 },
  PmenuThumb = { bg = p.bg3 },
  WildMenu = { link = "PmenuSel" },
  SpellBad = { sp = p.red, undercurl = true },
  SpellCap = { sp = p.yellow, undercurl = true },
  SpellLocal = { sp = p.blue, undercurl = true },
  SpellRare = { sp = p.gray2, undercurl = true },

  -- Diff
  DiffAdd = { bg = p.diff_add },
  DiffChange = { bg = p.diff_change },
  DiffDelete = { fg = p.red, bg = p.diff_delete },
  DiffText = { bg = p.bg3 },
  Added = { fg = p.green },
  Changed = { fg = p.yellow },
  Removed = { fg = p.red },

  -- Syntax: a gray ramp per role (see palette), bold keywords, accent operators
  Comment = { fg = p.comment },
  Constant = { fg = p.lit },
  String = { fg = p.str },
  Character = { link = "String" },
  Number = { link = "Constant" },
  Boolean = { link = "Constant" },
  Float = { link = "Constant" },
  Identifier = { fg = p.fg },
  Function = { fg = p.fg_bright },
  Statement = { fg = p.kw, bold = true },
  Keyword = { link = "Statement" },
  Conditional = { link = "Statement" },
  Repeat = { link = "Statement" },
  Label = { link = "Statement" },
  Exception = { link = "Statement" },
  Operator = { fg = p.accent },
  PreProc = { fg = p.kw, bold = true },
  Include = { link = "PreProc" },
  Define = { link = "PreProc" },
  Macro = { fg = p.lit },
  PreCondit = { link = "PreProc" },
  Type = { fg = p.type },
  StorageClass = { link = "Statement" },
  Structure = { link = "Statement" },
  Typedef = { link = "Statement" },
  Special = { fg = p.lit },
  SpecialChar = { fg = p.accent },
  Tag = { fg = p.fg_bright },
  Delimiter = { fg = p.str },
  SpecialComment = { fg = p.comment },
  Debug = { fg = p.fg },
  Underlined = { underline = true },
  Ignore = { fg = p.gray0 },
  Error = { fg = p.red },
  Todo = { fg = p.accent, bold = true },

  -- Treesitter: only where Neovim's defaults differ from the image
  ["@variable"] = { fg = p.fg },
  ["@variable.builtin"] = { fg = p.type },
  ["@variable.parameter"] = { fg = p.param },
  ["@variable.member"] = { fg = p.fg },
  ["@property"] = { fg = p.fg },
  ["@module"] = { fg = p.fg },
  ["@keyword.operator"] = { fg = p.accent, bold = true },
  ["@function.call"] = { fg = p.call },
  ["@function.method.call"] = { fg = p.call },
  ["@constructor"] = { fg = p.type },
  ["@function.builtin"] = { fg = p.lit },
  ["@function.macro"] = { fg = p.call },
  ["@type.builtin"] = { fg = p.type },
  ["@attribute"] = { fg = p.lit },
  ["@punctuation"] = { link = "Delimiter" },
  ["@string.escape"] = { link = "SpecialChar" },
  ["@markup.heading"] = { link = "Title" },
  ["@markup.strong"] = { bold = true },
  ["@markup.italic"] = { italic = true },
  ["@markup.link"] = { fg = p.fg, underline = true },
  ["@markup.raw"] = { fg = p.accent },
  ["@comment.todo"] = { link = "Todo" },
  ["@comment.note"] = { fg = p.blue, bold = true },
  ["@comment.warning"] = { fg = p.yellow, bold = true },
  ["@comment.error"] = { fg = p.red, bold = true },
  ["@diff.plus"] = { link = "Added" },
  ["@diff.minus"] = { link = "Removed" },
  ["@diff.delta"] = { link = "Changed" },

  -- LSP
  LspReferenceText = { bg = p.bg2 },
  LspReferenceRead = { bg = p.bg2 },
  LspReferenceWrite = { bg = p.bg2, underline = true },
  LspInlayHint = { fg = p.gray0, italic = true },
  LspCodeLens = { fg = p.gray1 },
  LspSignatureActiveParameter = { fg = p.fg_bright, bold = true },

  -- Diagnostics: the only loud colors
  DiagnosticError = { fg = p.red },
  DiagnosticWarn = { fg = p.yellow },
  DiagnosticInfo = { fg = p.blue },
  DiagnosticHint = { fg = p.gray2 },
  DiagnosticOk = { fg = p.green },
  DiagnosticVirtualTextError = { fg = p.red, bg = p.vt_error },
  DiagnosticVirtualTextWarn = { fg = p.yellow, bg = p.vt_warn },
  DiagnosticVirtualTextInfo = { fg = p.blue, bg = p.vt_info },
  DiagnosticVirtualTextHint = { fg = p.gray2, bg = p.bg1 },
  DiagnosticUnderlineError = { sp = p.red, undercurl = true },
  DiagnosticUnderlineWarn = { sp = p.yellow, undercurl = true },
  DiagnosticUnderlineInfo = { sp = p.blue, undercurl = true },
  DiagnosticUnderlineHint = { sp = p.gray2, undercurl = true },
  DiagnosticUnnecessary = { fg = p.gray1 },
  DiagnosticDeprecated = { strikethrough = true },

  -- Telescope
  TelescopeNormal = { fg = p.fg, bg = p.bg },
  TelescopeBorder = { fg = p.bg3, bg = p.bg },
  TelescopePromptNormal = { fg = p.fg_bright, bg = p.bg },
  TelescopePromptBorder = { fg = p.gray0, bg = p.bg },
  TelescopePromptPrefix = { fg = p.accent },
  TelescopePromptCounter = { fg = p.gray1 },
  TelescopeTitle = { fg = p.gray2, bold = true },
  TelescopeSelection = { fg = p.fg_bright, bg = p.bg2 },
  TelescopeSelectionCaret = { fg = p.accent, bg = p.bg2 },
  TelescopeMultiSelection = { fg = p.accent },
  TelescopeMatching = { fg = p.accent, bold = true },
  TelescopePreviewLine = { bg = p.bg2 },

  -- Gitsigns
  GitSignsAdd = { fg = p.green },
  GitSignsChange = { fg = p.yellow },
  GitSignsDelete = { fg = p.red },

  -- blink.cmp
  BlinkCmpMenuBorder = { link = "FloatBorder" },
  BlinkCmpLabelMatch = { fg = p.accent, bold = true },
  BlinkCmpKind = { fg = p.gray2 },
  BlinkCmpSource = { fg = p.gray1 },
  BlinkCmpGhostText = { fg = p.gray0, italic = true },
}

for name, opts in pairs(groups) do
  vim.api.nvim_set_hl(0, name, opts)
end

-- :terminal colors
local term = { p.bg, p.red, p.green, p.yellow, p.blue, p.gray2, p.accent, p.fg }
for i, c in ipairs(term) do
  vim.g["terminal_color_" .. (i - 1)] = c
  vim.g["terminal_color_" .. (i + 7)] = c
end
vim.g.terminal_color_8 = p.gray1
vim.g.terminal_color_15 = p.fg_bright
