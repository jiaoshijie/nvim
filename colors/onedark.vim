highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name="onedark"

function! s:h(group, style)
  execute "highlight" a:group
    \ "guifg="   (has_key(a:style, "fg")    ? a:style.fg.gui   : "NONE")
    \ "guibg="   (has_key(a:style, "bg")    ? a:style.bg.gui   : "NONE")
    \ "guisp="   (has_key(a:style, "sp")    ? a:style.sp.gui   : "NONE")
    \ "gui="     (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
    \ "cterm="   (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
endfunction

let s:colors = onedark#GetColors()

let s:red = s:colors.red
let s:dark_red = s:colors.dark_red
let s:green = s:colors.green
let s:yellow = s:colors.yellow
let s:dark_yellow = s:colors.dark_yellow
let s:blue = s:colors.blue
let s:purple = s:colors.purple
let s:cyan = s:colors.cyan
let s:white = s:colors.white
let s:black = s:colors.black
let s:visual_black = s:colors.visual_black
let s:comment_grey = s:colors.comment_grey
let s:gutter_fg_grey = s:colors.gutter_fg_grey
let s:cursor_grey = s:colors.cursor_grey
let s:visual_grey = s:colors.visual_grey
let s:menu_grey = s:colors.menu_grey
let s:special_grey = s:colors.special_grey
let s:vertsplit = s:colors.vertsplit

" Syntax Groups (descriptions and ordering from `:h w18`)
call s:h("Comment", { "fg": s:comment_grey, "gui": "italic" })
call s:h("Constant", { "fg": s:cyan })
call s:h("String", { "fg": s:green })
call s:h("Character", { "fg": s:green })
call s:h("Number", { "fg": s:dark_yellow })
call s:h("Boolean", { "fg": s:dark_yellow })
call s:h("Float", { "fg": s:dark_yellow })
call s:h("Identifier", { "fg": s:red })
call s:h("Function", { "fg": s:blue })
call s:h("Statement", { "fg": s:purple })
call s:h("Conditional", { "fg": s:purple })
call s:h("Repeat", { "fg": s:purple })
call s:h("Label", { "fg": s:purple })
call s:h("Operator", { "fg": s:purple })
call s:h("Keyword", { "fg": s:red })
call s:h("Exception", { "fg": s:purple })
call s:h("PreProc", { "fg": s:yellow })
call s:h("Include", { "fg": s:blue })
call s:h("Define", { "fg": s:purple })
call s:h("Macro", { "fg": s:purple })
call s:h("PreCondit", { "fg": s:yellow })
call s:h("Type", { "fg": s:yellow })
call s:h("StorageClass", { "fg": s:yellow })
call s:h("Structure", { "fg": s:yellow })
call s:h("Typedef", { "fg": s:yellow })
call s:h("Special", { "fg": s:blue })
call s:h("SpecialChar", { "fg": s:dark_yellow })
call s:h("Tag", {})
call s:h("Delimiter", {})
call s:h("SpecialComment", { "fg": s:comment_grey })
call s:h("Debug", { "fg": s:yellow, "gui": "bold,italic" })
call s:h("Underlined", { "gui": "underline" })
call s:h("Ignore", {})
call s:h("Error", { "fg": s:red })
call s:h("Todo", { "fg": s:yellow, "bg": s:dark_red, "gui": "bold,italic" })

" }}}

" Highlighting Groups (descriptions and ordering from `:h highlight-groups`) {{{
call s:h("ColorColumn", { "bg": s:cursor_grey })
call s:h("Conceal", {})
call s:h("Cursor", { "fg": s:black, "bg": s:blue })
call s:h("CursorIM", {})
call s:h("CursorColumn", { "bg": s:cursor_grey })
call s:h("CursorLine", { "bg": s:cursor_grey })
call s:h("Directory", { "fg": s:blue })
call s:h("EndOfBuffer", { "fg": s:black })
call s:h("ErrorMsg", { "fg": s:red })
call s:h("VertSplit", { "fg": s:vertsplit })
call s:h("Folded", { "fg": s:comment_grey })
call s:h("FoldColumn", {})
call s:h("SignColumn", {})
call s:h("IncSearch", { "fg": s:yellow, "bg": s:comment_grey })
call s:h("LineNr", { "fg": s:gutter_fg_grey, "gui": "bold" })
call s:h("CursorLineNr", { "fg": s:yellow, "gui": "bold", "bg": s:cursor_grey })
call s:h("MatchParen", { "fg": s:blue, "gui": "underline,bold" })
call s:h("ModeMsg", {})
call s:h("MoreMsg", {})
call s:h("NonText", { "fg": s:special_grey })
call s:h("Normal", { "fg": s:white, "bg": s:black })
hi link Normal Terminal
call s:h("Pmenu", { "bg": s:menu_grey })
call s:h("PmenuSel", { "fg": s:black, "bg": s:blue })
call s:h("PmenuSbar", { "bg": s:special_grey })
call s:h("PmenuThumb", { "bg": s:white })
call s:h("Question", { "fg": s:purple })
call s:h("QuickFixLine", { "fg": s:yellow, "bg": s:gutter_fg_grey })
call s:h("Search", { "fg": s:black, "bg": s:yellow })
call s:h("SpecialKey", { "fg": s:comment_grey })
call s:h("SpellBad", { "fg": s:red, "gui": "underline" })
call s:h("SpellCap", { "fg": s:dark_yellow })
call s:h("SpellLocal", { "fg": s:dark_yellow })
call s:h("SpellRare", { "fg": s:dark_yellow })
call s:h("StatusLine", { "fg": s:white, "bg": s:cursor_grey })
call s:h("StatusLineNC", { "fg": s:cursor_grey, "bg": s:comment_grey })
call s:h("StatusLineTerm", { "fg": s:white, "bg": s:cursor_grey })
call s:h("StatusLineTermNC", { "fg": s:comment_grey })
call s:h("TabLine", { "fg": s:white, "bg": s:menu_grey })
call s:h("TabLineFill", { "bg": s:vertsplit })
call s:h("TabLineSel", { "fg": s:yellow })
call s:h("Title", { "fg": s:green })
call s:h("Visual", { "fg": s:visual_black, "bg": s:visual_grey })
call s:h("VisualNOS", { "bg": s:visual_grey })
call s:h("WarningMsg", { "fg": s:yellow })
call s:h("WildMenu", { "fg": s:black, "bg": s:blue })
" diff mode 'vimdiff'
call s:h("DiffAdd", { "fg": s:green, "bg": s:black, "gui": "reverse" })
call s:h("DiffChange", { "fg": s:cyan, "bg": s:black, "gui": "reverse" })
call s:h("DiffDelete", { "fg": s:red, "bg": s:black, "gui": "reverse" })
call s:h("DiffText", { "fg": s:yellow, "bg": s:black, "gui": "reverse" })

" }}}

" diff file *.diff
call s:h("diffAdded", { "fg" : s:green })
call s:h("diffRemoved", { "fg" : s:red })
call s:h("diffChanged", { "fg" : s:cyan })
call s:h("diffFile", { "fg" : s:dark_yellow })
call s:h("diffNewFile", { "fg" : s:yellow })
call s:h("diffLine", { "fg" : s:blue })

" Markdown (keep consistent with HTML, above)
call s:h("markdownBlockquote", { "fg": s:comment_grey })
call s:h("markdownBold", { "fg": s:dark_yellow, "gui": "bold" })
call s:h("markdownCode", { "fg": s:green })
call s:h("markdownCodeBlock", { "fg": s:green })
call s:h("markdownCodeDelimiter", { "fg": s:green })
call s:h("markdownH1", { "fg": s:red })
call s:h("markdownH2", { "fg": s:red })
call s:h("markdownH3", { "fg": s:red })
call s:h("markdownH4", { "fg": s:red })
call s:h("markdownH5", { "fg": s:red })
call s:h("markdownH6", { "fg": s:red })
call s:h("markdownHeadingDelimiter", { "fg": s:red })
call s:h("markdownHeadingRule", { "fg": s:comment_grey })
call s:h("markdownId", { "fg": s:purple })
call s:h("markdownIdDeclaration", { "fg": s:blue })
call s:h("markdownIdDelimiter", { "fg": s:purple })
call s:h("markdownItalic", { "fg": s:purple, "gui": "italic" })
call s:h("markdownLinkDelimiter", { "fg": s:purple })
call s:h("markdownLinkText", { "fg": s:blue })
call s:h("markdownListMarker", { "fg": s:red })
call s:h("markdownOrderedListMarker", { "fg": s:red })
call s:h("markdownRule", { "fg": s:comment_grey })
call s:h("markdownUrl", { "fg": s:comment_grey, "gui": "underline" })

" Must appear at the end of the file to work around this oddity:
" https://groups.google.com/forum/#!msg/vim_dev/afPqwAFNdrU/nqh6tOM87QUJ
set background=dark
