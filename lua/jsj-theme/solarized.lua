local Color, c, Group, g, s = require("colorbuddy").setup()

local b = s.bold
local i = s.italic
local uc = s.undercurl
local ul = s.underline
local r = s.reverse
local no = s.NONE

vim.g.colors_name = 'solarized'

if vim.o.background == 'dark' then
  Color.new('base03', '#002b36')
  Color.new('base02', '#073642')
  Color.new('base01', '#586e75')
  Color.new('base00', '#657b83')
  Color.new('base0', '#839496')
  Color.new('base1', '#93a1a1')
  Color.new('base2', '#eee8d5')
  Color.new('base3', '#fdf6e3')
else
  Color.new('base3', '#002b36')
  Color.new('base2', '#073642')
  Color.new('base1', '#586e75')
  Color.new('base0', '#657b83')
  Color.new('base00', '#839496')
  Color.new('base01', '#93a1a1')
  Color.new('base02', '#eee8d5')
  Color.new('base03', '#fdf6e3')
end

Color.new('yellow', '#b58900')
Color.new('orange', '#cb4b16')
Color.new('red', '#dc322f')
Color.new('magenta', '#d33682')
Color.new('violet', '#6c71c4')
Color.new('blue', '#268bd2')
Color.new('cyan', '#2aa198')
Color.new('green', '#859900')  -- #859900 #719e07
Color.new('gray', '#3B4048')

Color.new('statusline', '#2c323c')
Color.new('statuslineNC', '#5c6370')
Color.new('visual_red', '#382B3E')  -- lsp virual text
Color.new('visual_yellow', '#373641')  -- lsp virual text

Group.new('Normal', c.base0, c.base03, no)
Group.new('Comment', c.base01, c.none, i)
Group.new('Constant', c.cyan, c.none, no)
Group.new('Identifier', c.blue, c.none, no)
Group.new('Statement', c.green, c.none, no)
Group.new('PreProc', c.orange, c.none, no)
Group.new('Type', c.yellow, c.none, no)
Group.new('Special', c.base0, c.none, no)
Group.new('Underlined', c.violet, c.none, ul)
Group.new('Ignore', c.none, c.none, ul)
Group.new('Error', c.red, c.none, b)
Group.new('Todo', c.magenta, c.none, b)
Group.new('Debug', c.green, c.none, b)
Group.new('SpecialKey', c.base00, c.none, no)
Group.new('NonText', c.base01, c.none, no)
Group.new('StatusLine', c.none, c.statusline, no)
Group.new('StatusLineNC', c.none, c.statuslineNC, no)
Group.new('Visual', c.none, c.base02, no)
Group.new('Directory', c.blue, c.none, no)
Group.new('ErrorMsg', c.red, c.none, r)
Group.new('IncSearch', c.orange, c.base01, no)
Group.new('Search', c.yellow, c.gray, no)
Group.new('MoreMsg', c.blue, c.none, no)
Group.new('ModeMsg', c.blue, c.none, no)
Group.new('LineNr', c.base01, c.none, b)
Group.new('CursorLineNr', c.yellow, c.base02, b)
Group.new('Question', c.cyan, c.none, b)
Group.new('VertSplit', c.base01, c.base02, no)
Group.new('Title', c.orange, c.none, b)
Group.new('VisualNOS', c.none, c.base02, r)
Group.new('WarningMsg', c.red, c.none, b)
Group.new('WildMenu', c.base2, c.base02, b + r)
Group.new('Folded', c.base0, c.base02, ul, c.base03)
Group.new('FoldColumn', c.base0, c.base02, no)
Group.new('DiffAdd', c.green, c.none, r)
Group.new('DiffChange', c.yellow, c.none, r)
Group.new('DiffDelete', c.red, c.none, r)
Group.new('DiffText', c.blue, c.none, r)
Group.new('SignColumn', g.Normal, g.Normal, g.Normal)
Group.new('Conceal', c.blue, c.none, no)
Group.new('SpellBad', c.none, c.none, uc, c.red)
Group.new('SpellCap', c.none, c.none, uc, c.violet)
Group.new('SpellRare', c.none, c.none, uc, c.cyan)
Group.new('SpellLocal', c.none, c.none, uc, c.yellow)
Group.new('Pmenu', c.base00, c.base02, no)
Group.new('PmenuSel', c.base2, c.base01, no)
Group.new('PmenuSbar', c.base0, c.base2, no)
Group.new('PmenuThumb', c.base03, c.base0, no)
Group.new('TabLine', c.base0, c.base02, ul, c.base0)
Group.new('TabLineFill', c.base0, c.base02, ul, c.base0)
Group.new('TabLineSel', c.base01, c.base2, ul, c.base0)
Group.new('CursorColumn', c.none, c.base02, no)
Group.new('CursorLine', c.none, c.base02, no)
Group.new('ColorColumn', c.none, c.base02, no)
Group.new('Cursor', c.base03, c.base0, no)
Group.new('lCursor', g.Cursor, g.Cursor, g.Cursor)
Group.new('iCursor', g.Cursor, g.Cursor, g.Cursor)
Group.new('vCursor', g.Cursor, g.Cursor, g.Cursor)
Group.new('MatchParen', c.red, c.base01, b)
Group.new('Keyword', c.red, c.none, no)
Group.new('NormalFloat', g.Normal, g.Normal, g.Normal)
Group.new('Whitespace', c.cyan, c.none, no)


-- Vim syntax highlight
Group.new('vimVar', g.Identifier, g.Identifier, g.Identifier)
Group.new('Function', c.blue, c.none, no)
Group.new('vimFunc', g.Function, g.Function, g.Function)
Group.new('vimUserFunc', g.Function, g.Function, g.Function)
Group.new('vimNotFunc', c.yellow, c.none, no)
Group.new('helpSpecial', g.Special, g.Special, g.Special)
Group.new('vimSet', g.Normal, g.Normal, g.Normal)
Group.new('vimSetEqual', g.Normal, g.Normal, g.Normal)
Group.new('vimCommentString', c.violet, c.none, no)
Group.new('vimCommand', c.yellow, c.none, no)
Group.new('vimCmdSep', c.blue, c.none, b)
Group.new('helpExample', c.base1, c.none, no)
Group.new('helpOption', c.cyan, c.none, no)
Group.new('helpNote', c.magenta, c.none, no)
Group.new('helpVim', c.magenta, c.none, no)
Group.new('helpHyperTextJump', c.blue, c.none, ul)
Group.new('helpHyperTextEntry', c.green, c.none, no)
Group.new('vimIsCommand', c.base00, c.none, no)
Group.new('vimSynMtchOpt', c.yellow, c.none, no)
Group.new('vimSynType', c.cyan, c.none, no)
Group.new('vimHiLink', c.blue, c.none, no)
Group.new('vimHiGroup', c.blue, c.none, no)
Group.new('vimGroup', c.blue, c.none, no)


-- diff highlight

Group.new('diffAdded', g.Statement, g.Statement, g.Statement)
Group.new('diffLine', g.Identifier, g.Identifier, g.Identifier)


-- html highlight
Group.new('htmlTag', c.base01, c.none, no)
Group.new('htmlEndTag', c.base01, c.none, no)
Group.new('htmlTagN', c.base1, c.none, b)
Group.new('htmlTagName', c.blue, c.none, b)
Group.new('htmlSpecialTagName', c.blue, c.none, i)
Group.new('htmlArg', c.base00, c.none, no)
Group.new('javaScript', c.yellow, c.none, no)

-----------------------------
--     LSP Highlighting    --
-----------------------------
Group.new('LspDiagnosticsDefaultError'           , c.red    , c.none          , no)
Group.new('LspDiagnosticsDefaultWarning'         , c.yellow , c.none          , no)
Group.new('LspDiagnosticsDefaultInformation'     , c.cyan   , c.none          , no)
Group.new('LspDiagnosticsDefaultHint'            , c.green  , c.none          , no)
Group.new('LspDiagnosticsVirtualTextError'       , c.red    , c.visual_red    , i)
Group.new('LspDiagnosticsVirtualTextWarning'     , c.yellow , c.visual_yellow , i)
Group.new('LspDiagnosticsVirtualTextInformation' , c.cyan   , c.base02        , i)
Group.new('LspDiagnosticsVirtualTextHint'        , c.green  , c.base02        , i)
Group.new('LspDiagnosticsUnderlineError'         , c.none   , c.none          , uc  , c.red)
Group.new('LspDiagnosticsUnderlineWarning'       , c.none   , c.none          , uc  , c.yellow)
Group.new('LspDiagnosticsUnderlineInformation'   , c.none   , c.none          , uc  , c.cyan)
Group.new('LspDiagnosticsUnderlineHint'          , c.none   , c.none          , uc  , c.green)
Group.new('LspDiagnosticsFloatingError'          , c.red    , c.none          , ul)
Group.new('LspDiagnosticsFloatingWarning'        , c.yellow , c.none          , ul)
Group.new('LspDiagnosticsFloatingInformation'    , c.cyan   , c.none          , ul)
Group.new('LspDiagnosticsFloatingHint'           , c.green  , c.none          , ul)
Group.new('LspDiagnosticsSignError'              , c.red    , c.none          , no)
Group.new('LspDiagnosticsSignWarning'            , c.yellow , c.none          , no)
Group.new('LspDiagnosticsSignInformation'        , c.cyan   , c.none          , no)
Group.new('LspDiagnosticsSignHint'               , c.green  , c.none          , no)
Group.new('Jsj_LspDochighlight'                  , c.none   , c.base02        , no)

-----------------------------
-- TreeSitter Highlighting --
-----------------------------
Group.new('TSAnnotation'         , c.yellow       , c.none , no)
Group.new('TSAttribute'          , c.cyan         , c.none , no)
Group.new('TSBoolean'            , c.yellow       , c.none , no)
Group.new('TSCharacter'          , c.green        , c.none , no)
Group.new('TSConditional'        , c.purple       , c.none , b)
Group.new('TSConstant'           , c.blue         , c.none , no)
Group.new('TSConstBuiltin'       , c.yellow       , c.none , no)
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
Group.new('TSInclude'            , c.purple       , c.none , b)
Group.new('TSKeyword'            , c.purple       , c.none , b)
Group.new('TSKeywordFunction'    , c.purple       , c.none , b)
Group.new('TSKeywordOperator'    , c.purple       , c.none , b)
Group.new('TSLabel'              , c.blue         , c.none , no)
Group.new('TSLiteral'            , c.yellow       , c.none , no)
Group.new('TSMethod'             , c.blue         , c.none , no)
Group.new('TSNamespace'          , c.purple       , c.none , no)
Group.new('TSNumber'             , c.yellow       , c.none , no)
Group.new('TSOperator'           , c.base0        , c.none , no)
Group.new('TSParameter'          , c.cyan         , c.none , no)
Group.new('TSParameterReference' , c.cyan         , c.none , no)
Group.new('TSProperty'           , c.yellow       , c.none , no)
Group.new('TSPunctBracket'       , c.base0        , c.none , no)
Group.new('TSPunctDelimiter'     , c.base0        , c.none , no)
Group.new('TSPunctSpecial'       , c.base0        , c.none , no)
Group.new('TSRepeat'             , c.purple       , c.none , b)
Group.new('TSString'             , c.green        , c.none , no)
Group.new('TSStringEscape'       , c.cyan         , c.none , no)
Group.new('TSStringRegex'        , c.green        , c.none , no)
Group.new('TSStrong'             , c.yellow       , c.none , no)
Group.new('TSStructure'          , c.yellow       , c.none , no)
Group.new('TSTag'                , c.red          , c.none , no)
Group.new('TSTagDelimiter'       , c.base02       , c.none , no)
Group.new('TSText'               , c.yellow       , c.none , no)
Group.new('TSTitle'              , c.yellow       , c.none , no)
Group.new('TSType'               , c.purple       , c.none ,  b)
Group.new('TSTypeBuiltin'        , c.purple       , c.none ,  b)
Group.new('TSUnderline'          , c.yellow       , c.none , no)
Group.new('TSURI'                , c.yellow       , c.none , no)
Group.new('TSVariable'           , c.cyan         , c.none , no)
Group.new('TSVariableBuiltin'    , c.yellow       , c.none , no)

---------------
-- telescope --
---------------
Group.new('TelescopeNormal'         , c.base0       , c.none        , no)
Group.new('TelescopeSelection'      , c.none        , c.base02      , b)
Group.new('TelescopeSlectionCaret'  , c.red         , c.none        , no)
Group.new('TelescopeMultiSelection' , c.base03      , c.none        , no)
Group.new('TelescopeBorder'         , c.yellow      , c.none        , no)
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
Group.new('WhichKeySeparator' , g.DiffAdded  , c.base02     , g.DiffAdded)
Group.new('WhichKeyDesc'      , g.Identifier , g.Identifier  , g.Identifier)
Group.new('WhichKeyFloat'     , c.none       , c.base02       , no)
Group.new('WhichKeyValue'     , g.Comment    , g.Comment     , g.Comment)


--------------
-- nvim-cmp --
--------------
Group.new('CmpItemAbbr', c.base0, c.none, no)
Group.new('CmpItemAbbrDeprecated', g.CmpItemAbbr, c.none, i)
Group.new('CmpItemAbbrMatch', c.yellow, c.none, b)
Group.new('CmpItemAbbrMatchFuzzy', c.yellow, c.none, b)
Group.new('CmpItemMenu', c.cyan, c.none, no)
Group.new('CmpItemKind', c.orange, c.none, no)

-- lukas-reineke/indent-blankline.nvim
Group.new('IndentBlanklineChar', g.NonText, g.NonText, g.NonText)
