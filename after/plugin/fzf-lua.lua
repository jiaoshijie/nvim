local found, fzf_lua = pcall(require, "fzf-lua")
local kit = require('kit')

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
    git = {
        files = {
            formatter = "path.filename_first",
            cmd = "git ls-files --others --exclude-standard --cached | uniq",
        },
    },
    fzf_colors = true,
})

local map = vim.keymap.set

local files_cmd = {}

local search_all_files = function()
    fzf_lua.files({
        prompt = "Files❯ ",
        cmd = kit.find_files_cmd(files_cmd),
        hidden = false,
        no_ignore = false,
        follow = false,
    })
end

local search_all_files_include_hiddens = function()
    fzf_lua.files({
        prompt = "AllFiles❯ ",
        cmd = kit.find_files_cmd(files_cmd),
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
