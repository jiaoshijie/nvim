local found, ffmk = pcall(require, "ffmk")

if not found then
    return
end

local kit = require('kit')
local map = vim.keymap.set
local map_opts = { noremap = true, silent = true }
local files_cmd = {}
local neovim_config_cmd = {
    ignore_patterns = {
        "queries/", "after/ftplugin/",
    },
}

local files = function()
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

local all_files = function()
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

local conf_files = function()
    ffmk.files({
        ui = { preview = false },
        cmd = {
            prompt = "NvimConf❯ ",
            cmd = kit.find_files_cmd(neovim_config_cmd),
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

local grep_word = function()
    local word = vim.fn.expand("<cword>")

    if type(kit.v.ffmk_grep_word_func) == "function" then
        kit.v.ffmk_grep_word_func(word)
    else
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
end

local grep = function()
    local ok, word = pcall(vim.fn.input, "Grep> ")
    if not ok or word == "" then
        return
    end

    if type(kit.v.ffmk_grep_func) == "function" then
        kit.v.ffmk_grep_func(word)
    else
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
end

local ctags = function()
    if type(kit.v.ffmk_ctags_func) == "function" then
        kit.v.ffmk_ctags_func()
    else
        ffmk.ctags({
            ui = { preview = true },
            cmd = { options = { "--kinds-c=-e-m+p" } },
        })
    end
end

map("n", "<C-p>", ctrlp, map_opts)
map("n", "<leader>ff", files, map_opts)
map("n", "<leader>fF", all_files, map_opts)
map("n", "<leader>fo", conf_files, map_opts)
map("n", "<leader>h", function() ffmk.helptags({ ui = { preview = true } }) end, map_opts)
map("n", "<leader>s", grep, map_opts)
map("n", "<leader>S", grep_word, map_opts)

vim.api.nvim_create_user_command("Ctags", ctags, { nargs = 0 })

---------------------------- GNU global stuffs -------------------------------
local gtags_cmd = function(args)
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
end
local gtags_comp = function(_, _, _)
    return { "r", "f", "g", "s" }
end

local gtags_gd_cmd = function(args)
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
end
local gtags_gd_comp = function(_, cmdline, _)
    -- NOTE: this implemetation is ugly, but it works
    local _, e = cmdline:find("Gd%s+")
    local pattern = cmdline:sub(e + 1)
    if pattern == "" then
        return vim.fn.systemlist("global -cd")
    end
    return vim.fn.matchfuzzy(vim.fn.systemlist("global -cd"), pattern)
end
local gtags_gd = function()
    ffmk.gnu_global({
        ui = { preview = true },
        cmd = {
            query = vim.fn.expand("<cword>"),
            feat = require('ffmk.config').gnu_global_feats.definition,
        },
    })
end

if vim.fn.executable("global") == 1 then
    map("n", "gd", gtags_gd, map_opts)

    vim.api.nvim_create_user_command("Gtags", gtags_cmd, { nargs = 1, complete = gtags_comp })
    vim.api.nvim_create_user_command("Gd", gtags_gd_cmd, { nargs = '*', complete = gtags_gd_comp })
end
