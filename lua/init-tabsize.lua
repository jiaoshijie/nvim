local o = vim.o
local bo = vim.bo

o.smarttab = true
o.shiftround = true

-- bo.shiftwidth = 2
-- bo.tabstop = 2
-- bo.expandtab = true
-- bo.softtabstop = 2

vim.cmd("set shiftwidth=2")
vim.cmd("set tabstop=2")
vim.cmd("set expandtab")
vim.cmd("set softtabstop=2")
