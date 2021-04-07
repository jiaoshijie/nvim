-- require('telescope').load_extension('media_files')
require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_position = "bottom",
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_defaults = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    shorten_path = true,
    winblend = 0,
    width = 0.75,
    preview_cutoff = 120,
    results_height = 1,
    results_width = 0.8,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  },
}

vim.api.nvim_set_keymap('n', '<leader>ff', ':lua require("telescope.builtin").find_files()<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fr', ':lua require("telescope.builtin").oldfiles()<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fg', ':lua require("telescope.builtin").git_files()<cr>', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<C-p>', ':lua require("telescope.builtin").grep_string()<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>ss', ':lua require("telescope.builtin").live_grep()<cr>', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<leader>bb', ':lua require("telescope.builtin").buffers()<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>bl', ':lua require("telescope.builtin").current_buffer_fuzzy_find()<cr>', {noremap = true, silent = true})
