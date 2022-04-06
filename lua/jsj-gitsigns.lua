require('gitsigns').setup {
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '▎', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '▎', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '▶', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '▶', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '▎', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
  numhl = false,
  linehl = false,
  keymaps = {
    -- Default keymap options
    noremap = true,
    buffer = true,
  },
  watch_gitdir = {
    interval = 1000
  },
  current_line_blame = false,
  current_line_blame_opts = {
    delay = 500,
    virt_text_pos = 'eol',
  },
  sign_priority = 6,
  update_debounce = 200,
  status_formatter = nil, -- Use default
}

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map('n', '<leader>ga', '<cmd>Gitsigns stage_hunk<cr>', opts)
map('n', '<leader>gn', '<cmd>Gitsigns next_hunk<cr>', opts)
map('n', '<leader>gp', '<cmd>Gitsigns prev_hunk<cr>', opts)
map('n', '<leader>gs', '<cmd>Gitsigns select_hunk<cr>', opts)
map('n', '<leader>gua', '<cmd>Gitsigns undo_stage_hunk<cr>', opts)
map('n', '<leader>gP', '<cmd>Gitsigns preview_hunk<cr>', opts)
map('n', '<leader>gB', '<cmd>Gitsigns stage_buffer<cr>', opts)
map('n', '<leader>gub', '<cmd>Gitsigns reset_buffer_index<cr>', opts)
map('n', '<leader>gb', '<cmd>Gitsigns toggle_current_line_blame<cr>', opts)
map('n', '<leader>gh', '<cmd>Gitsigns toggle_linehl<cr>', opts)
