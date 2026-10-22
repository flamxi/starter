require("gitsigns").setup()
require("mini.comment").setup()

require("which-key").setup()
require("toggleterm").setup {
  open_mapping = [[<c-\>]], -- normal, insert and terminal mode
  direction = "float",
  float_opts = { border = "curved" },
}

require("smear_cursor").setup {
  stiffness = 1.0, -- 0.6      [0, 1]
  trailing_stiffness = 0.7, -- 0.45     [0, 1]
  stiffness_insert_mode = 0.7, -- 0.5      [0, 1]
  trailing_stiffness_insert_mode = 0.7, -- 0.5      [0, 1]
  damping = 0.95, -- 0.85     [0, 1]
  damping_insert_mode = 0.95, -- 0.9      [0, 1]
  distance_stop_animating = 0.5,
  time_interval = 7,
}

require("conform").setup {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "isort", "black" },
    rust = { "rustfmt", lsp_format = "fallback" },
    json = { "jq", lsp_format = "fallback" },
    cpp = { "clang-format", lsp_format = "fallback" },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_format = "fallback",
  },
}
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format { bufnr = args.buf }
  end,
})
