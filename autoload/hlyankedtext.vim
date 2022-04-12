" https://www.statox.fr/posts/2020/07/vim_flash_yanked_text/
" https://github.com/markonm/hlyank.vim

function! hlyankedtext#HLYankedText()
  if v:event.operator isnot 'y'
    return
  endif
  if v:event.visual == v:true
    let l:pattern = '\v%\V'
  else
    let l:pos = [line("'["), col("'["), line("']"), col("']")]
    if l:pos[0] == l:pos[2] || v:event.inclusive == v:false
      let l:pattern = printf('\v%%%dl%%%dc\_.{%d}', l:pos[0], l:pos[1], strchars(v:event.regcontents[0]))
    else
      let l:pattern = printf('\v%%%dl%%%dc\_.{-}%%%dl%%%dc.=', l:pos[0], l:pos[1], l:pos[2], l:pos[3])
    endif
  endif
  let l:winid = win_getid()
  let l:id = matchadd('IncSearch', l:pattern, 11)
  call timer_start(300, {-> matchdelete(l:id, l:winid)})
endfunction

au TextYankPost * let g:foo = deepcopy(v:event)
