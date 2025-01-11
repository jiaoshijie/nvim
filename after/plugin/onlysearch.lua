local found, onlysearch = pcall(require, "onlysearch")

if not found then
    return
end

local engine = 'rg'
local args = {}
local complete = {
    {
        word = '-w',
        kind = ' [W] Match Whole Word',
    },
    {
        word = '-i',
        kind = ' [I] Ignore Case'
    },
    {
        word = '-.',
        kind = ' [A] Search All Files'
    },
}

if vim.fn.executable(engine) ~= 1 then
    engine = 'grep'
    complete = {
        {
            word = '-w',
            kind = ' [W] Match Whole Word',
        },
        {
            word = '-i',
            kind = ' [I] Ignore Case'
        },
    }
end

onlysearch.setup({
    engine = engine,
    engine_config = {
        args = args,
        complete = complete,
    },
    open_cmd = 'vnew',
})

vim.api.nvim_create_user_command("Os", function()
    onlysearch.toggle()
end, { nargs = 0 })
