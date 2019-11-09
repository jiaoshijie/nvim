" set leader Space
let mapleader=' '

" vim useful mapings
cnoremap w!! w !sudo tee % > /dev/null
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-d> <del>

nnoremap <F2> :edit ~/.config/nvim/init.vim<CR>

" -----* ctags *-------
" nnoremap <F5> :!ctags -R -f .tags<CR><CR>
" 查看函数定义的位置
nnoremap <F12> g<C-]>

" -----* QuickFix *-------
nnoremap <F3> :cprevious<cr>
nnoremap <F4> :cnext<cr>

" 编译执行
noremap <F5> :call CompileRunGcc()<CR>

" -----* cscope *-------
" F6: 类似ctags F7: egrep-mode匹配 F8: 查找字符串
" F9: 查找c符号 F10: 查找本函数调用了谁 F11: 查找谁调用了本函数
" nmap <silent> <F6> :cs find g <C-R>=expand("<cword>")<CR><CR>
" nmap <silent> <F7> :cs find e <C-R>=expand("<cword>")<CR><CR> :botright copen<CR><CR>
nnoremap <silent> <F8> :cs find t <C-R>=expand("<cword>")<CR><CR> :botright copen<CR><CR>
nnoremap <silent> <F9> :cs find s <C-R>=expand("<cword>")<CR><CR> :botright copen<CR><CR>
nmap <silent> <F10> :cs find d <C-R>=expand("<cword>")<CR><CR> :botright copen<CR><CR>
nnoremap <silent> <F11> :cs find c <C-R>=expand("<cword>")<CR><CR> :botright copen<CR><CR>


" normal mode mapings
nnoremap <leader>s :w<cr>
nnoremap <leader>S :source ~/.config/nvim/init.vim<cr>
nnoremap <leader>qq :q<cr>
nnoremap <leader><cr> :nohl<cr>
" nnoremap <leader>f /<++><cr>:nohlsearch<cr>"_c4l
nnoremap <C-k> d$

" window mapings
nnoremap <leader>w/ <C-w>v
nnoremap <leader>w- <C-w>s
nnoremap <leader>wh <C-w>h
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-w>k
nnoremap <leader>wl <C-w>l
nnoremap <leader>w= <C-w>=
nnoremap <leader>wo <C-w>o
nnoremap <leader>wc <C-w>c
" nnoremap <leader>wq <C-w>q
nnoremap <Up> <C-w>+
nnoremap <Down> <C-w>-
nnoremap <Left> <C-w>>
nnoremap <Right> <C-w><
" nnoremap <leader>wth <C-w>t<C-w>H
" nnoremap <leader>wtk <C-w>t<C-w>K

" buffer mapings
nnoremap <leader><Left> :bprevious<cr>
nnoremap <leader><Right> :bnext<cr>
nnoremap <leader>bp :bprevious<cr>
nnoremap <leader>bn :bnext<cr>
nnoremap <leader>bD :bdelete %<CR>

" Tab mapings
nnoremap <leader>tN :tabe<CR>
nnoremap <leader>tn :tabnext<CR>
nnoremap <leader>tp :tabprevious<CR>
nnoremap <leader>tD :tabclose<CR>
nnoremap <leader><Down> :tabnext<CR>
nnoremap <leader><Up> :tabprevious<CR>
if !has('nvim')
  nnoremap tt :Vex<CR>
endif

" show HEX and return
nnoremap <leader>xd :%!xxd<CR>
nnoremap <leader>xr :%!xxd -r<CR>

" set coding gbk or utf-8
nnoremap <leader>eg :e ++enc=gbk<CR>
nnoremap <leader>eu :e ++enc=utf8<CR>

" inster mode mapings
" inoremap jk <Esc>
inoremap <C-j> <Esc>
" inoremap <C-p> <Up>
" inoremap <C-n> <Down>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-a> <Esc>I
inoremap <C-e> <Esc>A
inoremap <C-d> <del>
inoremap <C-y> <C-r>+

" visual mode mapings
" vnoremap <silent> <leader>a <Esc>a"<Esc>gvo<Esc>i"<Esc>
vnoremap <silent> <leader>a di""<Esc>P

"-------------------------------------"
"--------------* end *----------------"
"-------------------------------------"


if has('nvim')
  "-----* coc *------"
  inoremap <expr> <cr> (pumvisible() ? "\<c-y>\<cr>" : "\<cr>")
  inoremap <expr> <tab> pumvisible() ? "\<c-n>" : "\<tab>"
  inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"


  "-----* nerdtree *------"
  nnoremap tt :NERDTreeToggle<cr>

  "------* tagbar *-----"
  nnoremap <silent> T :Vista!!<cr>
  nnoremap <silent> <c-t> :Vista finder<cr>

  "------* vim-interestingwords *-----"
  nnoremap <silent> <leader>k :call interestingwords('n')<cr>
  " nnoremap <silent> <leader>K :call uncolorallwords()<cr>

  "------* fzf *------"
  nnoremap <c-p> :Ag<cr>
  nnoremap <leader>bb :Buffers<cr>
  nnoremap <leader>fg :GFiles<cr>
  nnoremap <leader>fr :Startify<cr>
  nnoremap <leader>ff :FZF<cr>
  nnoremap <leader>fj :FZF ~<cr>

  "------* undo tree *-----"
  nnoremap <leader>pu :UndotreeToggle<cr>

  "------* far *-----"
  nnoremap <leader>F :far  %<left><left>
  nnoremap <leader>pfd :fardo<cr>

  "-----* markdown *------"
  nnoremap <leader>pp :MarkdownPreview<cr>
  nnoremap <leader>ps :MarkdownPreviewStop<cr>

  "-----* ranger-vim *-----"
  nnoremap <leader>R :Ranger<cr>

  "-----* goyo *-----"
  nnoremap <leader>G :Goyo<cr>

  "-----* vimwiki *-----"
  " :h vimwiki-commands
  " :h vimwiki

  "-----* nerd-commenter *-----"
  nmap <leader>cc <plug>NERDCommenterToggle
  vmap <leader>cc <plug>NERDCommenterToggle
  nmap <leader>ca <plug>NERDCommenterAltDelims
  nmap <leader>cA <plug>NERDCommenterAppend

  "-----* multi_cursor *-----"
  let g:multi_cursor_start_word_key      = '<c-n>'
  let g:multi_cursor_select_all_word_key = '<A-n>'
  let g:multi_cursor_next_key            = '<C-n>'
  let g:multi_cursor_prev_key            = '<C-p>'
  let g:multi_cursor_skip_key            = '<C-x>'
  let g:multi_cursor_quit_key            = '<Esc>'

  " -----* UltiSnips *----- "
  let g:UltiSnipsExpandTrigger="<C-l>"
  let g:UltiSnipsJumpForwardTrigger="<C-l>"
  let g:UltiSnipsJumpBackwardTrigger="<C-k>"

  " -----* easymotion *----- "
  " map <leader>ee <Plug>(easymotion-bd-f)
  nmap <leader>ee <Plug>(easymotion-overwin-f)
  nmap <leader>es <Plug>(easymotion-overwin-f2)
  
  " -----* which key *----- "
  nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
  nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

  " -----* LeaderF *----- "
  " let g:Lf_ShortcutF = '<C-p>'
  

endif
