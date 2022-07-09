inoremap <C-j> <Esc>
noremap <C-j> <Esc>

" do nothing(normal visual select operator-wait)
noremap s <Nop>
noremap S <Nop>
nnoremap <Space> <Nop>

nnoremap <silent> <leader>fo :call utils#Jsj_openFile('~/.vim', 'vimrc')<CR>

"----------------------------------------------------------------------
" Insert mode
"----------------------------------------------------------------------
" Recover from accidental Ctrl-U
" http://vim.wikia.com/wiki/Recover_from_accidental_Ctrl-U
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
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
" "F" 区功能键
"----------------------------------------------------------------------

" ctags: 查看函数定义的位置
nnoremap <F12> g]

"----------------------------------------------------------------------
" 基本 Normal mode
"----------------------------------------------------------------------

" 滚动Speed up scrolling of the viewport slightly
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>

nnoremap <silent> <leader><cr> :nohl<cr>
nnoremap <leader>/ /\<\><left><left>
nnoremap <silent> <leader>fm :call utils#Jsj_openFile(
      \ '~/Nutstore\ Files/Nutstore/MARKDOWN_NOTE', 'index.md')<cr>
nnoremap <silent> <leader>ff :call utils#Jsj_openFile('.', '')<cr>
nnoremap <silent> <leader>fg :call utils#fzfGit('')<cr>
nnoremap <silent> <leader>= mIgg=G'ImI
nnoremap <silent> Q q:
nnoremap <silent> Y y$
nnoremap <silent> n nzzzv
nnoremap <silent> N Nzzzv
nnoremap <silent> J mJJ`JmJ
nnoremap <silent> gp `[v`]

nnoremap <silent> <leader>fc :call utils#JsjClearSE(0)<cr>
nnoremap <silent> <leader>ft :call utils#JsjClearSE(1)<cr>

" 打开语法检查
nnoremap <silent> <leader>ps :setlocal spell! spelllang=en_us<CR>

" 透明背景和取消, 需要终端可以透明
nnoremap <silent> <leader>tt :call utils#Change_theme_alpha()<CR>

" 文本和16进制模式切换
nnoremap <silent> <leader>xd :%!xxd<CR>
nnoremap <silent> <leader>xr :%!xxd -r<CR>

" set coding gbk or utf-8
nnoremap <silent> <leader>eu :e ++enc=utf8<CR>
nnoremap <silent> <leader>eg :e ++enc=gbk<CR>

" 代码折叠自定义快捷键 for more `:h za zc zo zA zC zO zM zR`

" For more details using `:h cs`
" find this C symbol
nnoremap <silent> gC :cs find s <C-R>=expand("<cword>")<CR><CR> :botright copen<CR><CR>
" Jump to references
nnoremap <silent> gr :cs find c <C-R>=expand("<cword>")<CR><CR> :botright copen<CR><CR>
" goto the function implementation
nnoremap <silent> gi :cs find g <C-R>=expand("<cword>")<CR><CR>

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

" 窗口分屏
nnoremap <leader>w/ <C-w>v
nnoremap <leader>w- <C-w>s

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
