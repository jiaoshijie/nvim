local found, com = pcall(require, "compile")

if not found then
    return
end

vim.api.nvim_create_user_command("Ls", function()
    com.ls(true)
end, { nargs = 0 })

vim.api.nvim_create_user_command("ComNormRO", function()
    com.norm_ro(vim.api.nvim_get_current_buf(), {})
end, { nargs = 0 })

vim.api.nvim_create_user_command("ComNormRW", function()
    com.norm_rw(vim.api.nvim_get_current_buf(), {})
end, { nargs = 0 })
