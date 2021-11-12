local o = vim.opt

vim.g.mapleader = ' '
vim.g.maplocalleader = ','

vim.g.python_host_prog = '/usr/bin/python2'
vim.g.python3_host_prog = '/usr/bin/python3'

-- for netrw
-- vim.g.loaded_netrw             = 1
-- vim.g.loaded_netrwPlugin       = 1
-- vim.g.loaded_netrwSettings     = 1
-- vim.g.loaded_netrwFileHandlers = 1
-- https://vonheikemen.github.io/devlog/tools/using-netrw-vim-builtin-file-explorer/
vim.g.netrw_banner       = 0  -- disable annoying banner
vim.g.netrw_browse_split = 0
vim.g.netrw_altv         = 1  -- open splits to the right
vim.g.netrw_alto         = 0
vim.g.netrw_liststyle    = 0  -- tree view
vim.g.netrw_winsize      = 25
vim.g.netrw_preview      = 1
vim.g.netrw_localrmdir   = 'rm -r'
vim.g.netrw_hide         = 1
vim.g.netrw_keepdir      = 0
vim.g.netrw_localcopydircmd = 'cp -r'
vim.g.netrw_list_hide    = "\\(^\\|\\s\\s\\)\\zs\\.\\S\\+"
-- vim.cmd[[let g:netrw_list_hide='\(^\|\s\s\)\zs\.\S\+']]
-- vim.cmd[[let g:netrw_list_hide=netrw_gitignore#Hide()]]

vim.api.nvim_exec([[
  augroup Jsj_netrw_delete
    au!
    autocmd FileType netrw setl bufhidden=delete " or use :qa!
  augroup END
]], false)

if vim.wo.diff then
  o.diffopt:append('vertical,algorithm:histogram,indent-heuristic')
end

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

o.swapfile = false
o.directory = "~/.config/nvim/tmp/swp//,."

o.undofile = true
o.undodir = "/tmp/neovim_u/undodir//,."

if vim.fn.isdirectory(vim.fn.expand('$HOME/.config/nvim/tmp/swp')) ~= 1 then
  vim.cmd [[silent! call mkdir(expand('$HOME/.config/nvim/tmp/swp'), 'p', 0700)]]
end
if vim.fn.isdirectory(vim.fn.expand('$HOME/.config/nvim/tmp/backup')) ~= 1 then
  vim.cmd [[silent! call mkdir(expand('$HOME/.config/nvim/tmp/backup'), 'p', 0700)]]
end
if vim.fn.isdirectory(vim.fn.expand('/tmp/neovim_u/undodir')) ~= 1 then
  vim.cmd [[silent! call mkdir(expand('/tmp/neovim_u/undodir'), 'p', 0700)]]
end

vim.api.nvim_exec([[
augroup jsj_useful_settings
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  autocmd VimLeave *.tex !texclear %
augroup END
]], false)

vim.api.nvim_exec([[
augroup neovim_terminal
    autocmd!
    " autocmd TermOpen * startinsert
    autocmd TermOpen * :setlocal nonumber norelativenumber

    " NOTICE: allows you to use Ctrl-c on terminal window
    autocmd TermOpen * nnoremap <buffer> <C-c> i<C-c>
augroup END
]], false)

if vim.fn.has('unix') then
  vim.api.nvim_exec([[
    augroup jsj_Fcitx_toggle
      autocmd!
      autocmd InsertLeave * lua require('init-utils').fcitx2en()
    augroup END
  ]], false)
end

vim.cmd[[command! -nargs=0 CheckHlGroupUnderCursor :lua require("init-utils").Jsj_CheckHlGroup()]]

--[[ ctags, cscope --]]
o.tags = "./tags,tags"
o.csprg = "/usr/bin/cscope"
o.csto = 1
o.cst = true
o.switchbuf = "useopen"
o.cscopequickfix = "s-,c-,d-,i-,t-,e-,a-"

if vim.fn.filereadable('cscope.out') ~= 0 then
  o.autochdir = false
  vim.cmd [[silent cs add cscope.out]]
elseif vim.fn.expand('$CSCOPE_DB') ~= '$CSCOPE_DB' then
  vim.cmd [[silent cs add $CSCOPE_DB]]
end
