highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name="gruvbox"

function! s:h(group, style)
  execute "highlight" a:group
    \ "guifg="   (has_key(a:style, "fg")    ? a:style.fg   : "NONE")
    \ "guibg="   (has_key(a:style, "bg")    ? a:style.bg   : "NONE")
    \ "guisp="   (has_key(a:style, "sp")    ? a:style.sp   : "NONE")
    \ "gui="     (has_key(a:style, "gui")   ? a:style.gui  : "NONE")
    \ "cterm="   (has_key(a:style, "gui")   ? a:style.gui  : "NONE")
endfunction

let s:colors = gruvbox#GetColors()

let s:bg0 = s:colors.bg0
let s:bg1 = s:colors.bg1
let s:bg2 = s:colors.bg2
let s:bg3 = s:colors.bg3
let s:bg4 = s:colors.bg4
let s:gray = s:colors.gray
let s:fg0 = s:colors.fg0
let s:fg1 = s:colors.fg1
let s:fg2 = s:colors.fg2
let s:fg3 = s:colors.fg3
let s:fg4 = s:colors.fg4
let s:red = s:colors.red
let s:green = s:colors.green
let s:yellow = s:colors.yellow
let s:blue = s:colors.blue
let s:purple = s:colors.purple
let s:aqua = s:colors.aqua
let s:orange = s:colors.orange

" {{{ `h syntax.txt:5311`
call s:h("ColorColumn", { "bg" : s:bg1 })
call s:h("Conceal", { "fg" : s:blue })

" [[ cursor ]]
hi! link CurSearch IncSearch
call s:h("Cursor", { "fg" : "#000000", "bg" : "#5588FF" })
hi! link lCursor Cursor
hi! link CursorIM Cursor
call s:h("CursorColumn", { "bg" : s:bg1 })
call s:h("CursorLine", { "bg" : s:bg1 })
call s:h("Directory", { "fg" : s:green, "gui" : "bold" })

" [[ Diff mode 'vimdiff, vim -d']]
call s:h("DiffAdd", { "fg" : s:green, "bg" : s:bg0, "gui" : "reverse" })
call s:h("DiffChange", { "fg" : s:aqua, "bg" : s:bg0, "gui" : "reverse" })
call s:h("DiffDelete", { "fg" : s:red, "bg" : s:bg0, "gui" : "reverse" })
call s:h("DiffText", { "fg" : s:yellow, "bg" : s:bg0, "gui" : "reverse" })

hi! link EndOfBuffer NonText

call s:h("ErrorMsg", { "fg" : s:bg0, "bg" : s:red, "gui" : "bold" })
call s:h("VertSplit", { "fg" : s:bg3, "bg" : s:bg0 })
call s:h("Folded", { "fg" : s:gray, "bg" : s:bg1, "gui" : "italic" })
call s:h("FoldColumn", { "fg" : s:gray, "bg" : s:bg1 })
hi! link SignColumn LineNr
call s:h("IncSearch", { "fg" : s:orange, "bg" : s:bg0, "gui" : "reverse" })

call s:h("LineNr", { "fg" : s:bg4 })
hi! link LineNrAbove LineNr
hi! link LineNrBelow LineNr
call s:h("CursorLineNr", { "fg" : s:yellow, "bg" : s:bg1, "gui" : "bold" })
hi! link CursorLineSign SignColumn
hi! link CursorLineFold FoldColumn

call s:h("MatchParen", { "bg" : s:bg3, "gui" : "bold" })
hi! link MessageWindow WarningMsg
call s:h("ModeMsg", { "fg" : s:yellow, "gui" : "bold" })
call s:h("MoreMsg", { "fg" : s:yellow, "gui" : "bold" })
call s:h("NonText", { "fg" : s:bg2 })
call s:h("Normal", { "fg" : s:fg1, "bg" : s:bg0 })

" [[ Pmenu ]]
call s:h("Pmenu", { "fg" : s:fg1, "bg" : s:bg2 })
call s:h("PmenuSel", { "fg" : s:bg2, "bg" : s:blue, "gui" : "bold,italic" })
call s:h("PmenuSbar", { "bg" : s:bg2 })
call s:h("PmenuThumb", { "bg" : s:bg4 })

hi! link PopupNotification WarningMsg
call s:h("Question", { "fg" : s:orange, "gui" : "bold" })
hi! link QuickFixLine Search
call s:h("Search", { "fg" : s:yellow, "bg" : s:bg0, "gui" : "reverse" })
call s:h("SpecialKey", { "fg" : s:bg2 })

" [[ Spelling ]]
call s:h("SpellBad", { "gui" : "undercurl", "sp" : s:red })
call s:h("SpellCap", { "gui" : "undercurl", "sp" : s:blue })
call s:h("SpellLocal", { "gui" : "undercurl", "sp" : s:aqua })
call s:h("SpellRare", { "gui" : "undercurl", "sp" : s:purple })

" StatusLine
" StatusLineNC
" StatusLineTerm
" StatusLineTermNC
call s:h("TabLine", { "fg" : s:gray, "bg" : s:fg0 })
hi! link TabLineFill TabLine
call s:h("TabLineSel", { "fg" : s:green, "bg" : s:bg2 })

" Terminal
call s:h("Title", { "fg" : s:green, "gui" : "bold" })
call s:h("Visual", { "bg" : s:bg3, "gui" : "reverse" })
hi! link VisualNOS Visual
call s:h("WarningMsg", { "fg" : s:red, "gui" : "bold" })
call s:h("WildMenu", { "fg" : s:blue, "bg" : s:bg2, "gui" : "bold" })
" }}}

" {{{ `h syntax.txt:227`
call s:h("Comment", { "fg" : s:gray, "gui" : "italic" })

call s:h("Constant", { "fg" : s:purple })
call s:h("String", { "fg" : s:green, "gui" : "italic" })
call s:h("Character", { "fg" : s:purple })
call s:h("Number", { "fg" : s:purple })
call s:h("Boolean", { "fg" : s:purple })
call s:h("Float", { "fg" : s:purple })

call s:h("Identifier", { "fg" : s:blue })
call s:h("Function", { "fg" : s:green, "gui" : "bold" })

call s:h("Statement", { "fg" : s:red })
call s:h("Conditional", { "fg" : s:red })
call s:h("Repeat", { "fg" : s:red })
call s:h("Label", { "fg" : s:red })
call s:h("Operator", { "fg" : s:fg1 })
call s:h("Keyword", { "fg" : s:red })
call s:h("Exception", { "fg" : s:red })

call s:h("PreProc", { "fg" : s:aqua })
call s:h("Include", { "fg" : s:aqua })
call s:h("Define", { "fg" : s:aqua })
call s:h("Macro", { "fg" : s:aqua })
call s:h("PreCondit", { "fg" : s:aqua })

call s:h("Type", { "fg" : s:yellow })
call s:h("StorageClass", { "fg" : s:orange })
call s:h("Structure", { "fg" : s:aqua })
call s:h("Typedef", { "fg" : s:yellow })

call s:h("Special", { "fg" : s:orange })
hi! link SpecialChar Special
hi! link Tag Special
hi! link Delimiter Special
hi! link SpecialComment Special
hi! link Debug Special

call s:h("Underlined", { "fg" : s:blue, "gui" : "underline" })
hi! link Ignore Conceal
call s:h("Error", { "fg" : s:red, "bg" : s:bg0, "gui" : "reverse,bold" })
call s:h("Todo", { "fg" : s:yellow, "bg" : s:bg0, "gui" : "bold,italic" })
" }}}

" {{{
" [[ Netrw ]]
call s:h("netrwDir", { "fg" : s:aqua })
call s:h("netrwClassify", { "fg" : s:aqua })
call s:h("netrwLink", { "fg" : s:gray })
call s:h("netrwSymLink", { "fg" : s:fg1 })
call s:h("netrwExe", { "fg" : s:yellow })
call s:h("netrwComment", { "fg" : s:gray })
call s:h("netrwList", { "fg" : s:blue })
call s:h("netrwHelpCmd", { "fg" : s:aqua })
call s:h("netrwCmdSep", { "fg" : s:fg3 })
call s:h("netrwVersion", { "fg" : s:green })

" [[ diff file *.diff ]]
call s:h("diffAdded", { "fg" : s:green })
call s:h("diffRemoved", { "fg" : s:red })
call s:h("diffChanged", { "fg" : s:aqua })
call s:h("diffFile", { "fg" : s:orange })
call s:h("diffNewFile", { "fg" : s:yellow })
call s:h("diffLine", { "fg" : s:blue })

" [[ vim ]]
call s:h("vimCommentTitle", { "fg" : s:fg4, "gui" : "bold,italic" })
call s:h("vimNotation", { "fg" : s:orange })
call s:h("vimBracket", { "fg" : s:orange })
call s:h("vimMapModKey", { "fg" : s:orange })
call s:h("vimFuncSID", { "fg" : s:fg3 })
call s:h("vimSetSep", { "fg" : s:fg3 })
call s:h("vimSep", { "fg" : s:fg3 })
call s:h("vimContinue", { "fg" : s:fg3 })

" [[ Markdown ]]
call s:h("markdownItalic", { "fg" : s:fg3, "gui" : "italic" })
call s:h("markdownH1", { "fg" : s:green, "gui" : "bold" })
call s:h("markdownH2", { "fg" : s:green, "gui" : "bold" })
call s:h("markdownH3", { "fg" : s:yellow, "gui" : "bold" })
call s:h("markdownH4", { "fg" : s:yellow, "gui" : "bold" })
call s:h("markdownH5", { "fg" : s:yellow })
call s:h("markdownH6", { "fg" : s:yellow })
call s:h("markdownCode", { "fg" : s:aqua })
call s:h("markdownCodeBlock", { "fg" : s:aqua })
call s:h("markdownCodeDelimiter", { "fg" : s:aqua })
call s:h("markdownBlockquote", { "fg" : s:gray })
call s:h("markdownListMarker", { "fg" : s:gray })
call s:h("markdownOrderedListMarker", { "fg" : s:gray })
call s:h("markdownRule", { "fg" : s:gray })
call s:h("markdownHeadingRule", { "fg" : s:gray })
call s:h("markdownUrlDelimiter", { "fg" : s:fg3 })
call s:h("markdownLinkDelimiter", { "fg" : s:fg3 })
call s:h("markdownLinkTextDelimiter", { "fg" : s:fg3 })
call s:h("markdownHeadingDelimiter", { "fg" : s:orange })
call s:h("markdownUrl", { "fg" : s:purple })
call s:h("markdownUrlTitleDelimiter", { "fg" : s:green })
call s:h("markdownLinkText", { "fg" : s:gray, "gui" : "underline" })
hi! link markdownIdDeclaration markdownLinkText
call s:h("markdownError", { "fg" : s:red })
call s:h("markdownBold", { "fg" : s:orange, "gui" : "bold" })
" }}}
