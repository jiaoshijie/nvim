let g:jsj_change_theme_alpha = 0
highlight Normal guibg=#282828 ctermbg=235

highlight Visual ctermbg=59

highlight Comment cterm=italic ctermfg=8

highlight Pmenu ctermbg=gray ctermfg=black
highlight PmenuSel ctermbg=brown ctermfg=gray

highlight StatusLine ctermbg=237 cterm=NONE
highlight StatusLineNC ctermbg=darkgray cterm=NONE

highlight CursorLine cterm=NONE ctermbg=237
highlight! link ColorColumn CursorLine
highlight! link CursorColumn CursorLine
highlight LineNr cterm=bold ctermfg=243
highlight! link SignColumn LineNr
highlight CursorLineNr cterm=bold ctermfg=214

highlight clear SpellBad
highlight SpellBad ctermfg=1 cterm=underline
highlight clear SpellCap
highlight SpellCap cterm=underline
highlight clear SpellRare
highlight SpellRare cterm=underline
highlight clear SpellLocal
highlight SpellLocal cterm=underline

highlight MatchParen ctermbg=241 cterm=bold

highlight SpecialKey ctermfg=238
highlight! link EndOfBuffer SpecialKey
highlight! link NonText SpecialKey
highlight! link Conceal SpecialKey

highlight Search cterm=reverse ctermfg=214 ctermbg=235

highlight DiffAdd cterm=reverse ctermfg=142 ctermbg=235
highlight DiffChange cterm=reverse ctermfg=108 ctermbg=235
highlight DiffDelete cterm=reverse ctermfg=167 ctermbg=235
highlight DiffText cterm=reverse ctermfg=214 ctermbg=235
highlight! link ShowMarksHLl DiffAdd
highlight! link ShowMarksHLu DiffChange

" markdown
highlight! markdownError ctermbg=235 ctermfg=red

let g:colors_name="Jsjsimple"
