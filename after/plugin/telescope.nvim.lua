local map = vim.keymap.set

local actions = require("telescope.actions")
local action_layout = require("telescope.actions.layout")

require("telescope").setup({
  defaults = {
    prompt_prefix = "🔭 ",
    selection_caret = " ",
    path_display = { "all" },

    winblend = 0,

    layout_strategy = "flex",
    -- preview = false,
    layout_config = {
      width = 0.95,
      height = 0.85,
      -- preview_cutoff = 120,
      prompt_position = "top",

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
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },

    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

    file_ignore_patterns = {},
  },

})

local search_all_files = function()
  require("telescope.builtin").find_files({
    find_command = { "rg", "--no-ignore", "--files" },
    file_ignore_patterns = {
      "%.bmp", "%.png", "%.jpg", "%.gif", "%.img",
      "%.iso", "%.zip", "%.7z", "%.rar", "%.gz", "%.tar", "%.gzip", "%.bz2", "%.tgz", "%.xz",
      "%.wav", "%.mp3",
      "%.chm", "%.epub", "%.pdf", "%.mobi", "%.ttf",
      "%.mp4", "%.avi", "%.flv", "%.mkv", "%.swf", "%.srt",
      "%.mdd", "%.mdx",
      "venv", "__pycache__",
    },
  })
end

local neovim_config = function()
  require("telescope.builtin").find_files({
    prompt_title = "~ neovim config ~",
    prompt_prefix = "Nvim> ",
    cwd = "~/.config/nvim",
  })
end

local open_Notes = function()
  require("telescope.builtin").find_files({
    prompt_title = "~ Notes ~",
    prompt_prefix = "Notes> ",
    cwd = "~/Downloads/GDrive/NOTE",
    file_ignore_patterns = {
      "%.bmp", "%.png", "%.jpg", "%.gif", "%.img",
    },
  })
end

local opts = { noremap = true, silent = true }

map("n", "<leader>fg", function() require("telescope.builtin").git_files({ show_untracked = true }) end, opts)

map("n", "<C-p>", require("telescope.builtin").grep_string, opts)
map("n", "<leader>s", require("telescope.builtin").current_buffer_fuzzy_find, { noremap = true, silent = true })
map("n", "<leader>S", require("telescope.builtin").live_grep, opts)
map("n", "<leader>h", require("telescope.builtin").help_tags, opts)

map("n", "<leader>fo", neovim_config, opts)
map("n", "<leader>ff", search_all_files, opts)
map("n", "<leader>fm", open_Notes, opts)
