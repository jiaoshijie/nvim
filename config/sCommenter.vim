" simple commentor

function! g:sCommenter#DetectMinIndent(start, end)
  let l:min_indent = indent(a:start)
  let l:i = a:start + 1
  while l:i <= a:end
    if l:min_indent > indent(l:i)
      let l:min_indent = indent(l:i)
    endif
    let l:i += 1
  endwhile
  return l:min_indent
endfunction

function! g:sCommenter#InsertOrRemoveComment(lnum, line, indent, is_insert)
  if a:is_insert
    let l:indent_spaces = a:indent ? a:line[: a:indent - 1] : ''
    call setline(a:lnum, l:indent_spaces . b:Jsj_Comment["prefix"] .
          \ a:line[a:indent:] . b:Jsj_Comment["suffix"])
  else
    let l:indent_spaces = indent(a:lnum) ? a:line[: indent(a:lnum) - 1] : ''
    call setline(a:lnum, l:indent_spaces .
          \ a:line[indent(a:lnum) + len(b:Jsj_Comment["prefix"]):
          \ len(a:line) - len(b:Jsj_Comment["suffix"]) - 1])
  endif
endfunction

function! g:sCommenter#Toggle_Comment(count)
  if !exists('b:Jsj_Comment')
    echohl ErrorMsg
    echomsg "simpleCommenter doesn't work for filetype " . &ft . " yet."
    echohl None
    return
  endif
  let l:start = line('.')
  let l:end = l:start + a:count - 1 > line('$') ? line('$') : l:start + a:count - 1
  let l:indent = g:sCommenter#DetectMinIndent(l:start, l:end)
  let l:lines = l:start == l:end ? [getline(l:start)] : getline(l:start, l:end)
  if l:lines[0][indent(l:start): indent(l:start) + len(b:Jsj_Comment["prefix"]) - 1] ==# b:Jsj_Comment["prefix"]
    let l:is_insert = 0
  else
    let l:is_insert = 1
  endif
  for l:line in l:lines
    if len(l:line) > 0
      call g:sCommenter#InsertOrRemoveComment(l:start, l:line, l:indent, l:is_insert)
    endif
    let l:start += 1
  endfor
endfunction

autocmd filetype vim let b:Jsj_Comment = { "prefix": '" ', "suffix": '' }
autocmd filetype html let b:Jsj_Comment = { "prefix": '<!-- ', "suffix":  ' -->' }
autocmd filetype css let b:Jsj_Comment = { "prefix": '/* ', "suffix":  ' */' }
autocmd filetype c,cpp,javascript,typescript let b:Jsj_Comment = { "prefix": '// ', "suffix":  '' }
" autocmd filetype c,cpp,javascript,typescript let b:Jsj_Comment = { "prefix": '/* ', "suffix":  ' */' }
autocmd filetype python let b:Jsj_Comment = { "prefix": '# ', "suffix": '' }
autocmd filetype make let b:Jsj_Comment = { "prefix": '# ', "suffix": '' }
autocmd filetype sh let b:Jsj_Comment = { "prefix": '# ', "suffix": '' }
autocmd filetype conf let b:Jsj_Comment = { "prefix": '# ', "suffix": '' }
autocmd filetype tex let b:Jsj_Comment = { "prefix": '% ', "suffix": '' }
autocmd filetype lua let b:Jsj_Comment = { "prefix": '-- ', "suffix": '' }

nnoremap <silent> gc :<C-u>call sCommenter#Toggle_Comment(v:count1)<cr>
vnoremap <silent> gc :<C-u>call sCommenter#Toggle_Comment(line("'>") - line("'<") + 1)<cr>
