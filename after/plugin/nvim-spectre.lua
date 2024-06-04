local found, spectre = pcall(require, "spectre")

if not found then
  return
end

local command = vim.api.nvim_create_user_command

command("Sr", spectre.toggle, { nargs = 0 })
