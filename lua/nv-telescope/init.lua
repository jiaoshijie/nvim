local actions = require('telescope.actions')
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
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker,
    mappings = {
      i = {
        -- ["<C-x>"] = false,
        ["<esc>"] = actions.close,
      },
    },
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    }
  },
}

require('telescope').load_extension('fzy_native')

function Jsj_search_all_files()
  require('telescope.builtin').find_files {
    find_command = { 'rg', '--no-ignore', '--files' },
  }
end

function Jsj_neovim_config()
  require('telescope.builtin').find_files {
    prompt_title = "~ neovim config ~",
    prompt_prefix = "Nvim> ",
    shorten_path = false,
    cwd = "~/.config/nvim",
  }
end

function Jsj_open_Code()
  require('telescope.builtin').find_files {
    prompt_title = "~ Code ~",
    prompt_prefix = "Code> ",
    shorten_path = false,
    cwd = '~/Downloads/Code',
  }
end

function Jsj_open_Notes()
  require('telescope.builtin').find_files {
    prompt_title = "~ Notes ~",
    prompt_prefix = "Notes> ",
    shorten_path = false,
    cwd = '~/Nutstore Files/Nutstore/MARKDOWN_NOTE',
  }
end

vim.api.nvim_set_keymap('n', '<F2>', ':lua Jsj_neovim_config()<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>ff', ':lua Jsj_search_all_files()<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fr', ':lua require("telescope.builtin").oldfiles()<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fg', ':lua require("telescope.builtin").git_files()<cr>', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<C-p>', ':lua require("telescope.builtin").grep_string()<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>s', ':lua require("telescope.builtin").live_grep()<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>S', ':lua require("telescope.builtin").current_buffer_fuzzy_find()<cr>', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<leader>bb', ':lua require("telescope.builtin").buffers()<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>cf', ':lua require("telescope.builtin").lsp_document_symbols()<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>ct', ':lua require("telescope.builtin").tags()<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'gea', ':lua require("telescope.builtin").lsp_document_diagnostics()<cr>', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<leader>fm', ':lua Jsj_open_Notes()<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>pc', ':lua Jsj_open_Code()<cr>', {noremap = true, silent = true})
