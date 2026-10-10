local function run_build(name, cmd, cwd)
  local result = vim.system(cmd, { cwd = cwd }):wait()
  if result.code ~= 0 then
    local stderr = result.stderr or ''
    local stdout = result.stdout or ''
    local output = stderr ~= '' and stderr or stdout
    if output == '' then output = 'No output from build command.' end
    vim.notify(('Build failed for %s:\n%s'):format(name, output), vim.log.levels.ERROR)
  end
end

vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name = ev.data.spec.name
    local kind = ev.data.kind
    if kind ~= 'install' and kind ~= 'update' then return end

    if name == 'telescope-fzf-native.nvim' and vim.fn.executable 'make' == 1 then
      run_build(name, { 'make' }, ev.data.path)
      return
    end

    if name == 'LuaSnip' then
      if vim.fn.has 'win32' ~= 1 and vim.fn.executable 'make' == 1 then run_build(name, { 'make', 'install_jsregexp' }, ev.data.path) end
      return
    end

    if name == 'nvim-treesitter' then
      if not ev.data.active then vim.cmd.packadd 'nvim-treesitter' end
      vim.cmd 'TSUpdate'
      return
    end
  end,
})



vim.pack.add({
  "https://github.com/rebelot/kanagawa.nvim",
  "https://github.com/saghen/blink.cmp",
  "https://github.com/L3MON4D3/LuaSnip",
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/nvim-lualine/lualine.nvim",
  "https://github.com/tiagovla/scope.nvim",
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
	},
  {
    src = "https://github.com/nvim-telescope/telescope.nvim",
    dependencies = {
        "https://github.com/nvim-lua/plenary.nvim",
        "https://github.com/nvim-telescope/telescope-ui-select.nvim",
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    }
  },
  {
    src = "https://github.com/nvim-telescope/telescope-file-browser.nvim",
    dependencies = {
        "https://github.com/nvim-lua/plenary.nvim",
        "https://github.com/nvim-telescope/telescope.nvim",
    },
  },
	"https://www.github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",
  "https://github.com/mason-org/mason-lspconfig.nvim",
  "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",

  "https://github.com/lewis6991/gitsigns.nvim",

	-- "https://github.com/obsidian-nvim/obsidian.nvim",
	"https://github.com/mrcjkb/rustaceanvim",
})

require "setups.dev_icons"
require "setups.tree_sitter"
require "setups.lsp"
require "setups.telescope"

-- require "setups.kanagawa"
vim.opt.rtp:prepend(vim.fn.stdpath "config" .. "/void")
vim.g.void_accent = "green" -- "green" | "amber"
vim.o.background = "dark" -- "dark" | "light"; :VoidToggle switches at runtime
vim.cmd.colorscheme "void"

require "setups.lualine"

require('gitsigns').setup()
-- require("scope").setup()

