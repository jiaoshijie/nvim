local Color, c, Group, g, s = require("colorbuddy").setup()

local b = s.bold
local i = s.italic
local uc = s.undercurl
local ul = s.underline
local r = s.reverse
local no = s.NONE

vim.opt.background = 'dark'
vim.g.colors_name = 'onedark'

Color.new('red'           , '#E06C75')
Color.new('dark_red'      , '#BE5046')
Color.new('green'         , '#98C379')
Color.new('yellow'        , '#E5C07B')
Color.new('dark_yellow'   , '#D19A66')
Color.new('blue'          , '#61AFEF')
Color.new('purple'        , '#C678DD')
Color.new('cyan'          , '#56B6C2')
Color.new('white'         , '#ABB2BF')
Color.new('black'         , '#282C34')
Color.new('comment_gray'  , '#5C6370')
Color.new('gutter_fg_gray', '#4B5263')
Color.new('cursor_gray'   , '#2C323C')
Color.new('visual_gray'   , '#3E4452')
Color.new('menu_gray'     , '#3E4452')
Color.new('special_gray'  , '#3B4048')
Color.new('vertsplit'     , '#181A1F')

Color.new('statusline'    , '#2c323c')
Color.new('statuslineNC'  , '#5c6370')
Color.new('visual_red'    , '#342828')  -- lsp virual text
Color.new('visual_yellow' , '#343428')  -- lsp virual text
Color.new('visual_green'  , '#2A3428')  -- lsp virual text
Color.new('visual_cyan'   , '#282E34')  -- lsp virual text

-------------------------
-- Vim Terminal Colors --
-------------------------

vim.g.terminal_color_0  = "#353a44"
vim.g.terminal_color_8  = "#353a44"
vim.g.terminal_color_1  = "#e88388"
vim.g.terminal_color_9  = "#e88388"
vim.g.terminal_color_2  = "#a7cc8c"
vim.g.terminal_color_10 = "#a7cc8c"
vim.g.terminal_color_3  = "#ebca8d"
vim.g.terminal_color_11 = "#ebca8d"
vim.g.terminal_color_4  = "#72bef2"
vim.g.terminal_color_12 = "#72bef2"
vim.g.terminal_color_5  = "#d291e4"
vim.g.terminal_color_13 = "#d291e4"
vim.g.terminal_color_6  = "#65c2cd"
vim.g.terminal_color_14 = "#65c2cd"
vim.g.terminal_color_7  = "#e3e5e9"
vim.g.terminal_color_15 = "#e3e5e9"

-------------------------
--  Vim Editor Colors  --
-------------------------

-- used for the columns set with 'colorcolumn'
Group.new('ColorColumn'      , c.none           , c.cursor_gray  , no)
-- placeholder characters substituted for concealed text (see 'conceallevel')
Group.new('Conceal'          , c.none           , c.none         , no)
-- the character under the cursor
Group.new('Cursor'           , c.black          , c.blue         , no)
-- like Cursor, but used when in IME mode
Group.new('CursorIM'         , c.none           , c.none         , no)
-- the screen column that the cursor is in when 'cursorcolumn' is set
Group.new('CursorColumn'     , c.none           , c.cursor_gray  , no)
-- directory names (and other special names in listings)
Group.new('CursorLine'       , c.none           , c.cursor_gray  , no)
-- directory names (and other special names in listings)
Group.new('Directory'        , c.blue           , c.none         , no)
-- end-of-buffer ~
Group.new('EndOfBuffer'      , c.special_gray   , c.none         , no)
-- error messages on the command line
Group.new('ErrorMsg'         , c.red            , c.none         , no)
-- the column separating vertically split windows
Group.new('VertSplit'        , c.vertsplit      , c.none         , no)
-- line used for closed folds
Group.new('Folded'           , c.comment_gray   , c.none         , no)
-- foldcolumn'
Group.new('FoldColumn'       , c.none           , c.none         , no)
-- column where signs are displayed
Group.new('SignColumn'       , c.none           , c.none         , no)
-- 'incsearch' highlighting; also used for the text replaced with ":s///c"
Group.new('IncSearch'        , c.yellow         , c.comment_gray , no)
-- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
Group.new('LineNr'           , c.gutter_fg_gray , c.none         , b)
-- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
Group.new('CursorLineNr'     , c.yellow         , c.cursor_gray  , b)
-- The character under the cursor or just before it, if it is a paired bracket, and its match.
Group.new('MatchParen'       , c.blue           , c.none         , ul + b)
-- 'showmode' message (e.g., "-- INSERT --")
Group.new('ModeMsg'          , c.none           , c.none         , no)
-- more-prompt
Group.new('MoreMsg'          , c.none           , c.none         , no)
-- '~' and '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line).
Group.new('NonText'          , c.special_gray   , c.none         , no)
Group.new('Whitespace'       , c.cyan           , c.none         , no)
-- normal text
Group.new('Normal'           , c.white          , c.black        , no)
-- Popup menu: normal item.
Group.new('Pmenu'            , c.none           , c.menu_gray    , no)
-- Popup menu: selected item.
Group.new('PmenuSel'         , c.black          , c.blue         , b + i)
-- Popup menu: scrollbar.
Group.new('PmenuSbar'        , c.none           , c.special_gray , no)
-- Popup menu: Thumb of the scrollbar.
Group.new('PmenuThumb'       , c.none           , c.white        , no)
-- hit-enter prompt and yes/no questions
Group.new('Question'         , c.purple         , c.none         , no)
-- Current quickfix item in the quickfix window.
Group.new('QuickFixLine'     , c.black          , c.yellow       , no)
-- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
Group.new('Search'           , c.black          , c.yellow       , no)
-- Meta and special keys listed with ":map", also for text used to show unprintable characters in the text, 'listchars'. Generally: text that is displayed differently from what it really is.
Group.new('SpecialKey'       , c.special_gray   , c.none         , no)
-- Word that is not recognized by the spellchecker. This will be combined with the highlighting used otherwise.
Group.new('SpellBad'         , c.red            , c.none         , ul)
-- Word that should start with a capital. This will be combined with the highlighting used otherwise.
Group.new('SpellCap'         , c.dark_yellow    , c.none         , no)
-- Word that is recognized by the spellchecker as one that is used in another region. This will be combined with the highlighting used otherwise.
Group.new('SpellLocal'       , c.dark_yellow    , c.none         , no)
-- Word that is recognized by the spellchecker as one that is hardly ever used. spell This will be combined with the highlighting used otherwise.
Group.new('SpellRare'        , c.dark_yellow    , c.none         , no)
-- status line of current window
Group.new('StatusLine'       , c.none           , c.statusline  , no)
-- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
Group.new('StatusLineNC'     , c.none           , c.statuslineNC, no)
-- status line of current :terminal window
Group.new('StatusLineTerm'   , c.none          , c.statusline   , no)
-- status line of non-current :terminal window
Group.new('StatusLineTermNC' , c.none         , c.statuslineNC  , no)
-- tab pages line, not active tab page label
Group.new('TabLine'          , c.white          , c.menu_gray    , no)
-- tab pages line, where there are no labels
Group.new('TabLineFill'      , c.none           , c.vertsplit    , no)
-- tab pages line, active tab page label
Group.new('TabLineSel'       , c.yellow         , c.special_gray , b)
-- terminal window (see terminal-size-color)
Group.new('Terminal'         , c.white          , c.black        , no)
-- titles for output from ":set all", ":autocmd" etc.
Group.new('Title'            , c.green          , c.none         , no)
-- Visual mode selection
Group.new('Visual'           , c.none           , c.visual_gray  , no)
-- Visual mode selection when vim is "Not Owning the Selection". Only X11 Gui's gui-x11 and xterm-clipboard supports this.
Group.new('VisualNOS'        , c.none           , c.visual_gray  , no)
-- warning messages
Group.new('WarningMsg'       , c.yellow         , c.none         , no)
-- current match in 'wildmenu' completion
Group.new('WildMenu'         , c.black          , c.blue         , no)
Group.new('NormalFloat'      , g.Normal         , g.Normal       , g.Normal)

---------------------------
-- Vim Help Highlighting --
---------------------------

Group.new('helpCommand'      , c.yellow       , c.none , no)
Group.new('helpExample'      , c.yellow       , c.none , no)
Group.new('helpHeader'       , c.white        , c.none , b)
Group.new('helpSectionDelim' , c.comment_gray , c.none , no)


-----------------------
-- Diff Highlighting --
-----------------------

if vim.g.diff then
  -- Don't change the background color in diff mode
  Group.new('CursorLine', c.none   , c.none      , ul)
end
-- diff mode: Added line
Group.new('DiffAdd'     , c.black  , c.green     , no)
-- diff mode: Changed line
Group.new('DiffChange'  , c.yellow , c.none      , ul)
-- diff mode: Deleted line
Group.new('DiffDelete'  , c.black  , c.red       , no)
-- diff mode: Changed text within a changed line
Group.new('DiffText'    , c.black  , c.yellow    , no)
Group.new('DiffAdded'   , c.green  , c.menu_gray , no)
Group.new('DiffFile'    , c.red    , c.menu_gray , no)
Group.new('DiffNewFile' , c.green  , c.menu_gray , no)
Group.new('DiffLine'    , c.blue   , c.menu_gray , no)
Group.new('DiffRemoved' , c.red    , c.menu_gray , no)

-------------------------
--  Vim Syntax Colors  --
-------------------------
-- any comment
Group.new('Comment'        , c.comment_gray , c.none , i)
-- any constant
Group.new('Constant'       , c.cyan         , c.none , no)
-- a string constant: "this is a string"
Group.new('String'         , c.green        , c.none , no)
-- a character constant: 'c', '\n'
Group.new('Character'      , c.green        , c.none , no)
-- a number constant: 234, 0xff
Group.new('Number'         , c.dark_yellow  , c.none , no)
-- a boolean constant: TRUE, false
Group.new('Boolean'        , c.dark_yellow  , c.none , no)
-- a floating point constant: 2.3e10
Group.new('Float'          , c.dark_yellow  , c.none , no)
-- any variable name
Group.new('Identifier'     , c.red          , c.none , no)
-- function name (also: methods for classes)
Group.new('Function'       , c.blue         , c.none , no)
-- any statement
Group.new('Statement'      , c.purple       , c.none , no)
-- if, then, else, endif, switch, etc.
Group.new('Conditional'    , c.purple       , c.none , no)
-- for, do, while, etc.
Group.new('Repeat'         , c.purple       , c.none , no)
-- case, default, etc.
Group.new('Label'          , c.purple       , c.none , no)
-- sizeof", "+", "*", etc.
Group.new('Operator'       , c.purple       , c.none , no)
-- any other keyword
Group.new('Keyword'        , c.red          , c.none , no)
-- try, catch, throw
Group.new('Exception'      , c.purple       , c.none , no)
-- generic Preprocessor
Group.new('PreProc'        , c.yellow       , c.none , no)
-- preprocessor #include
Group.new('Include'        , c.blue         , c.none , no)
-- preprocessor #define
Group.new('Define'         , c.purple       , c.none , no)
-- same as Define
Group.new('Macro'          , c.purple       , c.none , no)
-- preprocessor #if, #else, #endif, etc.
Group.new('PreCondit'      , c.yellow       , c.none , no)
-- int, long, char, etc.
Group.new('Type'           , c.yellow       , c.none , no)
-- static, register, volatile, etc.
Group.new('StorageClass'   , c.yellow       , c.none , no)
-- struct, union, enum, etc.
Group.new('Structure'      , c.yellow       , c.none , no)
-- A typedef
Group.new('Typedef'        , c.yellow       , c.none , no)
-- any special symbol
Group.new('Special'        , c.blue         , c.none , no)
-- special character in a constant
Group.new('SpecialChar'    , c.dark_yellow  , c.none , no)
-- you can use CTRL-] on this
Group.new('Tag'            , c.none         , c.none , no)
-- character that needs attention
Group.new('Delimiter'      , c.none         , c.none , no)
-- special things inside a comment
Group.new('SpecialComment' , c.comment_gray , c.none , no)
-- debugging statements
Group.new('Debug'          , c.yellow       , c.none , b + i)
-- text that stands out, HTML links
Group.new('Underline'      , c.none         , c.none , ul)
-- left blank, hidden
Group.new("Ignore"         , c.none         , c.none , no)
-- any erroneous construct
Group.new('Error'          , c.red          , c.none , no)
-- anything that needs extra attention; mostly the keywords TODO FIXME and XXX
Group.new('Todo'           , c.yellow       , c.dark_red, b + i)

----------------------------
--  Vim Termdebug Colors  --
----------------------------
-- the current position
Group.new('dubugPC'         , c.none  , c.special_gray , no)
-- a breakpoint
Group.new('debugBreakpoint' , c.black , c.red          , no)

---------------------------
-- Filetype Highlighting --
---------------------------

-- C/C++ highlighting
Group.new('cInclude'          , c.purple      , c.none , no)
Group.new('cPreCondit'        , c.purple      , c.none , no)
Group.new('cPreConditMatch'   , c.purple      , c.none , no)
Group.new('cType'             , c.purple      , c.none , no)
Group.new('cStorageClass'     , c.purple      , c.none , no)
Group.new('cStructure'        , c.purple      , c.none , no)
Group.new('cOperator'         , c.purple      , c.none , no)
Group.new('cStatement'        , c.purple      , c.none , no)
Group.new('cTODO'             , c.purple      , c.none , no)
Group.new('cConstant'         , c.dark_yellow , c.none , no)
Group.new('cSpecial'          , c.cyan        , c.none , no)
Group.new('cSpecialCharacter' , c.cyan        , c.none , no)
Group.new('cString'           , c.green       , c.none , no)
Group.new('cppType'           , c.purple      , c.none , no)
Group.new('cppStorageClass'   , c.purple      , c.none , no)
Group.new('cppStructure'      , c.purple      , c.none , no)
Group.new('cppModifier'       , c.purple      , c.none , no)
Group.new('cppOperator'       , c.purple      , c.none , no)
Group.new('cppAccess'         , c.purple      , c.none , no)
Group.new('cppStatement'      , c.purple      , c.none , no)
Group.new('cppConstant'       , c.red         , c.none , no)
Group.new('cCppString'        , c.green       , c.none , no)

-- CSS
Group.new('cssAttrComma'         , c.comment_gray , c.none , no)
Group.new('cssAttributeSelector' , c.green        , c.none , no)
Group.new('cssBraces'            , c.comment_gray , c.none , no)
Group.new('cssClassName'         , c.dark_yellow  , c.none , no)
Group.new('cssClassNameDot'      , c.dark_yellow  , c.none , no)
Group.new('cssDefinition'        , c.comment_gray , c.none , no)
Group.new('cssFontAttr'          , c.dark_yellow  , c.none , no)
Group.new('cssFontDescriptor'    , c.comment_gray , c.none , no)
Group.new('cssFunctionName'      , c.blue         , c.none , no)
Group.new('cssIdentifier'        , c.blue         , c.none , no)
Group.new('cssImportant'         , c.comment_gray , c.none , no)
Group.new('cssInclude'           , c.white        , c.none , no)
Group.new('cssIncludeKeyword'    , c.comment_gray , c.none , no)
Group.new('cssMediaType'         , c.dark_yellow  , c.none , no)
Group.new('cssProp'              , c.cyan         , c.none , no)
Group.new('cssPseudoClassId'     , c.dark_yellow  , c.none , no)
Group.new('cssSelectorOp'        , c.comment_gray , c.none , no)
Group.new('cssSelectorOp2'       , c.comment_gray , c.none , no)
Group.new('cssStringQ'           , c.green        , c.none , no)
Group.new('cssStringQQ'          , c.green        , c.none , no)
Group.new('cssTagName'           , c.red          , c.none , no)
Group.new('cssAttr'              , c.dark_yellow  , c.none , no)

-- Go
Group.new('goDeclaration'  , c.purple , c.none , no)
Group.new('goField'        , c.red    , c.none , no)
Group.new('goMethod'       , c.cyan   , c.none , no)
Group.new('goType'         , c.purple , c.none , no)
Group.new('goUnsignedInts' , c.cyan   , c.none , no)
Group.new("goBuiltins"     , c.cyan   , c.none , no)
Group.new("goFunctionCall" , c.blue   , c.none , no)
Group.new("goVarDefs"      , c.red    , c.none , no)
Group.new("goVarAssign"    , c.red    , c.none , no)
Group.new("goVar"          , c.purple , c.none , no)
Group.new("goConst"        , c.purple , c.none , no)
Group.new("goTypeName"     , c.yellow , c.none , no)
Group.new("goDeclType"     , c.cyan   , c.none , no)
Group.new("goTypeDecl"     , c.purple , c.none , no)

-- HTML
Group.new('htmlArg'            , c.dark_yellow  , c.none        , no)
Group.new('htmlTagName'        , c.red          , c.none        , no)
Group.new('htmlTagN'           , c.red          , c.none        , no)
Group.new('htmlSpecialTagName' , c.red          , c.none        , no)
Group.new('htmlTag'            , c.comment_gray , c.none        , no)
Group.new('htmlEndTag'         , c.comment_gray , c.none        , no)
Group.new('MatchTag'           , c.red          , c.cursor_gray , ul + b)
Group.new("htmlBold"           , c.dark_yellow  , c.none        , b)
Group.new("htmlH1"             , c.red          , c.none        , no)
Group.new("htmlH2"             , c.red          , c.none        , no)
Group.new("htmlH3"             , c.red          , c.none        , no)
Group.new("htmlH4"             , c.red          , c.none        , no)
Group.new("htmlH5"             , c.red          , c.none        , no)
Group.new("htmlH6"             , c.red          , c.none        , no)
Group.new("htmlItalic"         , c.purple       , c.none        , i)
Group.new("htmlLink"           , c.cyan         , c.none        , ul)
Group.new("htmlSpecialChar"    , c.dark_yellow  , c.none        , no)
Group.new("htmlTitle"          , c.white        , c.none        , no)

-- JavaScript
Group.new('coffeeString'         , c.green        , c.none , no)
Group.new('javaScriptBraces'     , c.comment_gray , c.none , no)
Group.new('javaScriptFunction'   , c.purple       , c.none , no)
Group.new('javaScriptIdentifier' , c.purple       , c.none , no)
Group.new('javaScriptNull'       , c.dark_yellow  , c.none , no)
Group.new('javaScriptNumber'     , c.dark_yellow  , c.none , no)
Group.new('javaScriptRequire'    , c.cyan         , c.none , no)
Group.new('javaScriptReserved'   , c.purple       , c.none , no)
-- TypeScript
Group.new("typescriptReserved"  , c.purple , c.none , no)
Group.new("typescriptEndColons" , c.white  , c.none , no)
Group.new("typescriptBraces"    , c.white  , c.none , no)
-- JSON
Group.new('jsonCommentError'       , c.white        , c.none , no)
Group.new('jsonKeyword'            , c.red          , c.none , no)
Group.new('jsonQuote'              , c.comment_gray , c.none , no)
Group.new('jsonTrailingCommaError' , c.red          , c.none , r)
Group.new('jsonMissingCommaError'  , c.red          , c.none , r)
Group.new('jsonNoQuotesError'      , c.red          , c.none , r)
Group.new('jsonNumError'           , c.red          , c.none , r)
Group.new('jsonString'             , c.green        , c.none , no)
Group.new('jsonBoolean'            , c.purple       , c.none , no)
Group.new('jsonNumber'             , c.dark_yellow  , c.none , no)
Group.new('jsonStringSQError'      , c.red          , c.none , r)
Group.new('jsonSemicolonError'     , c.red          , c.none , r)

-- Markdown
Group.new('markdownUrl'               , c.comment_gray , c.none , ul)
Group.new('markdownBold'              , c.dark_yellow  , c.none , b)
Group.new('markdownItalic'            , c.purple       , c.none , i)
Group.new('markdownCode'              , c.green        , c.none , no)
Group.new('markdownCodeBlock'         , c.green        , c.none , no)
Group.new('markdownCodeDelimiter'     , c.green        , c.none , no)
Group.new('markdownHeadingDelimiter'  , c.dark_red     , c.none , no)
Group.new('markdownH1'                , c.red          , c.none , no)
Group.new('markdownH2'                , c.red          , c.none , no)
Group.new('markdownH3'                , c.red          , c.none , no)
Group.new('markdownH3'                , c.red          , c.none , no)
Group.new('markdownH4'                , c.red          , c.none , no)
Group.new('markdownH5'                , c.red          , c.none , no)
Group.new('markdownH6'                , c.red          , c.none , no)
Group.new('markdownListMarker'        , c.red          , c.none , no)
Group.new("markdownBlockquote"        , c.comment_gray , c.none , no)
Group.new("markdownHeadingRule"       , c.comment_gray , c.none , no)
Group.new("markdownId"                , c.purple       , c.none , no)
Group.new("markdownIdDeclaration"     , c.blue         , c.none , no)
Group.new("markdownIdDelimiter"       , c.purple       , c.none , no)
Group.new("markdownLinkDelimiter"     , c.purple       , c.none , no)
Group.new("markdownLinkText"          , c.blue         , c.none , no)
Group.new("markdownOrderedListMarker" , c.red          , c.none , no)
Group.new("markdownRule"              , c.comment_gray , c.none , no)

-- Python
Group.new('pythonImport'          , c.purple       , c.none , no)
Group.new('pythonBuiltin'         , c.cyan         , c.none , no)
Group.new('pythonStatement'       , c.purple       , c.none , no)
Group.new('pythonParam'           , c.dark_yellow  , c.none , no)
Group.new('pythonEscape'          , c.red          , c.none , no)
Group.new('pythonSelf'            , c.comment_gray , c.none , i)
Group.new('pythonClass'           , c.blue         , c.none , no)
Group.new('pythonOperator'        , c.purple       , c.none , no)
Group.new('pythonEscape'          , c.red          , c.none , no)
Group.new('pythonFunction'        , c.blue         , c.none , no)
Group.new('pythonKeyword'         , c.blue         , c.none , no)
Group.new('pythonModule'          , c.purple       , c.none , no)
Group.new('pythonStringDelimiter' , c.green        , c.none , no)
Group.new('pythonSymbol'          , c.cyan         , c.none , no)

-- Ruby
Group.new('rubyBlock'                     , c.purple , c.none , no)
Group.new('rubyBlockParameter'            , c.red    , c.none , no)
Group.new('rubyBlockParameterList'        , c.red    , c.none , no)
Group.new('rubyCapitalizedMethod'         , c.purple , c.none , no)
Group.new('rubyClass'                     , c.purple , c.none , no)
Group.new('rubyConstant'                  , c.yellow , c.none , no)
Group.new('rubyControl'                   , c.purple , c.none , no)
Group.new('rubyDefine'                    , c.purple , c.none , no)
Group.new('rubyEscape'                    , c.red    , c.none , no)
Group.new('rubyFunction'                  , c.blue   , c.none , no)
Group.new('rubyGlobalVariable'            , c.red    , c.none , no)
Group.new('rubyInclude'                   , c.blue   , c.none , no)
Group.new('rubyIncluderubyGlobalVariable' , c.red    , c.none , no)
Group.new('rubyInstanceVariable'          , c.red    , c.none , no)
Group.new('rubyInterpolation'             , c.cyan   , c.none , no)
Group.new('rubyInterpolationDelimiter'    , c.red    , c.none , no)
Group.new('rubyKeyword'                   , c.blue   , c.none , no)
Group.new('rubyModule'                    , c.purple , c.none , no)
Group.new('rubyPseudoVariable'            , c.red    , c.none , no)
Group.new('rubyRegexp'                    , c.cyan   , c.none , no)
Group.new('rubyRegexpDelimiter'           , c.cyan   , c.none , no)
Group.new('rubyStringDelimiter'           , c.green  , c.none , no)
Group.new('rubySymbol'                    , c.cyan   , c.none , no)

-- Vim
Group.new('vimCommand'      , c.purple       , c.none , no)
Group.new('vimCommentTitle' , c.comment_gray , c.none , b)
Group.new('vimFunction'     , c.cyan         , c.none , no)
Group.new('vimFuncName'     , c.purple       , c.none , no)
Group.new('vimHighlight'    , c.blue         , c.none , no)
Group.new('vimLineComment'  , c.comment_gray , c.none , i)
Group.new('vimParenSep'     , c.comment_gray , c.none , no)
Group.new('vimSep'          , c.comment_gray , c.none , no)
Group.new('vimUserFunc'     , c.cyan         , c.none , no)
Group.new('vimVar'          , c.red          , c.none , no)

-- XML
Group.new('xmlAttrib'  , c.yellow , c.none , no)
Group.new('xmlEndTag'  , c.red    , c.none , no)
Group.new('xmlTag'     , c.red    , c.none , no)
Group.new('xmlTagName' , c.red    , c.none , no)

-- ZSH
Group.new('zshCommands'    , c.white        , c.none , no)
Group.new('zshDeref'       , c.red          , c.none , no)
Group.new('zshShortDeref'  , c.red          , c.none , no)
Group.new('zshFunction'    , c.cyan         , c.none , no)
Group.new('zshKeyword'     , c.purple       , c.none , no)
Group.new('zshSubst'       , c.red          , c.none , no)
Group.new('zshSubstDelim'  , c.comment_gray , c.none , no)
Group.new('zshTypes'       , c.purple       , c.none , no)
Group.new('zshVariableDef' , c.dark_yellow  , c.none , no)

-- Rust
Group.new('rustExternCrate'          , c.red          , c.none , b)
Group.new('rustIdentifier'           , c.blue         , c.none , no)
Group.new('rustDeriveTrait'          , c.green        , c.none , no)
Group.new('SpecialComment'           , c.comment_gray , c.none , no)
Group.new('rustCommentLine'          , c.comment_gray , c.none , no)
Group.new('rustCommentLineDoc'       , c.comment_gray , c.none , no)
Group.new('rustCommentLineDocError'  , c.comment_gray , c.none , no)
Group.new('rustCommentBlock'         , c.comment_gray , c.none , no)
Group.new('rustCommentBlockDoc'      , c.comment_gray , c.none , no)
Group.new('rustCommentBlockDocError' , c.comment_gray , c.none , no)

-- Tex

Group.new("texStatement"    , c.purple      , c.none , no)
Group.new("texSubscripts"   , c.dark_yellow , c.none , no)
Group.new("texSuperscripts" , c.dark_yellow , c.none , no)
Group.new("texTodo"         , c.dark_red    , c.none , no)
Group.new("texBeginEnd"     , c.purple      , c.none , no)
Group.new("texBeginEndName" , c.blue        , c.none , no)
Group.new("texMathMatcher"  , c.blue        , c.none , no)
Group.new("texMathDelim"    , c.blue        , c.none , no)
Group.new("texDelimiter"    , c.dark_yellow , c.none , no)
Group.new("texSpecialChar"  , c.dark_yellow , c.none , no)
Group.new("texCite"         , c.blue        , c.none , no)
Group.new("texRefZone"      , c.blue        , c.none , no)

-- Man
Group.new('manTitle'  , g.String       , g.String , g.String)
Group.new('manFooter' , c.comment_gray , c.none   , no)

-----------------------------
--     LSP Highlighting    --
-----------------------------
Group.new('DiagnosticError'            , c.red    , c.none          , no)
Group.new('DiagnosticWarn'             , c.yellow , c.none          , no)
Group.new('DiagnosticInfo'             , c.cyan   , c.none          , no)
Group.new('DiagnosticHint'             , c.green  , c.none          , no)
Group.new('DiagnosticVirtualTextError' , c.red    , c.visual_red    , i)
Group.new('DiagnosticVirtualTextWarn'  , c.yellow , c.visual_yellow , i)
Group.new('DiagnosticVirtualTextInfo'  , c.cyan   , c.visual_gray   , i)
Group.new('DiagnosticVirtualTextHint'  , c.green  , c.visual_gray   , i)
Group.new('DiagnosticUnderlineError'   , c.none   , c.none          , uc  , c.red)
Group.new('DiagnosticUnderlineWarn'    , c.none   , c.none          , uc  , c.yellow)
Group.new('DiagnosticUnderlineInfo'    , c.none   , c.none          , uc  , c.cyan)
Group.new('DiagnosticUnderlineHint'    , c.none   , c.none          , uc  , c.green)
Group.new('DiagnosticFloatingError'    , c.red    , c.none          , ul)
Group.new('DiagnosticFloatingWarn'     , c.yellow , c.none          , ul)
Group.new('DiagnosticFloatingInfo'     , c.cyan   , c.none          , ul)
Group.new('DiagnosticFloatingHint'     , c.green  , c.none          , ul)
Group.new('DiagnosticSignError'        , c.red    , c.none          , no)
Group.new('DiagnosticSignWarn'         , c.yellow , c.none          , no)
Group.new('DiagnosticSignInfo'         , c.cyan   , c.none          , no)
Group.new('DiagnosticSignHint'         , c.green  , c.none          , no)
Group.new('Jsj_LspDochighlight'        , c.none   , c.comment_gray  , no)

-----------------------------
-- TreeSitter Highlighting --
-----------------------------
Group.new('TSAnnotation'         , c.yellow       , c.none , no)
Group.new('TSAttribute'          , c.cyan         , c.none , no)
Group.new('TSBoolean'            , c.dark_yellow  , c.none , no)
Group.new('TSCharacter'          , c.green        , c.none , no)
Group.new('TSConditional'        , c.purple       , c.none , no)
Group.new('TSConstant'           , c.blue         , c.none , no)
Group.new('TSConstBuiltin'       , c.dark_yellow  , c.none , no)
Group.new('TSConstMacro'         , c.cyan         , c.none , no)
Group.new('TSConstructor'        , c.cyan         , c.none , no)
Group.new('TSEmphasis'           , c.yellow       , c.none , no)
Group.new('TSError'              , c.red          , c.none , no)
Group.new('TSException'          , c.purple       , c.none , no)
Group.new('TSField'              , c.red          , c.none , no)
Group.new('TSFloat'              , c.green        , c.none , no)
Group.new('TSFunction'           , c.blue         , c.none , no)
Group.new('TSFuncBuiltin'        , c.blue         , c.none , no)
Group.new('TSFuncMacro'          , c.yellow       , c.none , no)
Group.new('TSInclude'            , c.purple       , c.none , no)
Group.new('TSKeyword'            , c.purple       , c.none , no)
Group.new('TSKeywordFunction'    , c.purple       , c.none , no)
Group.new('TSKeywordOperator'    , c.purple       , c.none , no)
Group.new('TSLabel'              , c.blue         , c.none , no)
Group.new('TSLiteral'            , c.yellow       , c.none , no)
Group.new('TSMethod'             , c.blue         , c.none , no)
Group.new('TSNamespace'          , c.purple       , c.none , no)
Group.new('TSNumber'             , c.dark_yellow  , c.none , no)
Group.new('TSOperator'           , c.white        , c.none , no)
Group.new('TSParameter'          , c.cyan         , c.none , no)
Group.new('TSParameterReference' , c.cyan         , c.none , no)
Group.new('TSProperty'           , c.yellow       , c.none , no)
Group.new('TSPunctBracket'       , c.white        , c.none , no)
Group.new('TSPunctDelimiter'     , c.white        , c.none , no)
Group.new('TSPunctSpecial'       , c.white        , c.none , no)
Group.new('TSRepeat'             , c.purple       , c.none , no)
Group.new('TSString'             , c.green        , c.none , no)
Group.new('TSStringEscape'       , c.cyan         , c.none , no)
Group.new('TSStringRegex'        , c.green        , c.none , no)
Group.new('TSStrong'             , c.yellow       , c.none , no)
Group.new('TSStructure'          , c.yellow       , c.none , no)
Group.new('TSTag'                , c.red          , c.none , no)
Group.new('TSTagDelimiter'       , c.comment_gray , c.none , no)
Group.new('TSText'               , c.yellow       , c.none , no)
Group.new('TSTitle'              , c.yellow       , c.none , no)
Group.new('TSType'               , c.purple       , c.none , b)
Group.new('TSTypeBuiltin'        , c.purple       , c.none , no)
Group.new('TSUnderline'          , c.yellow       , c.none , no)
Group.new('TSURI'                , c.yellow       , c.none , no)
Group.new('TSVariable'           , c.cyan         , c.none , no)
Group.new('TSVariableBuiltin'    , c.yellow       , c.none , no)

---------------
-- telescope --
---------------
Group.new('TelescopeNormal'         , c.white       , c.none        , no)
Group.new('TelescopeSelection'      , c.none        , c.cursor_gray , b)
Group.new('TelescopeSlectionCaret'  , c.red         , c.none        , no)
Group.new('TelescopeMultiSelection' , c.visual_gray , c.none        , no)
Group.new('TelescopeBorder'         , c.dark_yellow , c.none        , no)
Group.new('TelescopePromptBorder'   , c.blue        , c.none        , no)
Group.new('TelescopeResultsBorder'  , c.yellow      , c.none        , no)
Group.new('TelescopePreviewBorder'  , c.purple      , c.none        , no)
Group.new('TelescopeMatching '      , c.yellow      , c.none        , b)
Group.new('TelescopePromptPrefix'   , c.red         , c.none        , no)

---------------
-- which-key --
---------------
-- https://github.com/folke/which-key.nvim
Group.new('WhichKey'          , g.Function   , g.Function    , g.Function)
Group.new('WhichKeyGroup'     , g.Keyword    , g.Keyword     , g.Keyword)
Group.new('WhichKeySeparator' , g.DiffAdded  , c.cursor_gray , g.DiffAdded)
Group.new('WhichKeyDesc'      , g.Identifier , g.Identifier  , g.Identifier)
Group.new('WhichKeyFloat'     , c.none       , c.cursor_gray , no)
Group.new('WhichKeyValue'     , g.Comment    , g.Comment     , g.Comment)

--------------
-- nvim-cmp --
--------------
Group.new('CmpItemAbbr', c.white, c.none, no)
Group.new('CmpItemAbbrDeprecated', g.CmpItemAbbr, c.none, i)
Group.new('CmpItemAbbrMatch', c.yellow, c.none, b)
Group.new('CmpItemAbbrMatchFuzzy', c.yellow, c.none, b)
Group.new('CmpItemMenu', c.cyan, c.none, no)
Group.new('CmpItemKind', c.dark_yellow, c.none, no)

-- lukas-reineke/indent-blankline.nvim
Group.new('IndentBlanklineChar', g.NonText, g.NonText, g.NonText)

-- github/Copilot
Group.new('CopilotSuggestion', c.white, c.none, no)
