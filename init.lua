vim.opt.rtp:prepend(vim.fn.stdpath "config" .. "/void")

vim.g.void_accent = "green" -- "green" | "amber"
vim.o.background = "dark" -- "dark" | "light";
vim.cmd.colorscheme "void"

require ("options")
require ("mappings")
require ("plugins")

-- vim.api.nvim_create_autocmd("VimEnter", {
--   callback = function()
--     if vim.fn.argc() == 0 then
--       vim.schedule(function ()
--         require("telescope.builtin").find_files()
--       end)
--     end
--   end,
-- })

