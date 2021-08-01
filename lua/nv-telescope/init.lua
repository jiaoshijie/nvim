local map = vim.api.nvim_set_keymap

local actions = require('telescope.actions')

require('telescope').setup{
  defaults = {
    prompt_prefix = "❯ ",
    selection_caret = "❯ ",

    winblend = 0,

    layout_strategy = "horizontal",
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
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    },
  },
}

require('telescope').load_extension('fzy_native')

function Jsj_search_all_files()
  require('telescope.builtin').find_files {
    prompt_prefix = '🔍 ',
    find_command = { 'rg', '--no-ignore', '--files' },
  }
end

function Jsj_neovim_config()
  require('telescope.builtin').find_files {
    prompt_title = "~ neovim config ~",
    prompt_prefix = "Nvim> ",
    cwd = "~/.config/nvim",
  }
end

function Jsj_open_Code()
  require('telescope.builtin').find_files {
    prompt_title = "~ Code ~",
    prompt_prefix = "Code> ",
    cwd = '~/Downloads/Code',
  }
end

function Jsj_open_Notes()
  require('telescope.builtin').find_files {
    prompt_title = "~ Notes ~",
    prompt_prefix = "Notes> ",
    cwd = '~/Nutstore Files/Nutstore/MARKDOWN_NOTE',
  }
end

local opts = { noremap = true, silent = true }

map('n', '<F2>', ':lua Jsj_neovim_config()<cr>', opts)
map('n', '<leader>ff', ':lua Jsj_search_all_files()<cr>', opts)
map('n', '<leader>fr', ':lua require("telescope.builtin").oldfiles()<cr>', opts)
map('n', '<leader>fg', ':lua require("telescope.builtin").git_files()<cr>', opts)

map('n', '<C-p>', ':lua require("telescope.builtin").grep_string()<cr>', opts)
map('n', '<leader>s', ':lua require("telescope.builtin").live_grep()<cr>', opts)
map('n', '<leader>S', ':lua require("telescope.builtin").current_buffer_fuzzy_find()<cr>', {noremap = true, silent = true})

map('n', '<leader>bb', ':lua require("telescope.builtin").buffers()<cr>', opts)
map('n', '<leader>ct', ':lua require("telescope.builtin").tags()<cr>', opts)

map('n', '<leader>fm', ':lua Jsj_open_Notes()<cr>', opts)
map('n', '<leader>pc', ':lua Jsj_open_Code()<cr>', opts)
vim.cmd([[command! -nargs=1 -complete=file TF :Telescope find_files cwd=<args>]])
-- map('n', '<leader>F', ':Telescope find_files cwd=', { noremap = true } )
