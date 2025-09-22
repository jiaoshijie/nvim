local found, undotree = pcall(require, 'undotree')

if not found then
    return
end

undotree.setup({
    float_diff = true,      -- set this `true` will disable layout option
    layout = "left_bottom", -- "left_bottom", "left_left_bottom"
    position = "left",
    ignore_filetype = { 'Undotree', 'UndotreeDiff', 'qf', 'query' },
    window = {
        winblend = 30,
    },
    keymaps = {
        ['j'] = "move_next",
        ['k'] = "move_prev",
        ['J'] = "move_change_next",
        ['K'] = "move_change_prev",
        ['<cr>'] = "action_enter",
        ['p'] = "enter_diffbuf",
        ['q'] = "quit",
    },
})

vim.api.nvim_create_user_command('Undotree', function()
    undotree.toggle()
end, { nargs = 0 })
