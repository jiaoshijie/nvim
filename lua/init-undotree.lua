local found, undotree = pcall(require, 'undotree')

if not found then
  vim.api.nvim_err_writeln("not found undotree plugin!!!")
  return
end

undotree.setup({
  float_diff = true,  -- set this `true` will disable layout option
  layout = "left_bottom", -- "left_bottom", "left_left_bottom"
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

-- vim.keymap.set('n', '<leader>uo', require('undotree').open, { noremap = true, silent = true })
-- vim.keymap.set('n', '<leader>uc', require('undotree').close, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>u', require('undotree').toggle, { noremap = true, silent = true })
