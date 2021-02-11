" =======
" coc-keymaps
" =======
" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" 调到类型的定义处
nmap <silent> <leader>gd <Plug>(coc-definition)
" 查看变量函数使用的位置
nmap <silent> <leader>gr <Plug>(coc-references)
" 跳转到错误的位置(包括警告)
nnoremap <silent><nowait> <space>ges  :<C-u>CocList diagnostics<cr>
nmap <silent> <leader>gep <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>gen <Plug>(coc-diagnostic-next)
" 显示错误完整信息
nmap <silent> <leader>gee <Plug>(coc-diagnostic-info)
" GoTo code navigation.
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Symbol renaming.
nnoremap <leader>gww :CocSearch <C-R>=expand("<cword>")<CR><CR>
nmap <leader>gwr <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>g=  <Plug>(coc-format-selected)
nmap <leader>g=  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call CocAction('runCommand', 'editor.action.organizeImport')


" >>>>> coc-explorer <<<<< "
" 打开文件管理器
nmap <silent> tt :CocCommand explorer<CR>

" >>>>> coc-translator <<<<< "
" 翻译
nmap <silent> ts <Plug>(coc-translator-p)

" >>>>> coc-yank <<<<< "
" 复制历史
nnoremap <silent> <leader>gh  :<C-u>CocList -A --normal yank<cr>

" >>>>> coc-snippets <<<<< "
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
" vmap <C-j> <Plug>(coc-snippets-select)
" Use <C-l> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-l>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
" Use <C-l> for both expand and jump (make expand higher priority.)
imap <C-l> <Plug>(coc-snippets-expand-jump)

" >>>>> coc-git <<<<< "
" navigate chunks of current buffer
nmap [g <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)
" show chunk diff at current position
nmap gp <Plug>(coc-git-chunkinfo)
" create text object for git chunks
omap ig <Plug>(coc-git-chunk-inner)
xmap ig <Plug>(coc-git-chunk-inner)
omap ag <Plug>(coc-git-chunk-outer)
xmap ag <Plug>(coc-git-chunk-outer)

" >>>>> coc-actions <<<<< "
" Remap for do codeAction of selected region TODO
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@
