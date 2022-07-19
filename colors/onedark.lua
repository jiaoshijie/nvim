local h = require("init-utils").hl

vim.opt.background = "dark"
vim.g.colors_name = "onedark"

local c = {}
local s = { b = "bold", ul = "underline", ull = "underlineline", uc = "undercurl", r = "reverse", i = "italic" }

c.red = "#E06C75"
c.dark_red = "#BE5046"
c.green = "#98C379"
c.yellow = "#E5C07B"
c.dark_yellow = "#D19A66"
c.blue = "#61AFEF"
c.purple = "#C678DD"
c.cyan = "#56B6C2"
c.white = "#ABB2BF"
c.black = "#282C34"
c.comment_gray = "#5C6370"
c.gutter_fg_gray = "#4B5263"
c.cursor_gray = "#2C323C"
c.visual_gray = "#3E4452"
c.menu_gray = "#3E4452"
c.special_gray = "#3B4048"
c.vertsplit = "#181A1F"
c.statusline = "#2c323c"
c.statuslineNC = "#5c6370"
c.visual_red = "#342828" -- lsp virual text
c.visual_yellow = "#343428" -- lsp virual text
c.visual_green = "#2A3428" -- lsp virual text
c.visual_cyan = "#282E34" -- lsp virual text

-------------------------
--  Vim Editor Colors  --
-------------------------

h("ColorColumn", { bg = c.cursor_gray })
h("Conceal", {})
h("Cursor", { fg = c.black, bg = c.blue })
h("CursorIM", {})
h("CursorColumn", { bg = c.cursor_gray })
h("CursorLine", { bg = c.cursor_gray })
h("Directory", { fg = c.blue })
h("EndOfBuffer", { fg = c.special_gray })
h("ErrorMsg", { fg = c.red })
h("VertSplit", { fg = c.vertsplit })
h("WinSeparator", { fg = c.vertsplit })
h("Folded", { fg = c.comment_gray })
h("FoldColumn", {})
h("IncSearch", { fg = c.yellow, bg = c.comment_gray })
h("LineNr", { fg = c.gutter_fg_gray })
h("SignColumn", { link = "LineNr" })
h("CursorLineNr", { fg = c.yellow, bg = c.cursor_gray, gui = s.b })
h("MatchParen", { fg = c.blue, gui = s.ul .. "," .. s.b })
h("ModeMsg", {})
h("MoreMsg", {})
h("NonText", { fg = c.special_gray })
h("Whitespace", { fg = c.comment_gray })
h("Normal", { fg = c.white, bg = c.black })
h("Pmenu", { bg = c.menu_gray })
h("PmenuSel", { fg = c.black, bg = c.blue, gui = s.b .. "," .. s.i })
h("PmenuSbar", { bg = c.special_gray })
h("PmenuThumb", { bg = c.white })
h("Question", { fg = c.purple })
h("QuickFixLine", { fg = c.black, bg = c.yellow })
h("Search", { fg = c.black, bg = c.yellow })
h("SpecialKey", { fg = c.special_gray })
h("SpellBad", { fg = c.red, gui = s.ul })
h("SpellCap", { fg = c.dark_yellow })
h("SpellLocal", { fg = c.dark_yellow })
h("SpellRare", { fg = c.dark_yellow })
h("StatusLine", { bg = c.statusline })
h("StatusLineNC", { bg = c.statuslineNC })
h("WinBar", { bg = c.statusline })
h("WinBarNC", { bg = c.statuslineNC })
h("StatusLineTerm", { bg = c.statusline })
h("StatusLineTermNC", { bg = c.statuslineNC })
h("TabLine", { fg = c.white, bg = c.menu_gray })
h("TabLineFill", { bg = c.vertsplit })
h("TabLineSel", { fg = c.yellow, bg = c.special_gray, gui = s.b })
h("Terminal", { fg = c.white, bg = c.black })
h("Title", { fg = c.green })
h("Visual", { bg = c.visual_gray })
h("VisualNOS", { bg = c.visual_gray })
h("WarningMsg", { fg = c.yellow })
h("WildMenu", { fg = c.black, bg = c.blue })
h("NormalFloat", { link = "Normal" })

---------------------------
-- Vim Help Highlighting --
---------------------------

h("helpCommand", { fg = c.yellow })
h("helpExample", { fg = c.yellow })
h("helpHeader", { fg = c.white, gui = s.b })
h("helpSectionDelim", { fg = c.comment_gray })

-----------------------
-- Diff Highlighting --
-----------------------
-- diff mode 'nvim -d'
h("DiffAdd", { fg = c.green, bg = c.black, gui = s.r })
h("DiffChange", { fg = c.cyan, bg = c.black, gui = s.r })
h("DiffDelete", { fg = c.red, bg = c.black, gui = s.r })
h("DiffText", { fg = c.yellow, bg = c.black, gui = s.r })

-- diff file *.diff
h("diffAdded", { fg = c.green })
h("diffRemoved", { fg = c.red })
h("diffChanged", { fg = c.cyan })
h("diffFile", { fg = c.dark_yellow })
h("diffNewFile", { fg = c.yellow })
h("diffLine", { fg = c.blue })

-------------------------
--  Vim Syntax Colors  --
-------------------------
h("Comment", { fg = c.comment_gray, gui = s.i })
h("Constant", { fg = c.cyan })
h("String", { fg = c.green })
h("Character", { fg = c.green })
h("Number", { fg = c.dark_yellow })
h("Boolean", { fg = c.dark_yellow })
h("Float", { fg = c.dark_yellow })
h("Identifier", { fg = c.red })
h("Function", { fg = c.blue })
h("Statement", { fg = c.purple })
h("Conditional", { fg = c.purple })
h("Repeat", { fg = c.purple })
h("Label", { fg = c.purple })
h("Operator", { fg = c.purple })
h("Keyword", { fg = c.red })
h("Exception", { fg = c.purple })
h("PreProc", { fg = c.yellow })
h("Include", { fg = c.blue })
h("Define", { fg = c.purple })
h("Macro", { fg = c.purple })
h("PreCondit", { fg = c.yellow })
h("Type", { fg = c.yellow })
h("StorageClass", { fg = c.yellow })
h("Structure", { fg = c.yellow })
h("Typedef", { fg = c.yellow })
h("Special", { fg = c.blue })
h("SpecialChar", { fg = c.dark_yellow })
h("Tag", {})
h("Delimiter", {})
h("SpecialComment", { fg = c.comment_gray })
h("Debug", { fg = c.yellow, gui = s.b .. "," .. s.i })
h("Underline", { gui = s.ul })
h("Ignore", {})
h("Error", { fg = c.red })
h("Todo", { fg = c.yellow, c.dark_red, gui = s.b .. "," .. s.i })

---------------------------
-- Filetype Highlighting --
---------------------------

-- Vim
h("vimCommand", { fg = c.purple })
h("vimCommentTitle", { fg = c.comment_gray, gui = s.b })
h("vimFunction", { fg = c.cyan })
h("vimFuncName", { fg = c.purple })
h("vimHighlight", { fg = c.blue })
h("vimLineComment", { fg = c.comment_gray, gui = s.i })
h("vimParenSep", { fg = c.comment_gray })
h("vimSep", { fg = c.comment_gray })
h("vimUserFunc", { fg = c.cyan })
h("vimVar", { fg = c.red })

-- Markdown
h("markdownUrl", { fg = c.comment_gray, gui = s.ul })
h("markdownBold", { fg = c.dark_yellow, gui = s.b })
h("markdownItalic", { fg = c.purple, gui = s.i })
h("markdownCode", { fg = c.green })
h("markdownCodeBlock", { fg = c.green })
h("markdownCodeDelimiter", { fg = c.green })
h("markdownHeadingDelimiter", { fg = c.dark_red })
h("markdownH1", { fg = c.red })
h("markdownH2", { fg = c.red })
h("markdownH3", { fg = c.red })
h("markdownH3", { fg = c.red })
h("markdownH4", { fg = c.red })
h("markdownH5", { fg = c.red })
h("markdownH6", { fg = c.red })
h("markdownListMarker", { fg = c.red })
h("markdownBlockquote", { fg = c.comment_gray })
h("markdownHeadingRule", { fg = c.comment_gray })
h("markdownId", { fg = c.purple })
h("markdownIdDeclaration", { fg = c.blue })
h("markdownIdDelimiter", { fg = c.purple })
h("markdownLinkDelimiter", { fg = c.purple })
h("markdownLinkText", { fg = c.blue })
h("markdownOrderedListMarker", { fg = c.red })
h("markdownRule", { fg = c.comment_gray })

-- Man
h("manTitle", { link = "String" })
h("manFooter", { fg = c.comment_gray })

-----------------------------
--     LSP Highlighting    --
-----------------------------
h("DiagnosticError", { fg = c.red })
h("DiagnosticWarn", { fg = c.yellow })
h("DiagnosticInfo", { fg = c.cyan })
h("DiagnosticHint", { fg = c.green })
h("DiagnosticVirtualTextError", { fg = c.red, bg = c.visual_red, gui = s.i })
h("DiagnosticVirtualTextWarn", { fg = c.yellow, bg = c.visual_yellow, gui = s.i })
h("DiagnosticVirtualTextInfo", { fg = c.cyan, bg = c.visual_gray, gui = s.i })
h("DiagnosticVirtualTextHint", { fg = c.green, bg = c.visual_gray, gui = s.i })
h("DiagnosticUnderlineError", { gui = s.uc, sp = c.red })
h("DiagnosticUnderlineWarn", { gui = s.uc, sp = c.yellow })
h("DiagnosticUnderlineInfo", { gui = s.uc, sp = c.cyan })
h("DiagnosticUnderlineHint", { gui = s.uc, sp = c.green })
h("DiagnosticFloatingError", { fg = c.red, gui = s.ul })
h("DiagnosticFloatingWarn", { fg = c.yellow, gui = s.ul })
h("DiagnosticFloatingInfo", { fg = c.cyan, gui = s.ul })
h("DiagnosticFloatingHint", { fg = c.green, gui = s.ul })
h("DiagnosticSignError", { fg = c.red })
h("DiagnosticSignWarn", { fg = c.yellow })
h("DiagnosticSignInfo", { fg = c.cyan })
h("DiagnosticSignHint", { fg = c.green })

h("Jsj_LspDochighlight", { bg = c.comment_gray })

-----------------------------
-- TreeSitter Highlighting --
-----------------------------
h("TSAnnotation", { fg = c.yellow })
h("TSAttribute", { fg = c.cyan })
h("TSBoolean", { fg = c.dark_yellow })
h("TSCharacter", { fg = c.green })
h("TSConditional", { fg = c.purple })
h("TSConstant", { fg = c.blue })
h("TSConstBuiltin", { fg = c.dark_yellow })
h("TSConstMacro", { fg = c.cyan })
h("TSConstructor", { fg = c.cyan })
h("TSEmphasis", { fg = c.yellow })
h("TSError", { fg = c.red })
h("TSException", { fg = c.purple })
h("TSField", { fg = c.red })
h("TSFloat", { fg = c.green })
h("TSFunction", { fg = c.blue })
h("TSFuncBuiltin", { fg = c.blue })
h("TSFuncMacro", { fg = c.yellow })
h("TSInclude", { fg = c.purple })
h("TSKeyword", { fg = c.purple })
h("TSKeywordFunction", { fg = c.purple })
h("TSKeywordOperator", { fg = c.purple })
h("TSLabel", { fg = c.blue })
h("TSLiteral", { fg = c.yellow })
h("TSMethod", { fg = c.blue })
h("TSNamespace", { fg = c.purple })
h("TSNumber", { fg = c.dark_yellow })
h("TSOperator", { fg = c.white })
h("TSParameter", { fg = c.cyan })
h("TSParameterReference", { fg = c.cyan })
h("TSProperty", { fg = c.yellow })
h("TSPunctBracket", { fg = c.white })
h("TSPunctDelimiter", { fg = c.white })
h("TSPunctSpecial", { fg = c.white })
h("TSRepeat", { fg = c.purple })
h("TSString", { fg = c.green })
h("TSStringEscape", { fg = c.cyan })
h("TSStringRegex", { fg = c.green })
h("TSStrong", { fg = c.yellow })
h("TSStructure", { fg = c.yellow })
h("TSTag", { fg = c.red })
h("TSTagDelimiter", { fg = c.comment_gray })
h("TSText", { fg = c.yellow })
h("TSTitle", { fg = c.yellow })
h("TSType", { fg = c.purple, gui = s.b })
h("TSTypeBuiltin", { fg = c.purple })
h("TSUnderline", { fg = c.yellow })
h("TSURI", { fg = c.yellow })
h("TSVariable", { fg = c.cyan })
h("TSVariableBuiltin", { fg = c.yellow })

---------------
-- telescope --
---------------
h("TelescopeNormal", { fg = c.white })
h("TelescopeSelection", { bg = c.cursor_gray, gui = s.b })
h("TelescopeSlectionCaret", { fg = c.red })
h("TelescopeMultiSelection", { fg = c.visual_gray })
h("TelescopeBorder", { fg = c.dark_yellow })
h("TelescopePromptBorder", { fg = c.blue })
h("TelescopeResultsBorder", { fg = c.yellow })
h("TelescopePreviewBorder", { fg = c.purple })
h("TelescopeMatching ", { fg = c.yellow, gui = s.b })
h("TelescopePromptPrefix", { fg = c.red })

-- Undotree
h("UndotreeDiffLine", { fg = c.cyan, bg = c.black })
h("UndotreeDiffAdded", { fg = c.green, bg = c.black, gui = s.r })
h("UndotreeDiffRemoved", { fg = c.red, bg = c.black, gui = s.r })
