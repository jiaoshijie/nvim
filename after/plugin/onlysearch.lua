local found, onlysearch = pcall(require, "onlysearch")

if not found then
    return
end

local engine = 'rg'
local args = {
    '-S',  -- '--smart-case'
}
local complete = {
    {
        word = '-w',
        kind = ' [W] Match Whole Word',
    },
    {
        word = '-i',
        kind = ' [I] Ignore Case',
    },
    {
        word = '-.',
        kind = ' [A] Search All Files',
    },
    {
        word = '-s',
        kind = ' [i] Case Sensitive',
    },
    {
        word = '-F',
        kind = ' [R] Raw String, Disable RegExp',
    },
    {
        word = '-v',
        kind = ' [V] Invert Match',
    },
    {
        word = '--no-ignore',
        kind = ' [NI] Not Respect Ignore Files, e.g. .gitignore, .ignore',
    },
    {
        word = '--ignore',
        kind = ' [IG] Respect Ignore Files',
    },
}

if vim.fn.executable(engine) ~= 1 then
    engine = 'grep'
    args = {}
    complete = {
        {
            word = '-w',
            kind = ' [W] Match Whole Word',
        },
        {
            word = '-i',
            kind = ' [I] Ignore Case',
        },
        {
            word = '-v',
            kind = ' [V] Invert Match',
        },
    }
end

onlysearch.setup({
    engine = engine,
    engine_config = {
        args = args,
        complete = complete,
    },
    keyword = "48-57,-,a-z,A-Z,.,_,=",
    open_cmd = 'vnew',
    search_leave_insert = true,
    keymaps = {
        normal = {
            ['<cr>'] = 'select_entry',
            ['='] = 'toggle_lines',
            ['<leader>='] = 'clear_all_selected_items',
            ['Q'] = 'send2qf',
            ['<leader>r'] = 'resume_last_query',
            ['S'] = 'search',
        },
        insert = {
            ['<C-f>'] = 'omnifunc',
        },
        visual = {
            ['='] = 'toggle_lines',
        },
    },
})

vim.api.nvim_create_user_command('Os', function()
    onlysearch.toggle()
end, { nargs = 0 })
