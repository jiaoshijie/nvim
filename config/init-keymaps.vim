inoremap <C-j> <Esc>
xnoremap <C-j> <Esc>
snoremap <C-j> <Esc>
onoremap <C-j> <Esc>

" do nothing(normal visual select operator-wait)
noremap s <Nop>
noremap S <Nop>

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

" 提权保存
if has('nvim')
  cnoremap w!! execute 'silent! write suda://%'
else
  cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
endif

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

xnoremap <silent> <leader>a s""<Esc>P
xnoremap <  <gv
xnoremap >  >gv


"----------------------------------------------------------------------
" "F" 区功能键
"----------------------------------------------------------------------

nnoremap <silent> <F2> :edit ~/.config/nvim/init.vim<CR>

" QuickFix
nnoremap <silent> <F3> :cprevious<cr>
nnoremap <silent> <F4> :cnext<cr>
nnoremap <silent> <F6> :copen<cr>
nnoremap <silent> <F7> :cclose<CR>

if has('nvim')
  " 编译运行
  function! Compile_Run()
    exec "w"
    if &filetype == 'c'
      exec "AsyncRun! -mode=term gcc % -o %< && ./%<"
    elseif &filetype == 'cpp'
      exec "AsyncRun! -mode=term g++ -std=c++11 % -Wall -o %< && ./%<"
    elseif &filetype == 'sh'
      exec "AsyncRun! -mode=term bash %"
    elseif &filetype == 'python'
      let $PYTHONNUNBUFFERED=1
      exec "AsyncRun! -mode=term -raw python3 %"
    elseif &filetype == 'go'
      exec "GoRun"
    elseif &filetype == 'vimwiki'
      exec "AsyncRun! -mode=term pandoc % --pdf-engine=xelatex -o %<.pdf"
    elseif &filetype == 'markdown'
      exec "AsyncRun! -mode=term pandoc % --pdf-engine=xelatex -o %<.pdf"
    endif
  endfunction

  nnoremap <silent> <F5> :call Compile_Run()<cr>
endif

" cscope: F8: 查找字符串 F9: 查找c符号 F10: 本函数调用了谁 F11: 谁调用了本函数
nnoremap <silent> <F8> :cs find t <C-R>=expand("<cword>")<CR><CR> :botright copen<CR><CR>
nnoremap <silent> <F9> :cs find s <C-R>=expand("<cword>")<CR><CR> :botright copen<CR><CR>
nnoremap <silent> <F10> :cs find d <C-R>=expand("<cword>")<CR><CR> :botright copen<CR><CR>
nnoremap <silent> <F11> :cs find c <C-R>=expand("<cword>")<CR><CR> :botright copen<CR><CR>

" ctags: 查看函数定义的位置
nnoremap <F12> g<C-]>

"----------------------------------------------------------------------
" 基本 Normal mode
"----------------------------------------------------------------------

nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <leader>s :w<cr>
nnoremap <leader>qq :q<cr>
nnoremap <silent> <leader><cr> :nohl<cr>
nnoremap <silent> <C-k> D
nnoremap <silent> <leader>= mIgg=G'ImI

" 打开语法检查
nnoremap <silent> <leader>o :setlocal spell! spelllang=en_us<CR>

" 透明背景和取消, 需要终端可以透明
nnoremap <silent> <leader>ct :call Change_theme_alpha()<CR>

" 文本和16进制模式切换
nnoremap <silent> <leader>xd :%!xxd<CR>
nnoremap <silent> <leader>xr :%!xxd -r<CR>

" set coding gbk or utf-8
nnoremap <silent> <leader>eu :e ++enc=utf8<CR>
nnoremap <silent> <leader>eg :e ++enc=gbk<CR>

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
if has('terminal') && exists(':terminal') == 2 && has('patch-8.1.1')
  " vim 8.1 支持 termwinkey ，不需要把 terminal 切换成 normal 模式
  " 设置 termwinkey 为 CTRL 加减号（GVIM），有些终端下是 CTRL+?
  " 后面四个键位是搭配 termwinkey 的，如果 termwinkey 更改，也要改
  set termwinkey=<c-_>
  tnoremap <m-H> <c-_>h
  tnoremap <m-L> <c-_>l
  tnoremap <m-J> <c-_>j
  tnoremap <m-K> <c-_>k
elseif has('nvim')
  " neovim 没有 termwinkey 支持，必须把 terminal 切换回 normal 模式
  tnoremap <m-H> <c-\><c-n><c-w>h
  tnoremap <m-L> <c-\><c-n><c-w>l
  tnoremap <m-J> <c-\><c-n><c-w>j
  tnoremap <m-K> <c-\><c-n><c-w>k
endif

" 移动窗口的位置
nnoremap <silent> <Up>    <c-w>K
nnoremap <silent> <Down>  <c-w>J
nnoremap <silent> <Left>  <c-w>H
nnoremap <silent> <Right> <c-w>L

" 调整窗口大小
nnoremap <silent> <leader>w= <C-w>=
nnoremap <silent> <S-Up>    :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <S-Down>  :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <S-Left>  :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <S-Right> :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

"----------------------------------------------------------------------
" buffer 相关
"----------------------------------------------------------------------

nnoremap <silent> <leader>bp :bprevious<cr>
nnoremap <silent> <leader>bn :bnext<cr>
nnoremap <silent> <leader>bD :bdelete %<CR>

"----------------------------------------------------------------------
" Tab 相关(不喜欢用这玩意儿)
"----------------------------------------------------------------------

nnoremap <silent> <leader>td :tabclose<CR>
nnoremap <silent> <leader>to :tabonly<cr>
