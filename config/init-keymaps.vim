inoremap <C-j> <Esc>
xnoremap <C-j> <Esc>
snoremap <C-j> <Esc>
onoremap <C-j> <Esc>

" do nothing(normal visual select operator-wait)
noremap s <Nop>
noremap S <Nop>

"----------------------------------------------------------------------
" "F" 区功能键
"----------------------------------------------------------------------

nnoremap <silent> <F2> :edit ~/.config/nvim/init.vim<CR>

" ctags: 查看函数定义的位置
nnoremap <F12> <C-]>

"----------------------------------------------------------------------
" Insert mode
"----------------------------------------------------------------------

inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-y> <C-r>+
inoremap <C-d> <del>
" Recover from accidental Ctrl-U
" http://vim.wikia.com/wiki/Recover_from_accidental_Ctrl-U
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

"----------------------------------------------------------------------
" Command mode
"----------------------------------------------------------------------

cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-y> <C-r>+
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <del>
cnoremap <m-b> <S-Left>
cnoremap <m-f> <S-Right>

"----------------------------------------------------------------------
" Visual mode
"----------------------------------------------------------------------

" xnoremap <silent> <leader>a s""<Esc>P
xnoremap <  <gv
xnoremap >  >gv


"----------------------------------------------------------------------
" 基本 Normal mode
"----------------------------------------------------------------------

nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> gj j
nnoremap <silent> gk k
nnoremap <silent> <C-k> D
" 滚动Speed up scrolling of the viewport slightly
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>

" remap U to <C-r> for easier redo
nnoremap U <C-r>

nnoremap <silent> <leader><cr> :nohl<cr>
nnoremap <leader>fs :w<cr>
nnoremap <leader>qq :q<cr>
nnoremap <leader>qa :qall<cr>
nnoremap <silent> <leader>= mIgg=G'ImI

" 打开语法检查
nnoremap <silent> <leader>o :setlocal spell! spelllang=en_us<CR>

" 透明背景和取消, 需要终端可以透明
nnoremap <silent> <leader>cT :call Change_theme_alpha()<CR>

" 文本和16进制模式切换
nnoremap <silent> <leader>xd :%!xxd<CR>
nnoremap <silent> <leader>xr :%!xxd -r<CR>

" set coding gbk or utf-8
nnoremap <silent> <leader>eu :e ++enc=utf8<CR>
nnoremap <silent> <leader>eg :e ++enc=gbk<CR>

" 代码折叠自定义快捷键 <leader>zz
let g:FoldMethod = 0
map <leader>zz :call ToggleFold()<cr>
fun! ToggleFold()
    if g:FoldMethod == 0
        exe "normal! zM"
        let g:FoldMethod = 1
    else
        exe "normal! zR"
        let g:FoldMethod = 0
    endif
endfun

"----------------------------------------------------------------------
" window(窗口) 相关
"----------------------------------------------------------------------

" 窗口分屏
nnoremap <leader>w/ <C-w>v
nnoremap <leader>w- <C-w>s

" 关闭窗口
nnoremap <leader>wo <C-w>o
nnoremap <leader>wd <C-w>c

" 改变选中的窗口
noremap <m-H> <c-w>h
noremap <m-L> <c-w>l
noremap <m-J> <c-w>j
noremap <m-K> <c-w>k
tnoremap <m-H> <c-\><c-n><c-w>h
tnoremap <m-L> <c-\><c-n><c-w>l
tnoremap <m-J> <c-\><c-n><c-w>j
tnoremap <m-K> <c-\><c-n><c-w>k
tnoremap <Esc> <c-\><c-n>

" 移动窗口的位置
nnoremap <silent> <leader>wK <c-w>K
nnoremap <silent> <leader>wJ <c-w>J
nnoremap <silent> <leader>wH <c-w>H
nnoremap <silent> <leader>wL <c-w>L

" 调整窗口大小
nnoremap <silent> <leader>w= <C-w>=
nnoremap <silent> <Up> <C-w>5+
nnoremap <silent> <Down> <C-w>5-
nnoremap <silent> <Right> <C-w>5>
nnoremap <silent> <Left> <C-w>5<

"----------------------------------------------------------------------
" buffer 相关
"----------------------------------------------------------------------

nnoremap <silent> <leader>bp :bprevious<cr>
nnoremap <silent> <leader>bn :bnext<cr>
nnoremap <silent> <leader>bd :bdelete %<CR>

"----------------------------------------------------------------------
" Tab 相关(不习惯用这玩意儿)
"----------------------------------------------------------------------

nnoremap <silent> <leader>td :tabclose<CR>
nnoremap <silent> <leader>to :tabonly<cr>
