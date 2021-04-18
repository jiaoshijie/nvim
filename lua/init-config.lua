local o = vim.o

vim.g.mapleader = ' '
vim.g.maplocalleader = ','

vim.g.python_host_prog = '/usr/bin/python2'
vim.g.python3_host_prog = '/usr/bin/python3'

-- for netrw

vim.g.loaded_netrw             = 1
vim.g.loaded_netrwPlugin       = 1
vim.g.loaded_netrwSettings     = 1
vim.g.loaded_netrwFileHandlers = 1

vim.cmd([[
if &diff
  set diffopt=vertical,algorithm:histogram,indent-heuristic
endif
]])

vim.api.nvim_exec([[
augroup jsj_code_warning
  autocmd!
  autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|DONE\|XXX\|BUG\|HACK\|???!!!\)')
  autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|NOTICE\)')
augroup END
]], false)

o.backup = false
o.writebackup = true
o.backupext = ".bak"
o.backupdir = "~/.config/nvim/tmp/backup//,."

vim.cmd('set noswapfile')
o.directory = "~/.config/nvim/tmp/swp//,."

vim.cmd('set undofile')
o.undodir = "/tmp/neovim_u/undodir//,."

vim.api.nvim_exec([[
if ! isdirectory(expand('$HOME/.config/nvim/tmp/swp'))
  silent! call mkdir(expand('$HOME/.config/nvim/tmp/swp'), 'p', 0700)
endif
if ! isdirectory(expand('$HOME/.config/nvim/tmp/backup'))
  silent! call mkdir(expand('$HOME/.config/nvim/tmp/backup'), 'p', 0700)
endif
if ! isdirectory(expand('/tmp/neovim_u/undodir'))
  silent! call mkdir(expand('/tmp/neovim_u/undodir'), 'p', 0700)
endif
]], false)

vim.api.nvim_exec([[
augroup jsj_useful_settings
  autocmd!
  " 打开到上次编辑的位置
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  autocmd VimLeave *.tex !texclear %
  autocmd BufRead,BufNewFile *.S,*.s setlocal filetype=gas
  autocmd BufNewFile,BufRead *.tex setlocal filetype=tex nolinebreak
  autocmd BufNewFile,BufRead *.md,*.rmd setlocal nolinebreak
augroup END
]], false)

vim.api.nvim_exec([[
function! Fcitx2en()
   if system("fcitx5-remote") == 2
      let l:a = system("fcitx5-remote -c")
   endif
endfunction

if has('unix')
  augroup jsj_Fcitx_toggle
    autocmd!
    autocmd InsertLeave * call Fcitx2en()
  augroup END
endif
]], false)

--[[ ctags, cscope --]]
o.tags = "./tags,tags"
o.csprg = "/usr/bin/cscope"
o.csto = 1
o.cst = true
o.switchbuf = "useopen"
o.cscopequickfix = "s-,c-,d-,i-,t-,e-,a-"
vim.api.nvim_exec([[
if filereadable("cscope.out")
  set noautochdir
  " 将数据库文件连接到vim, if don't have "silent", add database pointed to by environment
  silent cs add cscope.out
elseif $CSCOPE_DB != ""
  silent cs add $CSCOPE_DB
endif
]], false)
