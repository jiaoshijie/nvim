let mapleader=' '
let maplocalleader=','

inoremap <C-j> <C-[>
noremap <C-j> <C-[>
" do nothing(normal visual select operator-wait)
noremap s <Nop>
noremap S <Nop>
nnoremap <Space> <Nop>

nnoremap <silent> <leader>fo :call utils#Jsj_openFile('~/.vim', 'vimrc')<CR>

"----------------------------------------------------------------------
" Normal mode
"----------------------------------------------------------------------

nnoremap <leader><leader> <C-^>
nnoremap <silent> <C-l> :nohl<cr><C-l>
nnoremap <leader>/ /\<\><left><left>
nnoremap <silent> <leader>fm :call utils#Jsj_openFile(
      \ '~/Downloads/GDrive/NOTE', 'index.md')<cr>
nnoremap <silent> <leader>ff :call utils#Jsj_openFile('.', '')<cr>
nnoremap <silent> <C-p> :call utils#fzfGit('')<cr>
nnoremap <silent> Q q:
nnoremap Y y$

nnoremap <silent> <leader>fc :call utils#JsjClearSE()<cr>

" 打开语法检查
nnoremap <silent> <leader>ps :setlocal spell! spelllang=en_us<CR>

" 透明背景和取消, 需要终端可以透明
nnoremap <silent> <leader>tt :call utils#Change_theme_alpha()<CR>

" set coding gbk or utf-8
nnoremap <silent> <leader>eu :e ++enc=utf8<CR>
nnoremap <silent> <leader>eg :e ++enc=gbk<CR>

nnoremap <leader>s :lvimgrep  %<Left><Left>
nnoremap <leader>S :grep 

nnoremap <silent> gc :<C-u>call sCommenter#Toggle_Comment(v:count1)<cr>
vnoremap <silent> gc :<C-u>call sCommenter#Toggle_Comment(line("'>") - line("'<") + 1)<cr>

tnoremap <Esc> <c-\><c-n>

"----------------------------------------------------------------------
" Quickfix&localist
"----------------------------------------------------------------------

nnoremap <silent> <leader>qq :call utils#Jsj_ToggleList('quickfix', 'c')<cr>
nnoremap <silent> <leader>ql :call utils#Jsj_ToggleList('loclist', 'l')<cr>

"----------------------------------------------------------------------
" utils
"----------------------------------------------------------------------

nnoremap <m-j> :m .+1<cr>==
nnoremap <m-k> :m .-2<cr>==
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y "+y$
nnoremap <leader>d "_d
vnoremap <leader>d "_d
