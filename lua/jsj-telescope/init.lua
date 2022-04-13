local map = vim.keymap.set

local actions = require('telescope.actions')
local action_layout = require "telescope.actions.layout"

require('telescope').setup{
  defaults = {
    prompt_prefix = "🔭 ",
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
        ["<C-g>"] = actions.close,
        ["<C-e>"] = actions.results_scrolling_down,
        ["<C-y>"] = actions.results_scrolling_up,

        ["<M-p>"] = action_layout.toggle_preview,
        ["<M-m>"] = action_layout.toggle_mirror,
      },
      n = {
        ["<C-e>"] = actions.results_scrolling_down,
        ["<C-y>"] = actions.results_scrolling_up,
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
  },
}

require('telescope').load_extension('fzf')
-- require('telescope').load_extension('notify')

local opts = { noremap = true, silent = true }

map('n', '<leader>fr', function() require("telescope.builtin").oldfiles() end, opts)
map('n', '<leader>fg', function() require("telescope.builtin").git_files() end, opts)

map('n', '<C-p>', function() require("telescope.builtin").grep_string() end, opts)
map('n', '<leader>s', function() require("telescope.builtin").current_buffer_fuzzy_find() end, {noremap = true, silent = true})
map('n', '<leader>S', function() require("telescope.builtin").live_grep() end, opts)

map('n', '<leader>bb', function() require("telescope.builtin").buffers() end, opts)
map('n', '<leader>ct', function() require("telescope.builtin").tags() end, opts)
map('n', '<leader>m', function() require("telescope.builtin").marks() end, opts)
map('n', '<leader>h', function() require("telescope.builtin").help_tags() end, opts)

vim.cmd([[command! -nargs=1 -complete=file TF :Telescope find_files cwd=<args>]])
-- map('n', '<leader>F', '<cmd>Telescope find_files cwd=', { noremap = true } )

map('n', '<leader>fo', function() require("jsj-telescope.functions").Jsj_neovim_config() end, opts)
map('n', '<leader>ff', function() require("jsj-telescope.functions").Jsj_search_all_files() end, opts)
map('n', '<leader>fm', function() require("jsj-telescope.functions").Jsj_open_Notes() end, opts)
map('n', '<leader>pc', function() require("jsj-telescope.functions").Jsj_open_Code() end, opts)
