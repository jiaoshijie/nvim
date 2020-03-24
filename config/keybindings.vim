" set leader  = "Space"
let mapleader=' '

" vim useful mapings
cnoremap W w !sudo tee % > /dev/null
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-d> <del>
cnoremap <C-y> <C-r>+
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
" cnoremap <C-h> <S-Left>
" cnoremap <C-l> <S-Right>

nnoremap <silent> <F2> :edit ~/.config/nvim/init.vim<CR>

function! Compile_Run()
	exec "w"
  if filereadable("Makefile")
    exec "AsyncRun! make"
  elseif &filetype == 'c'
		" exec "AsyncRun! -mode=terminal gcc % -o %< & ./%<"
    exec "AsyncRun! gcc % -o %< & ./%<"
	elseif &filetype == 'cpp'
		exec "AsyncRun! g++ -std=c++11 % -Wall -o %< & ./%<"
	elseif &filetype == 'sh'
		" :!time bash %
    exec "AsyncRun! bash %"
	elseif &filetype == 'python'
    let $PYTHONNUNBUFFERED=1
    exec "AsyncRun! -raw python3 %"
	elseif &filetype == 'vimwiki'
		exec "MarkdownPreview"
	elseif &filetype == 'markdown'
		exec "MarkdownPreview"
	endif
endfunction

nnoremap <silent> <F5> :call Compile_Run()<cr>

" -----* QuickFix *-------
nnoremap <silent> <F3> :cprevious<cr>
nnoremap <silent> <F4> :cnext<cr>
nnoremap <silent> <F6> :copen<cr>
nnoremap <silent> <F7> :cclose<CR>

" -----* cscope *-------
" F8: 查找字符串 F9: 查找c符号 F10: 查找本函数调用了谁 F11: 查找谁调用了本函数
nnoremap <silent> <F8> :cs find t <C-R>=expand("<cword>")<CR><CR> :botright copen<CR><CR>
nnoremap <silent> <F9> :cs find s <C-R>=expand("<cword>")<CR><CR> :botright copen<CR><CR>
nnoremap <silent> <F10> :cs find d <C-R>=expand("<cword>")<CR><CR> :botright copen<CR><CR>
nnoremap <silent> <F11> :cs find c <C-R>=expand("<cword>")<CR><CR> :botright copen<CR><CR>

" -----* ctags *-------
" 查看函数定义的位置
nnoremap <F12> g<C-]>


" normal mode mapings
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <leader>s :w<cr>
nnoremap <leader>S :source ~/.config/nvim/init.vim<cr>
nnoremap <leader>qq :q<cr>
nnoremap <leader><cr> :nohl<cr>
nnoremap <C-k> d$

" Split management
nnoremap <leader>w/ <C-w>v
nnoremap <leader>w- <C-w>s
nnoremap <leader>wh <C-w>h
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-w>k
nnoremap <leader>wl <C-w>l
nnoremap <leader>w= <C-w>=
nnoremap <leader>wo <C-w>o
nnoremap <leader>wc <C-w>c
nnoremap <silent> <Up>    :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Down>  :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <Left>  :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <Right> :exe "vertical resize " . (winwidth(0) * 2/3)<CR>
" nnoremap <Up> <C-w>+
" nnoremap <Down> <C-w>-
" nnoremap <Left> <C-w>>
" nnoremap <Right> <C-w><
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
nnoremap <leader>tC :tabclose<CR>

if !has('nvim')
  nnoremap <silent> tt :Vexplore <C-r>=expand("%:p:h")<CR><CR>
endif

" show HEX and return
nnoremap <leader>xd :%!xxd<CR>
nnoremap <leader>xr :%!xxd -r<CR>

" set coding gbk or utf-8
nnoremap <leader>eg :e ++enc=gbk<CR>
nnoremap <leader>eu :e ++enc=utf8<CR>

" inster mode mapings
inoremap <C-j> <Esc>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-d> <del>
inoremap <C-y> <C-r>+
" inoremap <C-h> <S-Left>
" inoremap <C-l> <S-Right>
" Recover from accidental Ctrl-U
" http://vim.wikia.com/wiki/Recover_from_accidental_Ctrl-U
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

" visual mode mapings
vnoremap <silent> <leader>a di""<Esc>P

"-------------------------------------"
"--------------* end *----------------"
"-------------------------------------"


if has('nvim')
  "-----* coc *------"
  inoremap <expr> <cr> (pumvisible() ? "\<c-y>\<cr>" : "\<cr>")
  inoremap <expr> <tab> pumvisible() ? "\<c-n>" : "\<tab>"
  inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
  " Remap keys for gotos
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)
  vmap <silent> gf <Plug>(coc-format-selected)

  " Remap for rename current word
  nmap gm <Plug>(coc-rename)

  " Show documentation in preview window
  nmap <silent> gh :call CocAction('doHover')<CR>
  nmap <silent> gc :CocList diagnostics<CR>
  nmap <silent> go :CocList outline<CR>
  nmap <silent> gs :CocList -I symbols<CR>
  " coc-explorer
  nmap tt :CocCommand explorer<CR>
  " coc-translator
  nmap ts <Plug>(coc-translator-p)

  "------* Vista *-----"
  nnoremap <silent> T :Vista!!<cr>
  nnoremap <silent> <c-t> :Vista finder<cr>

  "------* vim-interestingwords *-----"
  nnoremap <silent> <leader>k :call interestingwords('n')<cr>

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
  " nnoremap <leader>F :Far  %<left><left>

  "-----* Rnvimr *-----"
nnoremap <silent> <leader>R :RnvimrSync<CR>:RnvimrToggle<CR><C-\><C-n>:RnvimrResize 0<CR>

  "-----* goyo *-----"
  nnoremap <leader>gg :Goyo<cr>
  nnoremap <leader>gl :Limelight!!<cr>

  "-----* vimwiki *-----"
  " :h vimwiki-commands
  " :h vimwiki

  "-----* nerd-commenter *-----"
  nmap <leader>cc <plug>NERDCommenterToggle
  vmap <leader>cc <plug>NERDCommenterToggle
  nmap <leader>ca <plug>NERDCommenterAltDelims
  nmap <leader>cA <plug>NERDCommenterAppend

  " -----* UltiSnips *----- "
  let g:UltiSnipsExpandTrigger="<C-l>"
  let g:UltiSnipsJumpForwardTrigger="<C-l>"
  let g:UltiSnipsJumpBackwardTrigger="<C-k>"

  " -----* easymotion *----- "
  nmap <leader>ee <Plug>(easymotion-overwin-f)
  nmap <leader>es <Plug>(easymotion-overwin-f2)

  " -----* which key *----- "
  " nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
  " nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

  " -----* LeaderF *----- "
  " let g:Lf_ShortcutF = '<C-p>'
endif
