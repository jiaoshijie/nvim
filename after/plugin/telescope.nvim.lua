local found, telescope = pcall(require, "telescope")

if not found then
    return
end

local map = vim.keymap.set

local actions = require("telescope.actions")
local action_layout = require("telescope.actions.layout")
local previewers = require("telescope.previewers")
local builtin = require("telescope.builtin")
-- local themes = require("telescope.themes")

telescope.setup({
    defaults = {
        prompt_prefix = "🔭 ",
        selection_caret = " ",
        path_display = { "filename_first" },

        winblend = 0,

        layout_strategy = "flex",
        -- preview = false,
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

        file_previewer = previewers.vim_buffer_cat.new,
        grep_previewer = previewers.vim_buffer_vimgrep.new,
        qflist_previewer = previewers.vim_buffer_qflist.new,

        file_ignore_patterns = {},
    },

})

local search_all_files = function()
    builtin.find_files({
        prompt_title = "~ find files ~",
        find_command = { "rg", "--files" },
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

local search_all_files_include_hiddens = function()
    builtin.find_files({
        prompt_title = "~ find files with hiddens ~",
        find_command = { "rg", "--files", "--hidden", "--no-ignore" },
        file_ignore_patterns = {
            "%.bmp", "%.png", "%.jpg", "%.gif", "%.img",
            "%.iso", "%.zip", "%.7z", "%.rar", "%.gz", "%.tar", "%.gzip", "%.bz2", "%.tgz", "%.xz",
            "%.wav", "%.mp3",
            "%.chm", "%.epub", "%.pdf", "%.mobi", "%.ttf",
            "%.mp4", "%.avi", "%.flv", "%.mkv", "%.swf", "%.srt",
            "%.mdd", "%.mdx",
            "venv", "__pycache__", ".git",
        },
    })
end

local jsj_search_file_pattern = nil  -- NOTE: case sensitive and insensitive both use this variable to do previous search
local search_files_with_pattern = function(case_insensitive)
    local ok, pattern = pcall(vim.fn.input, string.format("%s", jsj_search_file_pattern ~= nil and "Pattern(" .. jsj_search_file_pattern .. ") > " or "Pattern > "))
    if not ok then
        vim.api.nvim_err_writeln("Search Files With Pattern Are Canceled!!!")
        return
    end

    pattern = vim.fn.trim(pattern)
    if string.len(pattern) == 0 then
        if jsj_search_file_pattern == nil then
            vim.api.nvim_err_writeln("No Pattern Provided")
            return
        end
        pattern = jsj_search_file_pattern
    else
        jsj_search_file_pattern = pattern
    end

    pattern = vim.fn.split(pattern)
    local command = { "rg", "--files", "--hidden", "--no-ignore" }

    local c = "c"
    if case_insensitive == true then
        table.insert(command, "--glob-case-insensitive")
        c = "i"
    end

    for _, p in ipairs(pattern) do
        table.insert(command, "-g")
        table.insert(command, p)
    end

    builtin.find_files({
        prompt_title = string.format("~ P(%s): [%s] ~", c, jsj_search_file_pattern),
        find_command = command,
    })
end

local neovim_config = function()
    builtin.find_files({
        prompt_title = "~ neovim config ~",
        prompt_prefix = "Nvim> ",
        cwd = "~/.config/nvim",
    })
end

local open_Notes = function()
    if vim.fn.isdirectory(vim.fn.expand("~/Downloads/GDrive/NOTE")) == 1 then
        builtin.find_files({
            prompt_title = "~ Notes ~",
            prompt_prefix = "Notes> ",
            cwd = "~/Downloads/GDrive/NOTE",
            file_ignore_patterns = {
                "%.bmp", "%.png", "%.jpg", "%.gif", "%.img",
            },
        })
    else
        vim.api.nvim_err_writeln("Directory `~/Downloads/GDrive/NOTE` doesn't exist!!!")
    end
end

local pretty_git_files = function()
    xpcall(builtin.git_files, function()
        vim.api.nvim_err_writeln("Not in git repo!!!")
    end, { show_untracked = true }, false)
end

---------------------------- NOTE: keymaps below ------------------------------

local opts = { noremap = true, silent = true }

map("n", "<leader>s", function()
    local ok, word = pcall(vim.fn.input, "Grep > ")
    if ok and word ~= "" then
        builtin.grep_string({ search = word, additional_args = { "--hidden" } })
    end
end, opts)
map("n", "<leader>S", function()
    local word = vim.fn.expand("<cword>")
    if word ~= "" then
        builtin.grep_string({ search = word, additional_args = { "--hidden" } })
    end
end)

map("n", "<leader>h", builtin.help_tags, opts)

map("n", "<leader>fo", neovim_config, opts)
map("n", "<leader>fm", open_Notes, opts)

map("n", "<C-p>", pretty_git_files, opts)
map("n", "<leader>ff", search_all_files, opts)
map("n", "<leader>fF", search_all_files_include_hiddens, opts)
map("n", "<leader>fp", function() search_files_with_pattern(false) end, opts)  -- case sensitive
map("n", "<leader>fP", function() search_files_with_pattern(true) end, opts)   -- case insensitive
