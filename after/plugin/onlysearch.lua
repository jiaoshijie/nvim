local found, onlysearch = pcall(require, "onlysearch")

if not found then
    return
end

onlysearch.setup()

-- vim.api.nvim_create_user_command("Os", function()
--     onlysearch.toggle()
-- end, { nargs = 0 })
vim.keymap.set('n', 'S', onlysearch.toggle, { silent = true, noremap = true })
