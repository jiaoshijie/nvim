" simple commentor

let s:Jsj_Comments = {
      \ 'vim': { 'prefix': '" ', 'suffix': '' },
      \ 'lua': { 'prefix': '-- ', 'suffix': '' },
      \ 'haskell': { 'prefix': '-- ', 'suffix': '' },
      \ 'c': { 'prefix': '// ', 'suffix': '' },
      \ 'cpp': { 'prefix': '// ', 'suffix': '' },
      \ 'go': { 'prefix': '// ', 'suffix': '' },
      \ 'html': { 'prefix': '<!-- ', 'suffix': ' -->' },
      \ 'css': { 'prefix': '/* ', 'suffix': ' */' },
      \ 'javascript': { 'prefix': '// ', 'suffix': '' },
      \ 'typescript': { 'prefix': '// ', 'suffix': '' },
      \ 'python': { 'prefix': '# ', 'suffix': '' },
      \ 'make': { 'prefix': '# ', 'suffix': '' },
      \ 'sh': { 'prefix': '# ', 'suffix': '' },
      \ 'conf': { 'prefix': '# ', 'suffix': '' },
      \ 'tex': { 'prefix': '% ', 'suffix': '' },
      \ }

function! s:DetectMinIndent(start, end)
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

function! s:InsertOrRemoveComment(lnum, line, indent, is_remove)
  if a:is_remove  " remove
    let l:indent_spaces = indent(a:lnum) ? a:line[: indent(a:lnum) - 1] : ''
    call setline(a:lnum, l:indent_spaces .
          \ a:line[indent(a:lnum) + len(s:Jsj_Comments[&ft]['prefix']):
          \ len(a:line) - len(s:Jsj_Comments[&ft]['suffix']) - 1])
  else  " insert
    let l:indent_spaces = a:indent ? a:line[: a:indent - 1] : ''
    call setline(a:lnum, l:indent_spaces . s:Jsj_Comments[&ft]['prefix'] .
          \ a:line[a:indent:] . s:Jsj_Comments[&ft]['suffix'])
  endif
endfunction

function! sCommenter#Toggle_Comment(count)
  if !exists(printf("s:Jsj_Comments['%s']", &ft))
    echohl ErrorMsg
    echo "simpleCommenter doesn't work for filetype `" . &ft . "` yet."
    echohl None
    return
  endif

  let l:start = line('.')
  let l:end = l:start + a:count - 1 > line('$') ? line('$') : l:start + a:count - 1
  let l:indent = s:DetectMinIndent(l:start, l:end)
  let l:lines = l:start == l:end ? [getline(l:start)] : getline(l:start, l:end)
  let l:is_remove = l:lines[0][indent(l:start): indent(l:start) +
        \ len(s:Jsj_Comments[&ft]['prefix']) - 1] ==# s:Jsj_Comments[&ft]['prefix']

  for l:line in l:lines
    if len(l:line) > 0
      call s:InsertOrRemoveComment(l:start, l:line, l:indent, l:is_remove)
    endif
    let l:start += 1
  endfor
endfunction
