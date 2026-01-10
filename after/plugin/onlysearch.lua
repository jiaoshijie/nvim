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
        word = '-u',
        kind = ' [U] --no-ignore',
    },
    {
        word = '-uu',
        kind = ' [UU] --no-ignore --hidden',
    },
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
    {
        word = '-E',
        kind = ' [E] Specify the text encoding'
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
    common = {
        engine = engine,
        search_leave_insert = true,
        keyword = "48-57,-,a-z,A-Z,.,_,=",
        handle_sys_clipboard_paste = true,
    },
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
    engine = {
        cmd = engine,
        args = args,
        complete = complete,
    }
})

-- :Os | :horizontal Os | :vertical Os | :tab OS
vim.api.nvim_create_user_command('Os', function(opt)
    local open_cmd = #opt.mods ~= 0 and opt.mods .. ' new' or nil
    onlysearch.toggle(open_cmd)
end, { nargs = 0 })
