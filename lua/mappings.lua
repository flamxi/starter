vim.g.mapleader = " " -- space for leader
vim.g.maplocalleader = " " -- space for localleader

vim.keymap.set("n", ";", ":", { desc = "CMD enter command mode" })
vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- personals
do
  vim.keymap.set("n", "<C-n>", vim.cmd.NvimTreeToggle, { desc = "Toggle Tree" })
  vim.keymap.set("n", "<leader>nt", vim.cmd.tabnew, { desc = "New tab" })
  vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })
  --vim.keymap.set("n", "<leader>t", function()
  --  local name = "unamed"
  --  vim.ui.input({ prompt = "Tab Name: " },
  --  function(input)
  --    if input and input ~= "" then
  --      name = input
  --    end
  --  end)
  --  vim.cmd.tabnew(name)
  --end, { desc = "New tab" })
  vim.keymap.set("n", "<leader><tab>", vim.cmd.tabnext, { desc = "Next tab" })
  -- vim.keymap.set("n", "<s-tab>", vim.cmd.tabprevious, { desc = "Previous tab" })

  vim.keymap.set("n", "<tab>", vim.cmd.bnext, { desc = "Next buffer" })
  vim.keymap.set("n", "<s-tab>", vim.cmd.bprevious, { desc = "Previous buffer" })
  vim.keymap.set("n", "<leader>x", vim.cmd.bdelete, { desc = "Close current buffer"})

  vim.keymap.set("n", "<leader>wv", ":vsplit<CR>", { desc = "Split window vertically" })
  vim.keymap.set("n", "<leader>wh", ":split<CR>", { desc = "Split window horizontally" })

  vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
  vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
  vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
  vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
end

vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

vim.keymap.set("n", "<leader><Up>", ":resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<leader><Down>", ":resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<leader><Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<leader><Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })
vim.keymap.set("n", "<leader>pa", function() -- show file path
        local path = vim.fn.expand("%:p")
        vim.fn.setreg("+", path)
        print("file:", path)
end, { desc = "Copy full file path" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('i', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('i', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('i', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('i', '<down>', '<cmd>echo "Use j to move!!"<CR>')

--


vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function() vim.hl.on_yank() end,
})

vim.diagnostic.config {
  update_in_insert = false,
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  underline = { severity = { min = vim.diagnostic.severity.WARN } },

  -- Can switch between these as you prefer
  virtual_text = true, -- Text shows up at the end of the line
  virtual_lines = false, -- Text shows up underneath the line, with virtual lines

  -- Auto open the float, so you can easily read the errors when jumping with `[d` and `]d`
  jump = {
    on_jump = function(_, bufnr)
      vim.diagnostic.open_float {
        bufnr = bufnr,
        scope = 'cursor',
        focus = false,
      }
    end,
  },
}

vim.diagnostic.enable(true)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set("n", "<leader>td", function()
        vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = "Toggle diagnostics" })
vim.keymap.set("n", "<C-t><C-t>", function() require("void").toggle() end, { desc = "Toggle void dark/light" })
