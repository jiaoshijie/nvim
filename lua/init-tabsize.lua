local o = vim.o

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

vim.api.nvim_exec([[
  augroup jsj_SpecialTab
    autocmd!
    autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4
  augroup END
]], false)
