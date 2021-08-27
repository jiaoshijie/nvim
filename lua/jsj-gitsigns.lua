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
  watch_index = {
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

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<leader>ga', ':Gitsigns stage_hunk<cr>', opts)
map('n', '<leader>gn', ':Gitsigns next_hunk<cr>', opts)
map('n', '<leader>gp', ':Gitsigns prev_hunk<cr>', opts)
map('n', '<leader>gs', ':Gitsigns select_hunk<cr>', opts)
map('n', '<leader>gua', ':Gitsigns undo_stage_hunk<cr>', opts)
map('n', '<leader>gP', ':Gitsigns preview_hunk<cr>', opts)
map('n', '<leader>gB', ':Gitsigns stage_buffer<cr>', opts)
map('n', '<leader>gub', ':Gitsigns reset_buffer_index<cr>', opts)
map('n', '<leader>gb', ':Gitsigns toggle_current_line_blame<cr>', opts)
map('n', '<leader>gh', ':Gitsigns toggle_linehl<cr>', opts)
