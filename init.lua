vim.opt.rtp:prepend(vim.fn.stdpath "config" .. "/void")

vim.g.void_accent = "green" -- "green" | "amber"
vim.o.background = "dark" -- "dark" | "light"; :VoidToggle switches at runtime
vim.cmd.colorscheme "void"

vim.schedule(function()
  require ("options")
  require ("mappings")
  require ("plugins")
end)

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argc() == 0 then
      vim.schedule(function ()
        require("telescope.builtin").find_files()
      end)
    end
  end,
})

