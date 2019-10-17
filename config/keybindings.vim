" set leader
let mapleader=' '

" vim useful mapings
cnoremap w!! w !sudo tee % > /dev/null
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-d> <del>

nnoremap <F2> :edit ~/.config/nvim/init.vim<CR>
nnoremap <F5> :!ctags -R<CR>

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

" use ]+space create spaceline
nnoremap [<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap ]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>

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
  nnoremap tt :nerdtreetoggle<cr>

  "------* tagbar *-----"
  nnoremap <silent> t :vista!!<cr>
  nnoremap <silent> <c-t> :vista finder<cr>

  "------* vim-interestingwords *-----"
  nnoremap <silent> <leader>k :call interestingwords('n')<cr>
  nnoremap <silent> <leader>k :call uncolorallwords()<cr>

  "------* fzf *------"
  " nnoremap <c-p> :fzf<cr>
  nnoremap <c-p> :ag<cr>
  nnoremap <leader>bb :buffers<cr>
  nnoremap <leader>fg :gfiles<cr>
  nnoremap <leader>fr :startify<cr>
  nnoremap <leader>ff :fzf<cr>
  nnoremap <leader>fj :fzf ~<cr>

  "------* undo tree *-----"
  nnoremap <leader>pu :undotreetoggle<cr>

  "------* far *-----"
  nnoremap <leader>f :far  %<left><left>
  nnoremap <leader>pfd :fardo<cr>

  "-----* markdown *------"
  nnoremap <leader>pp :markdownpreview<cr>
  nnoremap <leader>ps :markdownpreviewstop<cr>

  "-----* ranger-vim *-----"
  nnoremap <leader>r :ranger<cr>

  "-----* goyo *-----"
  nnoremap <leader>g :goyo<cr>

  "-----* vimwiki *-----"
  " :h vimwiki-commands
  " :h vimwiki

  "-----* nerd-commenter *-----"
  nmap <leader>cc <plug>nerdcommentertoggle
  vmap <leader>cc <plug>nerdcommentertoggle
  nmap <leader>ca <plug>nerdcommenteraltdelims
  nmap <leader>ca <plug>nerdcommenterappend

  "-----* multi_cursor *-----"
  let g:multi_cursor_start_word_key      = '<c-n>'
  let g:multi_cursor_select_all_word_key = '<A-n>'
  let g:multi_cursor_next_key            = '<C-n>'
  let g:multi_cursor_prev_key            = '<C-p>'
  let g:multi_cursor_skip_key            = '<C-x>'
  let g:multi_cursor_quit_key            = '<Esc>'
endif
