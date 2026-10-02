return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "cpp",
        "go",
        "rust",
        "markdown",
        "markdown_inline",
      },
    },
  },
  -- {
  --   "metalelf0/black-metal-theme-neovim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("black-metal").setup {
  --       -- optional configuration here
  --     }
  --     require("black-metal").load()
  --   end,
  -- },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {},
  },
}
