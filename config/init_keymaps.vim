" do nothing(normal visual select operator-wait)
noremap s <Nop>
noremap S <Nop>
nnoremap <Space> <Nop>

nnoremap <silent> <leader>fo :call utils#Jsj_openFile('~/.vim', 'vimrc')<CR>

"----------------------------------------------------------------------
" Command mode
"----------------------------------------------------------------------

cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-a> <Home>
cnoremap <m-b> <S-Left>
cnoremap <m-f> <S-Right>

"----------------------------------------------------------------------
" Visual mode
"----------------------------------------------------------------------

xnoremap <  <gv
xnoremap >  >gv

"----------------------------------------------------------------------
" 基本 Normal mode
"----------------------------------------------------------------------

nnoremap <silent> <leader><cr> :nohl<cr>
nnoremap <leader>/ /\<\><left><left>
nnoremap <silent> <leader>fm :call utils#Jsj_openFile(
      \ '~/Downloads/GDrive/NOTE', 'index.md')<cr>
nnoremap <silent> <leader>ff :call utils#Jsj_openFile('.', '')<cr>
nnoremap <silent> <leader>fg :call utils#fzfGit('')<cr>
nnoremap <silent> Q q:
nnoremap Y y$

nnoremap <silent> <leader>fc :call utils#JsjClearSE(0)<cr>
nnoremap <silent> <leader>ft :call utils#JsjClearSE(1)<cr>

" 打开语法检查
nnoremap <silent> <leader>ps :setlocal spell! spelllang=en_us<CR>

" 透明背景和取消, 需要终端可以透明
nnoremap <silent> <leader>tt :call utils#Change_theme_alpha()<CR>

" set coding gbk or utf-8
nnoremap <silent> <leader>eu :e ++enc=utf8<CR>
nnoremap <silent> <leader>eg :e ++enc=gbk<CR>

" ctags: 查看函数定义的位置
nnoremap gD <C-]>

nnoremap <C-p> :grep <C-r><C-w><Cr>
nnoremap <leader>s :lvimgrep  %<Left><Left>
nnoremap <leader>S :grep 

nnoremap <silent> gc :<C-u>call sCommenter#Toggle_Comment(v:count1)<cr>
vnoremap <silent> gc :<C-u>call sCommenter#Toggle_Comment(line("'>") - line("'<") + 1)<cr>

"----------------------------------------------------------------------
" window(窗口) 相关
"----------------------------------------------------------------------

" 改变选中的窗口
noremap <m-H> <c-w>h
noremap <m-L> <c-w>l
noremap <m-J> <c-w>j
noremap <m-K> <c-w>k

set termwinkey=<c-_>
tnoremap <m-H> <c-_>h
tnoremap <m-L> <c-_>l
tnoremap <m-J> <c-_>j
tnoremap <m-K> <c-_>k
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
