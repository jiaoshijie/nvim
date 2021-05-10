inoremap <C-j> <Esc>
xnoremap <C-j> <Esc>
snoremap <C-j> <Esc>
onoremap <C-j> <Esc>

" do nothing(normal visual select operator-wait)
noremap s <Nop>
noremap S <Nop>
nnoremap cc <Nop>
nnoremap <Space> <Nop>

"----------------------------------------------------------------------
" Insert mode
"----------------------------------------------------------------------

inoremap <C-b> <Left>
inoremap <C-f> <Right>
" Recover from accidental Ctrl-U
" http://vim.wikia.com/wiki/Recover_from_accidental_Ctrl-U
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

"----------------------------------------------------------------------
" Command mode
"----------------------------------------------------------------------

cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
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

nnoremap <silent> <F2> :edit ~/.vim/vimrc<CR>

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
nnoremap <silent> <leader>fm :e ~/Nutstore\ Files/Nutstore/MARKDOWN_NOTE/index.md<cr>
nnoremap <silent> <leader>= mIgg=G'ImI

function! JsjClearSE()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//ge
    %s/\(\n\)\+\%$//ge
    call cursor(l, c)
endfunction

nnoremap <silent> <leader>fc :call JsjClearSE()<cr>


" 打开语法检查
nnoremap <silent> <leader>o :setlocal spell! spelllang=en_us<CR>

" 透明背景和取消, 需要终端可以透明
nnoremap <silent> <leader>tt :call Change_theme_alpha()<CR>

" 文本和16进制模式切换
nnoremap <silent> <leader>xd :%!xxd<CR>
nnoremap <silent> <leader>xr :%!xxd -r<CR>

" set coding gbk or utf-8
nnoremap <silent> <leader>eu :e ++enc=utf8<CR>
nnoremap <silent> <leader>eg :e ++enc=gbk<CR>

" 代码折叠自定义快捷键 <leader>zz for more ":h za zc zo zA zC zO"
let g:FoldMethod = 0
map <leader>cz :call ToggleFold()<cr>
fun! ToggleFold()
    if g:FoldMethod == 0
        exe "normal! zM"
        let g:FoldMethod = 1
    else
        exe "normal! zR"
        let g:FoldMethod = 0
    endif
endfun

" For more details using ":h cs"
" find this C symbol
nnoremap <silent> gC :cs find s <C-R>=expand("<cword>")<CR><CR> :botright copen<CR><CR>
" Jump to references
nnoremap <silent> gr :cs find c <C-R>=expand("<cword>")<CR><CR> :botright copen<CR><CR>
" goto the function implementation
nnoremap <silent> gi :cs find g <C-R>=expand("<cword>")<CR><CR>

" ctags: 查看函数定义的位置
nnoremap gD <C-]>

nnoremap <C-p> :grep <C-r><C-w><Cr>
nnoremap <leader>s :grep 
nnoremap <leader>S :lvimgrep  %<Left><Left>

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

set termwinkey=<c-_>
tnoremap <m-H> <c-_>h
tnoremap <m-L> <c-_>l
tnoremap <m-J> <c-_>j
tnoremap <m-K> <c-_>k
tnoremap <Esc> <c-\><c-n>

" 调整窗口大小
nnoremap <silent> <Up> <C-w>5+
nnoremap <silent> <Down> <C-w>5-
nnoremap <silent> <Right> <C-w>5>
nnoremap <silent> <Left> <C-w>5<

"----------------------------------------------------------------------
" buffer 相关
"----------------------------------------------------------------------

nnoremap <silent> <leader>bd :bdelete %<CR>

"----------------------------------------------------------------------
" Tab 相关
"----------------------------------------------------------------------

nnoremap <silent> <leader>td :tabclose<CR>
nnoremap <silent> <leader>to :tabonly<cr>

"----------------------------------------------------------------------
" Quickfix&localist
"----------------------------------------------------------------------

nnoremap <silent> <leader>qq :copen<cr>
nnoremap <silent> <leader>ql :lopen<cr>
