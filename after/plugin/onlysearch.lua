local found, onlysearch = pcall(require, "onlysearch")

if not found then
    return
end

local engine = 'rg'

if vim.fn.executable(engine) ~= 1 then
    engine = 'grep'
end

onlysearch.setup({
    engine = engine,
    engine_config = {},
    open_cmd = "vnew",
})

-- vim.api.nvim_create_user_command("Os", function()
--     onlysearch.toggle()
-- end, { nargs = 0 })
vim.keymap.set('n', 'S', onlysearch.toggle, { silent = true, noremap = true })
