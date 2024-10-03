local found, undotree = pcall(require, 'undotree')

if not found then
    return
end

undotree.setup({
    float_diff = true,      -- set this `true` will disable layout option
    layout = "left_bottom", -- "left_bottom", "left_left_bottom"
    position = "left",
    ignore_filetype = { 'Undotree', 'UndotreeDiff', 'qf', 'TelescopePrompt', 'spectre_panel', 'tsplayground' },
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

-- vim.keymap.set('n', '<leader>uo', undotree.open, { noremap = true, silent = true })
-- vim.keymap.set('n', '<leader>uc', undotree.close, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>u', undotree.toggle, { noremap = true, silent = true })
