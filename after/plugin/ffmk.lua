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

local ctrlp = function()
    if type(kit.v.ffmk_ctrlp_func) == "function" then
        kit.v.ffmk_ctrlp_func()
    else
        git_files()
    end
end

local opts = { noremap = true, silent = true }
pcall(map, "n", "<C-p>", ctrlp, opts)
map("n", "<leader>ff", search_all_files, opts)
map("n", "<leader>fF", search_all_files_include_hiddens, opts)
map("n", "<leader>fo", neovim_config, opts)
map("n", "<leader>h", function()
    ffmk.helptags({ ui = { preview = true } })
end, opts)
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
    ffmk.grep({
        ui = { preview = true },
        cmd = {
            query = vim.fn.expand("<cword>"),
            whole_word = true,
            hidden = true,
            fixed_string = true,
            extra_options = { "-g '!.git'" },
        }
    })
end)
vim.api.nvim_create_user_command("Ctags", function()
    require('ffmk').ctags({
        ui = { preview = true },
        cmd = { options = { "--kinds-c=-e-m+p" } },
    })
end, { nargs = 0 })

if vim.fn.executable("global") == 1 then
    vim.api.nvim_create_user_command("Gtags", function(args)
        local arg = args.args
        local feats = require('ffmk.config').gnu_global_feats
        local feat = nil

        if arg == "f" then
            feat = feats.file_symbols
        elseif arg == "r" then
            feat = feats.reference
        elseif arg == "s" then
            feat = feats.other_symbols
        elseif arg == "g" then
            feat = feats.grep_symbols
        else
            print("WARNING: Invalid arg")
            return
        end

        ffmk.gnu_global({
            ui = { preview = true },
            cmd = {
                query = arg ~= "f" and vim.fn.expand("<cword>"),
                feat = feat,
            },
        })
    end, {
        nargs = 1,
        complete = function(_, _, _)
            return { "r", "f", "g", "s" }
        end
    })

    -- NOTE: this command is ugly, but it works
    vim.api.nvim_create_user_command("Gd", function(args)
        local query = args.fargs[#args.fargs]
        if not query then
            query = vim.fn.expand("<cword>")
        end

        ffmk.gnu_global({
            ui = { preview = true },
            cmd = {
                query = query,
                feat = require('ffmk.config').gnu_global_feats.definition,
            },
        })
    end, {
        nargs = '*',
        complete = function(_, cmdline, _)
            local _, e = cmdline:find("Gd%s+")
            local pattern = cmdline:sub(e + 1)
            if pattern == "" then
                return vim.fn.systemlist("global -cd")
            end
            return vim.fn.matchfuzzy(vim.fn.systemlist("global -cd"), pattern)
        end
    })
    map("n", "gd", function()
        ffmk.gnu_global({
            ui = { preview = true },
            cmd = {
                query = vim.fn.expand("<cword>"),
                feat = require('ffmk.config').gnu_global_feats.definition,
            },
        })
    end, opts)
end
