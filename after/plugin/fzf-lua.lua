local found, fzf_lua = pcall(require, "fzf-lua")

if not found then
    return
end

fzf_lua.setup({
    defaults = {
        file_icons = false,
        winopts = {
            col = 0.50,
            row = 0.35,
            width = 0.90,
            height = 0.85,
            backdrop = false,  -- disable backdrop
        },
    },
    fzf_opts = {
        ["--layout"] = "default",
        ["--cycle"] = true,
    },
    keymap = {
        builtin = {
            ["<M-p>"] = "toggle-preview",
            ["<C-f>"] = "preview-down",
            ["<C-b>"] = "preview-up",
        },
    },
    files = {
        formatter = "path.filename_first",
        cwd_prompt = false,
    },
    fzf_colors = true,
})

local map = vim.keymap.set

local exclusive_file_patterns = {
    "%.bmp", "%.png", "%.jpg", "%.gif", "%.img",  -- images
    "%.iso", "%.zip", "%.7z", "%.rar", "%.gz", "%.tar", "%.gzip", "%.bz2", "%.tgz", "%.xz",  -- extract files
    "%.wav", "%.mp3",  -- audio files
    "%.mp4", "%.avi", "%.flv", "%.mkv", "%.swf", "%.srt",  -- video files
    "%.chm", "%.epub", "%.pdf", "%.mobi", "%.ttf",  -- binary text files
    "%.mdd", "%.mdx",  -- binary dictionary files
    "venv", "__pycache__", ".git",  -- directories
    "tags",  -- `ctags` generated file
    "GPATH", "GRTAGS", "GTAGS",  -- `GNU global` generated files
}

local gen_cmd_with_efp = function()
    -- NOTE: Assuming that `riggrep` must have been installed
    local cmd = {}

    if vim.fn.executable("fd") == 1 then
        table.insert(cmd, "fd --color=never --type f --type l")
        for _, val in ipairs(exclusive_file_patterns) do
            table.insert(cmd, "--exclude " .. val)
        end
    else
        table.insert(cmd, "rg --color=never --files")
        for _, val in ipairs(exclusive_file_patterns) do
            table.insert(cmd, "-g '!" .. val .. "'")
        end
    end

    return table.concat(cmd, ' ')
end

local search_all_files = function()
    fzf_lua.files({
        prompt = "Files❯ ",
        cmd = gen_cmd_with_efp(),
        hidden = false,
        no_ignore = false,
        follow = false,
    })
end

local search_all_files_include_hiddens = function()
    fzf_lua.files({
        prompt = "AllFiles❯ ",
        cmd = gen_cmd_with_efp(),
        hidden = true,
        no_ignore = true,
        follow = false,
    })
end

local neovim_config = function()
    fzf_lua.files({
        prompt = "NvimConfig❯ ",
        cwd = "~/.config/nvim",
        cwd_header = false,
    })
end

---------------------------- NOTE: keymaps below ------------------------------

local opts = { noremap = true, silent = true }
map("n", "<leader>ff", search_all_files, opts)
map("n", "<leader>fF", search_all_files_include_hiddens, opts)
map("n", "<leader>fo", neovim_config, opts)
map("n", "<leader>h", fzf_lua.help_tags, opts)
map("n", "<C-p>", fzf_lua.git_files, opts)
map("n", "<leader>s", function()
    fzf_lua.grep({ hidden = true })
end, opts)
map("n", "<leader>S", function()
    fzf_lua.grep_cword({ hidden = true })
end, opts)
