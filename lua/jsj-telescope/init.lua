local map = vim.api.nvim_set_keymap

local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },

    winblend = 0,

    layout_strategy = "flex",
    layout_config = {
      width = 0.95,
      height = 0.85,
      -- preview_cutoff = 120,
      prompt_position = "bottom",

      horizontal = {
        -- width_padding = 0.1,
        -- height_padding = 0.1,
        preview_width = function(_, cols, _)
          if cols > 200 then
            return math.floor(cols * 0.4)
          else
            return math.floor(cols * 0.6)
          end
        end,
      },

      vertical = {
        -- width_padding = 0.05,
        -- height_padding = 1,
        width = 0.9,
        height = 0.95,
        preview_height = 0.5,
      },

      flex = {
        horizontal = {
          preview_width = 0.9,
        },
        vertical = {
          preview_height = 0.5,
        },
      },
    },

    selection_strategy = "reset",
    sorting_strategy = "descending",
    scroll_strategy = "cycle",
    color_devicons = true,

    mappings = {
      i = {
        -- ["<C-x>"] = false,
        ["<esc>"] = actions.close,
      },
      n = {
      },
    },
  },

  borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },

  file_ignore_patterns = {},

  file_previewer = require("telescope.previewers").vim_buffer_cat.new,
  grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
  qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    },
    file_browser = {
      -- theme = 'ivy',
    },
  },
}

require('telescope').load_extension('fzf')
require('telescope').load_extension('notify')
require('telescope').load_extension('zoxide')
require("telescope").load_extension('file_browser')

local opts = { noremap = true, silent = true }

map('n', '<leader>fr', '<cmd>lua require("telescope.builtin").oldfiles()<cr>', opts)
map('n', '<leader>fg', '<cmd>lua require("telescope.builtin").git_files()<cr>', opts)
-- map('n', '<leader>fb', '<cmd>lua require("telescope.builtin").file_browser()<cr>', opts)

map('n', '<C-p>', '<cmd>lua require("telescope.builtin").grep_string()<cr>', opts)
map('n', '<leader>s', '<cmd>lua require("telescope.builtin").live_grep()<cr>', opts)
map('n', '<leader>S', '<cmd>lua require("telescope.builtin").current_buffer_fuzzy_find()<cr>', {noremap = true, silent = true})

map('n', '<leader>bb', '<cmd>lua require("telescope.builtin").buffers()<cr>', opts)
map('n', '<leader>ct', '<cmd>lua require("telescope.builtin").tags()<cr>', opts)
map('n', '<leader>mm', '<cmd>lua require("telescope.builtin").marks()<cr>', opts)

-- Vista
map('n', '<leader>vl', '<cmd>Vista finder<cr>', opts)
map('n', '<leader>vv', '<cmd>Vista finder!<cr>', opts)

vim.cmd([[command! -nargs=1 -complete=file TF :Telescope find_files cwd=<args>]])
-- map('n', '<leader>F', '<cmd>Telescope find_files cwd=', { noremap = true } )

map('n', '<leader>fo', '<cmd>lua require("jsj-telescope.functions").Jsj_neovim_config()<cr>', opts)
map('n', '<leader>ff', '<cmd>lua require("jsj-telescope.functions").Jsj_search_all_files()<cr>', opts)
map('n', '<leader>fm', '<cmd>lua require("jsj-telescope.functions").Jsj_open_Notes()<cr>', opts)
map('n', '<leader>pc', '<cmd>lua require("jsj-telescope.functions").Jsj_open_Code()<cr>', opts)
map('n', '<leader>fj', "<cmd>lua require'telescope'.extensions.zoxide.list{}<cr>", opts)
map('n', '<leader>fb', "<cmd>lua require 'telescope'.extensions.file_browser.file_browser()<CR>", opts)
