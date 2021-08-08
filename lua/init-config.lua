local o = vim.o

vim.g.mapleader = ' '
vim.g.maplocalleader = ','

vim.g.python_host_prog = '/usr/bin/python2'
vim.g.python3_host_prog = '/usr/bin/python3'

-- for netrw
-- vim.g.loaded_netrw             = 1
-- vim.g.loaded_netrwPlugin       = 1
-- vim.g.loaded_netrwSettings     = 1
-- vim.g.loaded_netrwFileHandlers = 1
vim.g.netrw_banner = 0  -- disable annoying banner
vim.g.netrw_browse_split = 0
vim.g.netrw_altv=1  -- open splits to the right
vim.g.netrw_alto=0
vim.g.netrw_liststyle=0  -- tree view
vim.g.netrw_winsize=25
vim.g.netrw_preview=1
vim.g.netrw_localrmdir='rm -r'
vim.g.netrw_hide=0
vim.cmd[[let g:netrw_list_hide='\(^\|\s\s\)\zs\.\S\+']]
vim.api.nvim_exec([[
  augroup Jsj_netrw_delete
    au!
    autocmd FileType netrw setl bufhidden=delete " or use :qa!
  augroup END
]], false)
-- vim.cmd[[let g:netrw_list_hide.=netrw_gitignore#Hide()]]

vim.cmd([[
if &diff
  set diffopt=vertical,algorithm:histogram,indent-heuristic
endif
]])

vim.api.nvim_exec([[
augroup jsj_code_warning
  autocmd!
  autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|BUG\|XXX\)')
  autocmd Syntax * call matchadd('Debug', '\W\zs\(INFO\|DONE\|NOTICE\)')
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
augroup neovim_terminal
    autocmd!
    " Enter Terminal-mode (insert) automatically
    autocmd TermOpen * startinsert
    " Disables number lines on terminal buffers
    autocmd TermOpen * :set nonumber norelativenumber
    " allows you to use Ctrl-c on terminal window
    autocmd TermOpen * nnoremap <buffer> <C-c> i<C-c>
augroup END
]], false)

vim.api.nvim_exec([[
function! Fcitx2en()
   if system("fcitx5-remote") == 2
      call system("fcitx5-remote -c")
   endif
endfunction

if has('unix')
  augroup jsj_Fcitx_toggle
    autocmd!
    autocmd InsertLeave * call Fcitx2en()
  augroup END
endif
]], false)

vim.cmd[[command! -nargs=0 CheckHlGroupUnderCursor :lua require("init-utils").Jsj_CheckHlGroup()]]

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
