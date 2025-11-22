local found, ffmk = pcall(require, "ffmk")
local kit = require('kit')

if not found then
    return
end

local map = vim.keymap.set

local files_cmd = {}

local search_all_files = function()
    ffmk.files({
        ui = { preview = false },
        cmd = {
            prompt = "Files❯ ",
            cmd = kit.find_files_cmd(files_cmd),
            hidden = false,
            no_ignore = false,
            follow = false,
        }
    })
end

local search_all_files_include_hiddens = function()
    ffmk.files({
        ui = { preview = false },
        cmd = {
            prompt = "AllFiles❯ ",
            cmd = kit.find_files_cmd(files_cmd),
            hidden = true,
            no_ignore = true,
            follow = false,
        }
    })
end

local neovim_config = function()
    ffmk.files({
        ui = { preview = false },
        cmd = {
            prompt = "NvimConfig❯ ",
            cwd = "~/.config/nvim",
            hidden = true,
        }
    })
end

local git_files = function()
    local cwd = vim.fn.systemlist('git rev-parse --show-toplevel')[1]
    if vim.v.shell_error ~= 0 then
        kit.echo_err_msg("Not in a git repo!")
        return
    end
    ffmk.files({
        ui = { preview = false },
        cmd = {
            prompt = "GitFiles❯ ",
            cmd = "git ls-files --others --exclude-standard --cached | uniq",
            cwd = cwd,
        }
    })
end

local opts = { noremap = true, silent = true }
map("n", "<leader>ff", search_all_files, opts)
map("n", "<leader>fF", search_all_files_include_hiddens, opts)
map("n", "<leader>fo", neovim_config, opts)
map("n", "<leader>h", function()
    ffmk.helptags({ ui = { preview = true } })
end, opts)
map("n", "<C-p>", git_files, opts)
map("n", "<leader>s", function()
    local ok, word = pcall(vim.fn.input, "Grep > ")
    if ok and word ~= "" then
        ffmk.grep({
            ui = { preview = true },
            cmd = {
                query = word,
                hidden = true,
                fixed_string = true,
                extra_options = { "-g '!.git'" },
            }
        })
    end
end, opts)
map("n", "<leader>S", function()
    local word = vim.fn.expand("<cword>")
    if word ~= "" then
        ffmk.grep({
            ui = { preview = true },
            cmd = {
                query = word,
                whole_word = true,
                hidden = true,
                fixed_string = true,
                extra_options = { "-g '!.git'" },
            }
        })
    end
end)
