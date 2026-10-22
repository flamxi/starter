local sections = {
  lualine_a = { "mode" },
  lualine_b = { "branch", "diff" },
  lualine_c = {
    {
      "filename",
      file_status = true,
      newfile_status = true,
      path = 0,
      shorting_target = 40,
      symbols = {
        modified = "[+]",
        readonly = "[-]",
        unnamed = "[No Name]",
        newfile = "[New]",
      },
    },
  },
  lualine_x = {
    {
      "lsp_status",
      icon = "", -- f013
      symbols = {
        spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
        done = "✓",
        separator = " ",
      },
      ignore_lsp = {},
      show_name = true,
    },
    -- {
    --   'diagnostics',
    --   sources = { 'nvim_diagnostic'},
    --   sections = { 'error', 'warn', 'info', 'hint' },
    --
    --   diagnostics_color = {
    --     error = 'DiagnosticError', -- Changes diagnostics' error color.
    --     warn  = 'DiagnosticWarn',  -- Changes diagnostics' warn color.
    --     info  = 'DiagnosticInfo',  -- Changes diagnostics' info color.
    --     hint  = 'DiagnosticHint',  -- Changes diagnostics' hint color.
    --   },
    --   symbols = {error = 'E', warn = 'W', info = 'I', hint = 'H'},
    --   colored = false, -- Displays diagnostics status in color if set to true.
    --   update_in_insert = false, -- Update diagnostics in insert mode.
    --   always_visible = true,   -- Show diagnostics even if there are none.
    -- },
    "encoding",
    "filetype",
    --{
    -- 'fileformat',
    --    symbols = {
    --      linux = '',
    --      unix  = '',
    --      mac = '',
    --    }
    --},
  },
  lualine_y = { "location", "progress" },
  lualine_z = {},
}

local lualine = require "lualine"
lualine.setup {
  options = {
    icons_enabled = true,
    -- theme = '',
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = false,
    always_show_tabline = true,
    globalstatus = true,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
      refresh_time = 16, -- ~60fps
      events = {
        "WinEnter",
        "BufEnter",
        "BufWritePost",
        "SessionLoadPost",
        "FileChangedShellPost",
        "VimResized",
        "Filetype",
        "CursorMoved",
        "CursorMovedI",
        "ModeChanged",
      },
    },
  },
  sections = sections,
  inactive_sections = {},
  tabline = {
    lualine_a = { "tabs", { "buffers", mode = 2, symbols = { alternate_file = "" } } },
    lualine_b = {},
    lualine_c = {},
    lualine_e = {},
    lualine_x = {
      {
        -- Nerd Font: nf-md-weather_night (U+F0594) / nf-md-white_balance_sunny (U+F05A8)
        function()
          return vim.o.background == "light" and "\243\176\150\148" or "\243\176\150\168"
        end,

        on_click = function()
          print(vim.o.background)
          if vim.o.background == "dark" then
            vim.o.background = "light"
            vim.cmd.colorscheme "catppuccin-latte"
          else
            vim.o.background = "dark"
            vim.cmd.colorscheme "catppuccin-frappe"
          end
        end,
      },
    },
    lualine_z = { { "datetime", style = "%H:%M" } },
  },
  winbar = {},
  inactive_winbar = {},
  extensions = {
    "mason",
    "fzf",
    "man",
    "toggleterm",
  },
}
