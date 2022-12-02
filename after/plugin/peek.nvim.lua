require('peek').setup({
  auto_load = false,
  close_on_bdelete = false,
  syntax = true,
  theme = 'light', -- 'dark' or 'light'
  update_on_change = false,
})

vim.api.nvim_create_user_command('PeekToggle', function()
  if require('peek').is_open() then
    require('peek').close()
  else
    require('peek').open()
  end
end, {})
