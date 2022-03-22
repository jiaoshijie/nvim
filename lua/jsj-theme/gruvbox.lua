local Color, c, Group, g, s = require("colorbuddy").setup()

local b = s.bold
local i = s.italic
local uc = s.undercurl
local ul = s.underline
local r = s.reverse
local no = s.NONE

vim.g.colors_name = 'gruvbox'
if vim.o.background == 'dark' then
  Color.new('bg0', '#1d2021')  -- hard: #1d2021, normal: #282828, soft: #32302f
  Color.new('bg1', '#3c3836')
  Color.new('bg2', '#504945')
  Color.new('bg3', '#665c54')
  Color.new('bg4', '#7c6f64')
  Color.new('gray', '#928374')
  Color.new('fg0', '#fbf1c7')  -- hard: #f9f5d7, normal: #fbf1c7, soft: #f2e5bc
  Color.new('fg1', '#ebdbb2')
  Color.new('fg2', '#d5c4a1')
  Color.new('fg3', '#bdae93')
  Color.new('fg4', '#a89984')
  Color.new('red', '#fb4934')
  Color.new('green', '#b8bb26')
  Color.new('yellow', '#fabd2f')
  Color.new('blue', '#83a598')
  Color.new('purple', '#d3869b')
  Color.new('aqua', '#8ec07c')
  Color.new('orange', '#f38019')
  Color.new('visual_red', '#5D120A')  -- lsp virual text
  Color.new('visual_yellow', '#565303')  -- lsp virual text
  Color.new('visual_green', '#165603')  -- lsp virual text
  Color.new('visual_aqua', '#032C56')  -- lsp virual text
else
  Color.new('bg0', '#ffffff')  -- hard: #f9f5d7, normal: #fbf1c7, soft: #f2e5bc
  Color.new('bg1', '#ebdbb2')
  Color.new('bg2', '#d5c4a1')
  Color.new('bg3', '#bdae93')
  Color.new('bg4', '#a89984')
  Color.new('gray', '#928374')
  Color.new('fg0', '#282828')  -- hard: #1d2021, normal: #282828, soft: #32302f
  Color.new('fg1', '#3c3836')
  Color.new('fg2', '#504945')
  Color.new('fg3', '#665c54')
  Color.new('fg4', '#7c6f64')
  Color.new('red', '#9d0006')
  Color.new('green', '#79740e')
  Color.new('yellow', '#b57614')
  Color.new('blue', '#076678')
  Color.new('purple', '#8f3f71')
  Color.new('aqua', '#427b58')
  Color.new('orange', '#af3a03')
  Color.new('visual_red', '#FBD1C7')  -- lsp virual text
  Color.new('visual_yellow', '#FBFBC7')  -- lsp virual text
  Color.new('visual_green', '#C7FBD9')  -- lsp virual text
  Color.new('visual_aqua', '#C7E9FB')  -- lsp virual text
end

Color.new('statusline', '#2c323c')
Color.new('statuslineNC', '#5c6370')

-------------------------
-- Vim Terminal Colors --
-------------------------

vim.g.terminal_color_0  = vim.o.background == 'dark' and "#282828" or "#fbf1c7"
vim.g.terminal_color_8  = "#928374"
vim.g.terminal_color_1  = "#cc241d"
vim.g.terminal_color_9  = vim.o.background == 'dark' and "#fb4934" or "#9d0006"
vim.g.terminal_color_2  = "#98971a"
vim.g.terminal_color_10 = vim.o.background == 'dark' and "#b8bb26" or "#79740e"
vim.g.terminal_color_3  = "#d79921"
vim.g.terminal_color_11 = vim.o.background == 'dark' and "#fabd2f" or "#b57614"
vim.g.terminal_color_4  = "#458588"
vim.g.terminal_color_12 = vim.o.background == 'dark' and "#83a598" or "#076678"
vim.g.terminal_color_5  = "#b16286"
vim.g.terminal_color_13 = vim.o.background == 'dark' and "#d3869b" or "#8f3f71"
vim.g.terminal_color_6  = "#689d6a"
vim.g.terminal_color_14 = vim.o.background == 'dark' and "#8ec07c" or "#427b58"
vim.g.terminal_color_7  = "#d65d0e"
vim.g.terminal_color_15 = vim.o.background == 'dark' and "#f38018" or "#af3a03"

Group.new('Normal', c.fg1, c.bg0, no)
Group.new('CursorLine', c.none, c.bg1, no)
Group.new('CursorColumn', g.CursorLine, g.CursorLine, g.CursorLine)
Group.new('TabLineFill', c.bg4, c.bg1, r)
Group.new('TabLineSel', c.green, c.bg1, r)
Group.new('TabLine', g.TabLineFill, g.TabLineFill, g.TabLineFill)
Group.new('MatchParen', c.none, c.bg3, b)
Group.new('ColorColumn', c.none, c.bg1)
Group.new('Conceal', c.blue, c.none)
Group.new('CursorLineNr', c.yellow, c.bg1, b)
Group.new('NonText', c.bg2, c.none, no)
Group.new('Whitespace', c.purple, c.none, no)
Group.new('SpecialKey', c.bg2, c.none, no)
Group.new('Visual', c.none, c.bg3, r)
Group.new('VisualNOS', g.Visual, g.Visual, g.Visual)
Group.new('Search', c.yellow, c.bg0, r)
Group.new('IncSearch', c.orange, c.bg0, r)
Group.new('Underlined', c.blue, c.none, ul)
Group.new('NormalFloat', g.Normal, g.Normal, g.Normal)

Group.new('StatusLine', c.none, c.statusline, no)
Group.new('StatusLineNC', c.none, c.statuslineNC, no)

Group.new('VertSplit', c.bg3, c.bg0, no)
Group.new('WinSeparator', c.bg3, c.bg0, no)
Group.new('WildMenu', c.blue, c.bg2, b)
Group.new('Directory', c.green, c.none, b)
Group.new('Title', c.green, c.none, b)
Group.new('ErrorMsg', c.bg0, c.red, b)
Group.new('MoreMsg', c.yellow, c.none, b)
Group.new('ModeMsg', c.yellow, c.none, b)
Group.new('Question', c.orange, c.none, b)
Group.new('WarningMsg', c.red, c.none, b)
Group.new('LineNr', c.bg4, c.none, no)
Group.new('SignColumn', g.LineNr, g.LineNr, g.LineNr)
Group.new('Folded', c.gray, c.bg1, i)
Group.new('FoldColumn', c.gray, c.bg1)
Group.new('Cursor', c.none, c.none, r)
Group.new('lCursor', g.Cursor, g.Cursor, g.Cursor)


-- highlight

Group.new('Special', c.orange, c.none, no)
Group.new('Comment', c.gray, c.none, i)
Group.new('Todo', c.yellow, c.bg0, i + b)
Group.new('Error', c.red, c.bg0, r + b)
Group.new('Statement', c.red, c.none, no)
Group.new('Conditional', c.red, c.none, no)
Group.new('Repeat', c.red, c.none, no)
Group.new('Label', c.red, c.none, no)
Group.new('Exception', c.red, c.none, no)
Group.new('Operator', c.fg1, c.none, no)
Group.new('Keyword', c.red, c.none, no)
Group.new('Identifier', c.blue, c.none, no)
Group.new('Function', c.green, c.none, b)
Group.new('PreProc', c.aqua, c.none, no)
Group.new('Include', c.aqua, c.none, no)
Group.new('Define', c.aqua, c.none, no)
Group.new('Macro', c.aqua, c.none, no)
Group.new('PreCondit', c.aqua, c.none, no)
Group.new('Constant', c.purple, c.none, no)
Group.new('Character', c.purple, c.none, no)
Group.new('String', c.green, c.none, i)
Group.new('Boolean', c.purple, c.none, no)
Group.new('Number', c.purple, c.none, no)
Group.new('Float', c.purple, c.none, no)
Group.new('Type', c.yellow, c.none, no)
Group.new('StorageClass', c.orange, c.none, no)
Group.new('Structure', c.aqua, c.none, no)
Group.new('Typedef', c.yellow, c.none, no)
--[[ Completion Menu ]]
Group.new('Pmenu', c.fg1, c.bg2, no)
Group.new('PmenuSel', c.bg2, c.blue, b + i)
Group.new('PmenuSbar', c.none, c.bg2, no)
Group.new('PmenuThumb', c.none, c.bg4, no)
-- [[ Diffs ]]
Group.new('DiffDelete', c.red, c.bg0, r)
Group.new('DiffAdd', c.green, c.bg0, r)
Group.new('DiffChange', c.aqua, c.bg0, r)
Group.new('DiffText', c.yellow, c.bg0, r)
-- [[ Spelling ]]
Group.new('SpellCap', c.none, c.none, uc, c.red)
Group.new('SpellBad', c.none, c.none, uc, c.blue)
Group.new('SpellLocal', c.none, c.none, uc, c.aqua)
Group.new('SpellRare', c.none, c.none, uc, c.purple)
-- [[ Netrw ]]
Group.new('netrwDir', c.aqua, c.none, no)
Group.new('netrwClassify', c.aqua, c.none, no)
Group.new('netrwLink', c.gray, c.none, no)
Group.new('netrwSymLink', c.fg1, c.none, no)
Group.new('netrwExe', c.yellow, c.none, no)
Group.new('netrwComment', c.gray, c.none, no)
Group.new('netrwList', c.blue, c.none, no)
Group.new('netrwHelpCmd', c.aqua, c.none, no)
Group.new('netrwCmdSep', c.fg3, c.none, no)
Group.new('netrwVersion', c.green, c.none, no)

---------------------
-- FileType specific
---------------------

Group.new('diffAdded', c.green, c.none, no)
Group.new('diffRemoved', c.red, c.none, no)
Group.new('diffChanged', c.aqua, c.none, no)
Group.new('diffFile', c.orange, c.none, no)
Group.new('diffNewFile', c.yellow, c.none, no)
Group.new('diffLine', c.blue, c.none, no)


-- Html

Group.new('htmlTag', c.blue, c.none, no)
Group.new('htmlEndTag', c.blue, c.none, no)
Group.new('htmlTagName', c.aqua, c.none, b)
Group.new('htmlArg', c.aqua, c.none, no)
Group.new('htmlScriptTag', c.purple, c.none, no)
Group.new('htmlTagN', c.fg1, c.none, no)
Group.new('htmlSpecialTagName', c.aqua, c.none, b)
Group.new('htmlLink', c.fg4, c.none, ul)
Group.new('htmlSpecialChar', c.orange, c.none, no)
Group.new('htmlBold', c.none, c.none, b)
Group.new('htmlBoldUnderline', c.none, c.none, b + ul)
Group.new('htmlBoldItalic', c.none, c.none, b + i)
Group.new('htmlBoldUnderlineItalic', c.none, c.none, b + i + ul)
Group.new('htmlUnderline', c.none, c.none, ul)
Group.new('htmlUnderlineItalic', c.none, c.none, ul + i)
Group.new('htmlItalic', c.none, c.none, i)

-- Xml
Group.new('xmlTag', c.blue, c.none, no)
Group.new('xmlEndTag', c.blue, c.none, no)
Group.new('xmlTagName', c.blue, c.none, no)
Group.new('xmlEqual', c.blue, c.none, no)
Group.new('docbkKeyword', c.aqua, c.blue, b)
Group.new('xmlDocTypeDecl', c.gray, c.none, no)
Group.new('xmlDocTypeKeyword', c.purple, c.none, no)
Group.new('xmlCdataStart', c.gray, c.none, no)
Group.new('xmlCdataCdata', c.purple, c.none, no)
Group.new('dtdFunction', c.gray, c.none, no)
Group.new('dtdTagName', c.purple, c.none, no)
Group.new('xmlAttrib', c.aqua, c.none, no)
Group.new('xmlProcessingDelim', c.gray, c.none, no)
Group.new('dtdParamEntityPunct', c.gray, c.none, no)
Group.new('dtdParamEntityDPunct', c.gray, c.none, no)
Group.new('xmlAttribPunct', c.gray, c.none, no)
Group.new('xmlEntity', c.orange, c.none, no)
Group.new('xmlEntityPunct', c.orange, c.none, no)

-- vim
Group.new('vimCommentTitle', c.fg4, c.none, b + i)

Group.new('vimNotation', c.orange, c.none, no)
Group.new('vimBracket', c.orange, c.none, no)
Group.new('vimMapModKey', c.orange, c.none, no)
Group.new('vimFuncSID', c.fg3, c.none, no)
Group.new('vimSetSep', c.fg3, c.none, no)
Group.new('vimSep', c.fg3, c.none, no)
Group.new('vimContinue', c.fg3, c.none, no)

-- C
Group.new('cOperator', c.purple, c.none, no)
Group.new('cStructure', c.orange, c.none, no)


-- Python

Group.new('pythonBuiltin', c.orange, c.none, no)
Group.new('pythonBuiltinObj', c.orange, c.none, no)
Group.new('pythonBuiltinFunc', c.orange, c.none, no)
Group.new('pythonFunction', c.aqua, c.none, no)
Group.new('pythonDecorator', c.red, c.none, no)
Group.new('pythonInclude', c.blue, c.none, no)
Group.new('pythonImport', c.blue, c.none, no)
Group.new('pythonRun', c.blue, c.none, no)
Group.new('pythonCoding', c.blue, c.none, no)
Group.new('pythonOperator', c.red, c.none, no)
Group.new('pythonException', c.red, c.none, no)
Group.new('pythonExceptions', c.purple, c.none, no)
Group.new('pythonBoolean', c.fg3, c.none, no)
Group.new('pythonDot', c.fg3, c.none, no)
Group.new('pythonConditional', c.red, c.none, no)
Group.new('pythonRepeat', c.red, c.none, no)
Group.new('pythonDottedName', c.green, c.none, b)


-- CSS

Group.new('cssBraces', c.blue, c.none, no)
Group.new('cssFunctionName', c.yellow, c.none, no)
Group.new('cssIdentifier', c.orange, c.none, no)
Group.new('cssClassName', c.green, c.none, no)
Group.new('cssColor', c.blue, c.none, no)
Group.new('cssSelectorOp', c.blue, c.none, no)
Group.new('cssSelectorOp2', c.blue, c.none, no)
Group.new('cssImportant', c.green, c.none, no)
Group.new('cssVendor', c.fg1, c.none, no)
Group.new('cssTextProp', c.aqua, c.none, no)
Group.new('cssAnimationProp', c.aqua, c.none, no)
Group.new('cssUIProp', c.yellow, c.none, no)
Group.new('cssTransformProp', c.aqua, c.none, no)
Group.new('cssTransitionProp', c.aqua, c.none, no)
Group.new('cssPrintProp', c.aqua, c.none, no)
Group.new('cssPositioningProp', c.yellow, c.none, no)
Group.new('cssBoxProp', c.aqua, c.none, no)
Group.new('cssFontDescriptorProp', c.yellow, c.none, no)
Group.new('cssFlexibleBoxProp', c.aqua, c.none, no)
Group.new('cssBorderOutlineProp', c.aqua, c.none, no)
Group.new('cssBackgroundProp', c.aqua, c.none, no)
Group.new('cssMarginProp', c.aqua, c.none, no)
Group.new('cssListProp', c.aqua, c.none, no)
Group.new('cssTableProp', c.aqua, c.none, no)
Group.new('cssFontProp', c.aqua, c.none, no)
Group.new('cssPaddingProp', c.aqua, c.none, no)
Group.new('cssDimensionProp', c.aqua, c.none, no)
Group.new('cssRenderProp', c.aqua, c.none, no)
Group.new('cssColorProp', c.aqua, c.none, no)
Group.new('cssGeneratedContentProp', c.aqua, c.none, no)


-- JavaScript

Group.new('javaScriptBraces', c.fg1, c.none, no)
Group.new('javaScriptFunction', c.aqua, c.none, no)
Group.new('javaScriptIdentifier', c.red, c.none, no)
Group.new('javaScriptMember', c.blue, c.none, no)
Group.new('javaScriptNumber', c.purple, c.none, no)
Group.new('javaScriptNull', c.purple, c.none, no)
Group.new('javaScriptParens', c.fg3, c.none, no)

-- TypeScript

Group.new('typeScriptReserved', c.aqua, c.none, no)
Group.new('typeScriptLabel', c.aqua, c.none, no)
Group.new('typeScriptFuncKeyword', c.aqua, c.none, no)
Group.new('typeScriptIdentifier', c.orange, c.none, no)
Group.new('typeScriptBraces', c.fg1, c.none, no)
Group.new('typeScriptEndColons', c.fg1, c.none, no)
Group.new('typeScriptDOMObjects', c.fg1, c.none, no)
Group.new('typeScriptAjaxMethods', c.fg1, c.none, no)
Group.new('typeScriptLogicSymbols', c.fg1, c.none, no)
Group.new('typeScriptDocSeeTag', g.Comment, g.Comment, g.Comment)
Group.new('typeScriptDocParam', g.Comment, g.Comment, g.Comment)
Group.new('typeScriptDocTags', g.vimCommentTitle, g.vimCommentTitle, g.vimCommentTitle)
Group.new('typeScriptGlobalObjects', c.fg1, c.none, no)
Group.new('typeScriptParens', c.fg3, c.none, no)
Group.new('typeScriptOpSymbols', c.fg3, c.none, no)
Group.new('typeScriptHtmlElemProperties', c.fg1, c.none, no)
Group.new('typeScriptNull', c.purple, c.none, no)
Group.new('typeScriptInterpolationDelimiter', c.aqua, c.none, no)

-- Go

Group.new('goDirective', c.aqua, c.none, no)
Group.new('goConstants', c.purple, c.none, no)
Group.new('goDeclaration', c.red, c.none, no)
Group.new('goDeclType', c.blue, c.none, no)
Group.new('goBuiltins', c.orange, c.none, no)

-- Lua
Group.new('luaIn', c.red, c.none, no)
Group.new('luaFunction', c.aqua, c.none, no)
Group.new('luaTable', c.orange, c.none, no)

-- Markdown
Group.new('markdownItalic', c.fg3, c.none, i)

Group.new('markdownH1', c.green, c.none, b)
Group.new('markdownH2', c.green, c.none, b)
Group.new('markdownH3', c.yellow, c.none, b)
Group.new('markdownH4', c.yellow, c.none, b)
Group.new('markdownH5', c.yellow, c.none, no)
Group.new('markdownH6', c.yellow, c.none, no)
Group.new('markdownCode', c.aqua, c.none, no)
Group.new('markdownCodeBlock', c.aqua, c.none, no)
Group.new('markdownCodeDelimiter', c.aqua, c.none, no)
Group.new('markdownBlockquote', c.gray, c.none, no)
Group.new('markdownListMarker', c.gray, c.none, no)
Group.new('markdownOrderedListMarker', c.gray, c.none, no)
Group.new('markdownRule', c.gray, c.none, no)
Group.new('markdownHeadingRule', c.gray, c.none, no)
Group.new('markdownUrlDelimiter', c.fg3, c.none, no)
Group.new('markdownLinkDelimiter', c.fg3, c.none, no)
Group.new('markdownLinkTextDelimiter', c.fg3, c.none, no)
Group.new('markdownHeadingDelimiter', c.orange, c.none, no)
Group.new('markdownUrl', c.purple, c.none, no)
Group.new('markdownUrlTitleDelimiter', c.green, c.none, no)

Group.new('markdownLinkText', c.gray, c.none, ul)
Group.new('markdownIdDeclaration', g.markdownLinkText, g.markdownLinkText, g.markdownLinkText)
Group.new('markdownError', c.red, c.none, no)

-- Json
Group.new('jsonKeyword', c.green, c.none, no)
Group.new('jsonQuote', c.green, c.none, no)
Group.new('jsonBraces', c.fg1, c.none, no)
Group.new('jsonString', c.fg1, c.none, no)


----------------
-- plugins
----------------

-- lsp highlighting

Group.new('DiagnosticError'            , c.red    , c.none          , no)
Group.new('DiagnosticWarn'             , c.yellow , c.none          , no)
Group.new('DiagnosticInfo'             , c.aqua   , c.none          , no)
Group.new('DiagnosticHint'             , c.green  , c.none          , no)
Group.new('DiagnosticVirtualTextError' , c.red    , c.visual_red    , i)
Group.new('DiagnosticVirtualTextWarn'  , c.yellow , c.visual_yellow , i)
Group.new('DiagnosticVirtualTextInfo'  , c.aqua   , c.visual_aqua   , i)
Group.new('DiagnosticVirtualTextHint'  , c.green  , c.visual_green  , i)
Group.new('DiagnosticUnderlineError'   , c.none   , c.none          , uc  , c.red)
Group.new('DiagnosticUnderlineWarn'    , c.none   , c.none          , uc  , c.yellow)
Group.new('DiagnosticUnderlineInfo'    , c.none   , c.none          , uc  , c.aqua)
Group.new('DiagnosticUnderlineHint'    , c.none   , c.none          , uc  , c.green)
Group.new('DiagnosticFloatingError'    , c.red    , c.none          , ul)
Group.new('DiagnosticFloatingWarn'     , c.yellow , c.none          , ul)
Group.new('DiagnosticFloatingInfo'     , c.aqua   , c.none          , ul)
Group.new('DiagnosticFloatingHint'     , c.green  , c.none          , ul)
Group.new('DiagnosticSignError'        , c.red    , c.none          , no)
Group.new('DiagnosticSignWarn'         , c.yellow , c.none          , no)
Group.new('DiagnosticSignInfo'         , c.aqua   , c.none          , no)
Group.new('DiagnosticSignHint'         , c.green  , c.none          , no)
Group.new('Jsj_LspDochighlight'        , c.none   , c.bg2           , no)

-- lsp document_highlight
Group.new('LspReferenceRead', g.Jsj_LspDochighlight, g.Jsj_LspDochighlight, g.Jsj_LspDochighlight)
Group.new('LspReferenceText', g.Jsj_LspDochighlight, g.Jsj_LspDochighlight, g.Jsj_LspDochighlight)
Group.new('LspReferenceWrite', g.Jsj_LspDochighlight, g.Jsj_LspDochighlight, g.Jsj_LspDochighlight)

-- TreeSitter Highlighting

Group.new('TSAnnotation'        , c.yellow, c.none, no)
Group.new('TSAttribute'         , c.aqua  , c.none, no)
Group.new('TSBoolean'           , c.yellow, c.none, no)
Group.new('TSCharacter'         , c.green , c.none, no)
Group.new('TSConditional'       , c.purple, c.none, no)
Group.new('TSConstant'          , c.blue  , c.none, no)
Group.new('TSConstBuiltin'      , c.yellow, c.none, no)
Group.new('TSConstMacro'        , c.aqua  , c.none, no)
Group.new('TSConstructor'       , c.aqua  , c.none, no)
Group.new('TSEmphasis'          , c.yellow, c.none, no)
Group.new('TSError'             , c.red   , c.none, no)
Group.new('TSException'         , c.purple, c.none, no)
Group.new('TSField'             , c.red   , c.none, no)
Group.new('TSFloat'             , c.green , c.none, no)
Group.new('TSFunction'          , c.blue  , c.none, no)
Group.new('TSFuncBuiltin'       , c.blue  , c.none, no)
Group.new('TSFuncMacro'         , c.yellow, c.none, no)
Group.new('TSInclude'           , c.purple, c.none, no)
Group.new('TSKeyword'           , c.purple, c.none, no)
Group.new('TSKeywordFunction'   , c.purple, c.none, no)
Group.new('TSKeywordOperator'   , c.purple, c.none, no)
Group.new('TSLabel'             , c.blue  , c.none, no)
Group.new('TSLiteral'           , c.yellow, c.none, no)
Group.new('TSMethod'            , c.blue  , c.none, no)
Group.new('TSNamespace'         , c.purple, c.none, no)
Group.new('TSNumber'            , c.yellow, c.none, no)
Group.new('TSOperator'          , c.fg0   , c.none, no)
Group.new('TSParameter'         , c.aqua  , c.none, no)
Group.new('TSParameterReference', c.aqua  , c.none, no)
Group.new('TSProperty'          , c.yellow, c.none, no)
Group.new('TSPunctBracket'      , c.fg0   , c.none, no)
Group.new('TSPunctDelimiter'    , c.fg0   , c.none, no)
Group.new('TSPunctSpecial'      , c.fg0   , c.none, no)
Group.new('TSRepeat'            , c.purple, c.none, no)
Group.new('TSString'            , c.green , c.none, no)
Group.new('TSStringEscape'      , c.aqua  , c.none, no)
Group.new('TSStringRegex'       , c.green , c.none, no)
Group.new('TSStrong'            , c.yellow, c.none, no)
Group.new('TSStructure'         , c.yellow, c.none, no)
Group.new('TSTag'               , c.red   , c.none, no)
Group.new('TSTagDelimiter'      , c.grey  , c.none, no)
Group.new('TSText'              , c.yellow, c.none, no)
Group.new('TSTitle'             , c.yellow, c.none, no)
Group.new('TSType'              , c.purple, c.none, no)
Group.new('TSTypeBuiltin'       , c.purple, c.none, no)
Group.new('TSUnderline'         , c.yellow, c.none, no)
Group.new('TSURI'               , c.yellow, c.none, no)
Group.new('TSVariable'          , c.aqua  , c.none, no)
Group.new('TSVariableBuiltin'   , c.yellow, c.none, no)

-- telescope

Group.new('TelescopeNormal'         , c.fg0    , c.none , no)
Group.new('TelescopeSelection'      , c.none   , c.bg4  , b)
Group.new('TelescopeSlectionCaret'  , c.red    , c.none , no)
Group.new('TelescopeMultiSelection' , c.grey   , c.none , no)
Group.new('TelescopeBorder'         , c.yellow , c.none , no)
Group.new('TelescopePromptBorder'   , c.blue   , c.none , no)
Group.new('TelescopeResultsBorder'  , c.yellow , c.none , no)
Group.new('TelescopePreviewBorder'  , c.purple , c.none , no)
Group.new('TelescopeMatching '      , c.yellow , c.none , b)
Group.new('TelescopePromptPrefix'   , c.red    , c.none , no)

-- which-key

Group.new('WhichKey'          , g.Function   , g.Function   , g.Function)
Group.new('WhichKeyGroup'     , g.Keyword    , g.Keyword    , g.Keyword)
Group.new('WhichKeySeparator' , g.DiffAdded  , c.bg2        , g.DiffAdded)
Group.new('WhichKeyDesc'      , g.Identifier , g.Identifier , g.Identifier)
Group.new('WhichKeyFloat'     , c.none       , c.bg2        , no)
Group.new('WhichKeyValue'     , g.Comment    , g.Comment    , g.Comment)

-- nvim-cmp
Group.new('CmpItemAbbr', c.fg4, c.none, no)
Group.new('CmpItemAbbrDeprecated', g.CmpItemAbbr, c.none, i)
Group.new('CmpItemAbbrMatch', c.yellow, c.none, b)
Group.new('CmpItemAbbrMatchFuzzy', c.fg0, c.none, b)
Group.new('CmpItemMenu', c.aqua, c.none, no)
Group.new('CmpItemKind', c.orange, c.none, no)


-- lukas-reineke/indent-blankline.nvim
Group.new('IndentBlanklineChar', g.NonText, g.NonText, g.NonText)

-- github/Copilot
Group.new('CopilotSuggestion', c.gray, c.none, i)

-- Undotree
Group.new('UndotreeDiffLine', c.aqua, c.bg0, no)
Group.new('UndotreeDiffAdded', c.green, c.bg0, r)
Group.new('UndotreeDiffRemoved', c.red, c.bg0, r)
