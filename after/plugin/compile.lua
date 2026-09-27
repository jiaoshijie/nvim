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
                -- `:h vim.paste`
                return line:gsub('\27%[[0-9;mK]+', '')
            end, lines)
        end,
    })
end, { nargs = "+", complete = "shellcmdline", bang = true })

vim.api.nvim_create_user_command("CNorm", function(args)
    if args.bang then
        compile.norm_rw(vim.api.nvim_get_current_buf(), {})
    else
        compile.norm_ro(vim.api.nvim_get_current_buf(), {})
    end
end, { nargs = 0, bang = true })

require("compile.tools.grep").setup()
