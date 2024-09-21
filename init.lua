require("init-basic")
require("init-tabsize")
require("init-keymaps")
require("init-style")
require("lsp")
require("init-pkg")

if vim.fn.filereadable(vim.fn.expand('~/.nvimrc')) == 1 then
  vim.cmd('so ~/.nvimrc')
end


if vim.fn.filereadable('./.nvimrc') == 1 then
  vim.cmd('so ./.nvimrc')
end
