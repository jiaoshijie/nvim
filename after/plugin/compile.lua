local found, compile = pcall(require, "compile")

if not found then
    return
end

vim.api.nvim_create_user_command("Ls", compile.ls, { nargs = 0 })

vim.api.nvim_create_user_command("C", function(args)
    compile.compile(args.args, nil, {
        debug = args.bang,
        on_output_hook_fn = function(_, _, lines)
            return vim.tbl_map(function(line)
                -- strip common ansi escape codes
                return line:gsub('\27%[[0-9;]-[mK]', '')
            end, lines)
        end,
    })
end, { nargs = "+", complete = "shellcmdline", bang = true })

vim.api.nvim_create_user_command("Cnorm", function(args)
    local cwd = nil
    local stat = vim.uv.fs_stat(args.args)
    if stat and stat.type == "directory" then
        cwd = vim.fs.abspath(args.args)
    end

    local bufnr = vim.api.nvim_get_current_buf()
    local lcfg = { debug = args.bang, cwd = cwd }
    if vim.b[bufnr].compile_modifiable then
        compile.norm_rw(bufnr, lcfg)
    else
        compile.norm_ro(bufnr, lcfg)
    end
end, { nargs = "?", bang = true, complete = "dir" })

require("compile.tools.grep").create_user_command("Grep")
require("compile.tools.git_grep").create_user_command("GGrep")
require("compile.tools.rg").create_user_command("Rg")
