local found, undotree = pcall(require, 'undotree')

if not found then
    return
end

vim.api.nvim_create_user_command('Undotree', undotree.toggle, { nargs = 0 })
