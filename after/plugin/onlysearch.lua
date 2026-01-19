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

local query = {}

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
    query.filters = "!.git/"
end

onlysearch.setup({
    common = {
        engine = engine,
        search_leave_insert = true,
        query_history_size = 20,
        keyword = "48-57,-,a-z,A-Z,.,_,=",
        handle_sys_clipboard_paste = true,
    },
    keymaps = {
        normal = {
            ['<cr>'] = 'select_entry',
            ['='] = 'toggle_lines',
            ['<leader>='] = 'clear_all_selected_items',
            ['Q'] = 'send2qf',
            ['S'] = 'search',
            ['<leader>qo'] = 'query_hist_open',
            ['<leader>qa'] = 'query_hist_add',
            ['<leader>qc'] = 'query_hist_close',
            ['<leader>qw'] = 'query_hist_win_switch',
        },
        visual = {
            ['='] = 'toggle_lines',
        },
    },
    engine = {
        cmd = engine,  -- NOTE: can be an absolute path, like `/usr/bin/rg`
        args = args,
        complete = complete,
    }
})

-- :Os | :horizontal Os | :vertical Os | :tab OS
vim.api.nvim_create_user_command('Os', function(opt)
    local open_cmd = #opt.mods ~= 0 and opt.mods .. ' new' or nil
    onlysearch.toggle(open_cmd, query)
end, { nargs = 0 })

vim.api.nvim_create_user_command('Ow', function(opt)
    local open_cmd = #opt.mods ~= 0 and opt.mods .. ' new' or nil
    onlysearch.toggle(open_cmd, vim.tbl_extend("force", query, {
        text = vim.fn.expand("<cword>"),
        flags = "-w",
    }))
end, { nargs = 0 })
