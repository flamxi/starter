local sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff'},
    lualine_c = {
      {
        'filename',
        file_status = true,
        newfile_status = true,
        path = 0,
        shorting_target = 40,
        symbols = {
          modified = '[+]',
          readonly = '[-]',
          unnamed = '[No Name]',
          newfile = '[New]',
        }
      }
    },
    lualine_x = {
      {
        'lsp_status',
          icon = '', -- f013
          symbols = {
            spinner = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' },
            done = '✓',
            separator = ' ',
          },
          ignore_lsp = {},
          show_name = true,
      },
      {
        'diagnostics',

        -- Table of diagnostic sources, available sources are:
        --   'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
        -- or a function that returns a table as such:
        --   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
        sources = { 'nvim_diagnostic'},

        -- Displays diagnostics for the defined severity types
        sections = { 'error', 'warn', 'info', 'hint' },

        diagnostics_color = {
          -- Same values as the general color option can be used here.
          error = 'DiagnosticError', -- Changes diagnostics' error color.
          warn  = 'DiagnosticWarn',  -- Changes diagnostics' warn color.
          info  = 'DiagnosticInfo',  -- Changes diagnostics' info color.
          hint  = 'DiagnosticHint',  -- Changes diagnostics' hint color.
        },
        symbols = {error = 'E', warn = 'W', info = 'I', hint = 'H'},
        colored = false, -- Displays diagnostics status in color if set to true.
        update_in_insert = false, -- Update diagnostics in insert mode.
        always_visible = true,   -- Show diagnostics even if there are none.
      },
      'filetype',
      -- 'encoding',
      --{
      -- 'fileformat',
      --    symbols = {
      --      linux = '',
      --      unix  = '',
      --      mac = '',
      --    }
      --},
    },
    lualine_y = {'encoding', 'progress'},
    lualine_z = {}
}

local lualine = require("lualine")
lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'void',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
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
        'WinEnter',
        'BufEnter',
        'BufWritePost',
        'SessionLoadPost',
        'FileChangedShellPost',
        'VimResized',
        'Filetype',
        'CursorMoved',
        'CursorMovedI',
        'ModeChanged',
      },
    }
  },
  sections = sections,
  inactive_sections = {},
  tabline = {
    lualine_a = {"tabs"},
    lualine_b = {{'buffers', mode = 2, symbols = {alternate_file = ''}}},
    lualine_c = {},
    lualine_e = {},
    lualine_x = {},
    lualine_z = {{'datetime', style = '%H:%M'}},
  },
  winbar = {
  },
  inactive_winbar = {
  },
  extensions = {
    'mason', 'fzf', 'man', 'toggleterm'
  },
}
