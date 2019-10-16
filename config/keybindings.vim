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
inoremap <C-b> <Left>
inoremap <C-f> <Right>
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
  inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
  inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
  inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


  "-----* NERDTree *------"
  nnoremap tt :NERDTreeToggle<cr>

  "------* TagBar *-----"
  nnoremap <silent> T :Vista!!<CR>
  nnoremap <silent> <C-t> :Vista finder<CR>

  "------* vim-interestingwords *-----"
  nnoremap <silent> <leader>k :call InterestingWords('n')<cr>
  nnoremap <silent> <leader>K :call UncolorAllWords()<cr>

  "------* FZF *------"
  " nnoremap <C-p> :FZF<CR>
  nnoremap <C-p> :Ag<CR>
  nnoremap <leader>bb :Buffers<CR>
  nnoremap <leader>fg :GFiles<CR>
  nnoremap <leader>fr :Startify<CR>
  nnoremap <leader>ff :FZF<CR>

  "------* Undo Tree *-----"
  nnoremap <leader>pu :UndotreeToggle<CR>

  "------* far *-----"
  nnoremap <leader>F :Far  %<left><left>
  nnoremap <leader>pfd :Fardo<CR>

  "-----* Markdown *------"
  nnoremap <leader>pp :MarkdownPreview<CR>
  nnoremap <leader>ps :MarkdownPreviewStop<CR>

  "-----* Ranger-vim *-----"
  nnoremap <leader>R :Ranger<CR>

  "-----* Goyo *-----"
  nnoremap <leader>G :Goyo<CR>

  "-----* vimWiki *-----"
  " :h vimwiki-commands
  " :h vimwiki

  "-----* NERD-commenter *-----"
  nmap <leader>cc <plug>NERDCommenterToggle
  vmap <leader>cc <plug>NERDCommenterToggle
  nmap <leader>ca <plug>NERDCommenterAltDelims
  nmap <leader>cA <plug>NERDCommenterAppend

endif
