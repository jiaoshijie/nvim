local found, peek = pcall(require, "peek")

if not found then
  return
end

peek.setup({
  auto_load = false,
  close_on_bdelete = false,
  syntax = true,
  theme = 'light', -- 'dark' or 'light'
  update_on_change = false,
})

vim.api.nvim_create_user_command('PeekToggle', function()
  if peek.is_open() then
    peek.close()
  else
    peek.open()
  end
end, {})
