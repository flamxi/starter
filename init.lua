vim.loader.enable()

vim.schedule(function()
  require "options"
  require "mappings"
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

