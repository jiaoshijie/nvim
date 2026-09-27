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

vim.api.nvim_create_user_command("CNorm", function(args)
    local norm = args.bang and compile.norm_rw or compile.norm_ro
    local cwd = nil

    local stat = vim.uv.fs_stat(args.args)

    if stat and stat.type == "directory" then
        cwd = vim.fs.abspath(args.args)
    end

    local bufnr = vim.api.nvim_get_current_buf()

    norm(bufnr, {
        debug = vim.b[bufnr].compile_plugin_debug,
        cwd = cwd,
    })
end, { nargs = "?", bang = true, complete = "dir" })

require("compile.tools.grep").setup()
require("compile.tools.git_grep").setup()
require("compile.tools.rg").setup()
