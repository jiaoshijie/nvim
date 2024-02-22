local h = require("init-utils").global_hl

vim.g.colors_name = "gruvbox"
local c = {}

if vim.o.background == "dark" then
  c.bg0 = "#1d2021" -- hard: #1d2021, normal: #282828, soft: #32302f
  c.bg1 = "#3c3836"
  c.bg2 = "#504945"
  c.bg3 = "#665c54"
  c.bg4 = "#7c6f64"
  c.gray = "#928374"
  c.fg0 = "#fbf1c7" -- hard: #f9f5d7, normal: #fbf1c7, soft: #f2e5bc
  c.fg1 = "#ebdbb2"
  c.fg2 = "#d5c4a1"
  c.fg3 = "#bdae93"
  c.fg4 = "#a89984"
  c.red = "#fb4934"
  c.green = "#b8bb26"
  c.yellow = "#fabd2f"
  c.blue = "#83a598"
  c.purple = "#d3869b"
  c.aqua = "#8ec07c"
  c.orange = "#f38019"
  c.visual_red = "#5D120A"    -- lsp virual text
  c.visual_yellow = "#565303" -- lsp virual text
  c.visual_green = "#165603"  -- lsp virual text
  c.visual_aqua = "#032C56"   -- lsp virual text
else
  c.bg0 = "#ffffff"           -- hard: #f9f5d7, normal: #fbf1c7, soft: #f2e5bc
  c.bg1 = "#ebdbb2"
  c.bg2 = "#d5c4a1"
  c.bg3 = "#bdae93"
  c.bg4 = "#a89984"
  c.gray = "#928374"
  c.fg0 = "#282828" -- hard: #1d2021, normal: #282828, soft: #32302f
  c.fg1 = "#3c3836"
  c.fg2 = "#504945"
  c.fg3 = "#665c54"
  c.fg4 = "#7c6f64"
  c.red = "#9d0006"
  c.green = "#79740e"
  c.yellow = "#b57614"
  c.blue = "#076678"
  c.purple = "#8f3f71"
  c.aqua = "#427b58"
  c.orange = "#af3a03"
  c.visual_red = "#FBD1C7"    -- lsp virual text
  c.visual_yellow = "#FBFBC7" -- lsp virual text
  c.visual_green = "#C7FBD9"  -- lsp virual text
  c.visual_aqua = "#C7E9FB"   -- lsp virual text
end

c.statusline = "#2c323c"
c.statuslineNC = "#5c6370"

-- {{{ `h syntax.txt:5115`
h("ColorColumn", { bg = c.bg1 })
h("Conceal", { fg = c.blue })

-- [[ cursor ]]
h("CurSearch", { link = "IncSearch" })
h("Cursor", { fg = "#000000", bg = "#5588FF" })
h("lCursor", { link = "Cursor" })
h("CursorIM", { link = "Cursor" })
h("CursorColumn", { bg = c.bg1 })
h("CursorLine", { bg = c.bg1 })
h("Directory", { fg = c.green, bold = true })

-- [[ Diff mode 'nvim -d']]
h("DiffAdd", { fg = c.green, bg = c.bg0, reverse = true })
h("DiffChange", { fg = c.aqua, bg = c.bg0, reverse = true })
h("DiffDelete", { fg = c.red, bg = c.bg0, reverse = true })
h("DiffText", { fg = c.yellow, bg = c.bg0, reverse = true })

h("EndOfBuffer", { link = "NonText" })

-- [[ terminal Cursor ]]
h("TermCursor", { link = "Cursor" })
h("TermCursorNC", {})

h("ErrorMsg", { fg = c.bg0, bg = c.red, bold = true })
h("WinSeparator", { fg = c.bg3, bg = c.bg0 })
h("Folded", { fg = c.gray, bg = c.bg1, italic = true })
h("FoldColumn", { fg = c.gray, bg = c.bg1 })
h("SignColumn", { link = "LineNr" })
h("IncSearch", { fg = c.orange, bg = c.bg0, reverse = true })
h("Substitute", { link = "Search" })

h("LineNr", { fg = c.bg4 })
h("LineNrAbove", { link = "LineNr" })
h("LineNrBelow", { link = "LineNr" })
h("CursorLineNr", { fg = c.yellow, bg = c.bg1, bold = true })
h("CursorLineSign", { link = "SignColumn" })
h("CursorLineFold", { link = "FoldColumn" })

h("MatchParen", { bg = c.bg3, bold = true })
h("ModeMsg", { fg = c.yellow, bold = true })
h("MsgArea", { fg = c.fg1 })
h("MsgSeparator", { link = "StatusLine" })
h("MoreMsg", { fg = c.yellow, bold = true })
h("NonText", { fg = c.bg2 })
h("Normal", { fg = c.fg1, bg = c.bg0 })
h("NormalFloat", { link = "Normal" })
h("NormalNC", { link = "Normal" })

--[[ Pmenu ]]
h("Pmenu", { fg = c.fg1, bg = c.bg2 })
h("PmenuSel", { fg = c.bg2, bg = c.blue, bold = true, italic = true })
h("PmenuSbar", { bg = c.bg2 })
h("PmenuThumb", { bg = c.bg4 })

h("Question", { fg = c.orange, bold = true })
h("QuickFixLine", { link = "Search" })
h("Search", { fg = c.yellow, bg = c.bg0, reverse = true })
h("SpecialKey", { fg = c.bg2 })

-- [[ Spelling ]]
h("SpellBad", { fg = c.bg0, bg = c.red })
h("SpellCap", { fg = c.bg0, bg = c.blue })
h("SpellLocal", { fg = c.bg0, bg = c.aqua })
h("SpellRare", { fg = c.bg0, bg = c.purple })

h("StatusLine", { bg = c.statusline })
h("StatusLineNC", { bg = c.statuslineNC })
h("TabLine", { link = "TabLineFill" })
h("TabLineFill", { fg = c.gray, bg = c.fg0 })
h("TabLineSel", { fg = c.green, bg = c.bg2 })

h("Title", { fg = c.green, bold = true })
h("Visual", { bg = c.bg3, reverse = true })
h("VisualNOS", { link = "Visual" })
h("WarningMsg", { fg = c.red, bold = true })
h("Whitespace", { fg = c.bg3 })
h("WildMenu", { fg = c.blue, bg = c.bg2, bold = true })

h("WinBar", { link = "StatusLine" })
h("WinBarNC", { link = "StatusLineNC" })

-- NOTE: deprecated `h deprecated.txt`
-- h("VertSplit", { fg = c.bg3, bg = c.bg0 })  -- use hl-WinSeparator instead

-- NOTE: for GUI
-- h("Menu", {})
-- h("Scrollbar", {})
-- h("Tooltip", {})

-- }}}

-- {{{ `h syntax.txt:200`
h("Comment", { fg = c.gray, italic = true })

h("Constant", { fg = c.purple })
h("String", { fg = c.green, italic = true })
h("Character", { fg = c.purple })
h("Number", { fg = c.purple })
h("Boolean", { fg = c.purple })
h("Float", { fg = c.purple })

h("Identifier", { fg = c.blue })
h("Function", { fg = c.green, bold = true })

h("Statement", { fg = c.red })
h("Conditional", { fg = c.red })
h("Repeat", { fg = c.red })
h("Label", { fg = c.red })
h("Operator", { fg = c.fg1 })
h("Keyword", { fg = c.red })
h("Exception", { fg = c.red })

h("PreProc", { fg = c.aqua })
h("Include", { fg = c.aqua })
h("Define", { fg = c.aqua })
h("Macro", { fg = c.aqua })
h("PreCondit", { fg = c.aqua })

h("Type", { fg = c.yellow })
h("StorageClass", { fg = c.orange })
h("Structure", { fg = c.aqua })
h("Typedef", { fg = c.yellow })

h("Special", { fg = c.orange })
h("SpecialChar", { link = "Special" })
h("Tag", { link = "Special" })
h("Delimiter", { link = "Special" })
h("SpecialComment", { link = "Special" })
h("Debug", { link = "Special" })

h("Underlined", { fg = c.blue, underline = true })
h("Ignore", { link = "Conceal" })
h("Error", { fg = c.red, bg = c.bg0, reverse = true, bold = true })
h("Todo", { fg = c.yellow, bg = c.bg0, reverse = true, bold = true })
-- }}}

-- {{{ FileType specific

-- [[ Netrw ]]
h("netrwDir", { fg = c.aqua })
h("netrwClassify", { fg = c.aqua })
h("netrwLink", { fg = c.gray })
h("netrwSymLink", { fg = c.fg1 })
h("netrwExe", { fg = c.yellow })
h("netrwComment", { fg = c.gray })
h("netrwList", { fg = c.blue })
h("netrwHelpCmd", { fg = c.aqua })
h("netrwCmdSep", { fg = c.fg3 })
h("netrwVersion", { fg = c.green })

-- [[ diff file *.diff ]]
h("diffAdded", { fg = c.green })
h("diffRemoved", { fg = c.red })
h("diffChanged", { fg = c.aqua })
h("diffFile", { fg = c.orange })
h("diffNewFile", { fg = c.yellow })
h("diffLine", { fg = c.blue })

-- [[ vim ]]
h("vimCommentTitle", { fg = c.fg4, bold = true, italic = true })
h("vimNotation", { fg = c.orange })
h("vimBracket", { fg = c.orange })
h("vimMapModKey", { fg = c.orange })
h("vimFuncSID", { fg = c.fg3 })
h("vimSetSep", { fg = c.fg3 })
h("vimSep", { fg = c.fg3 })
h("vimContinue", { fg = c.fg3 })

-- [[ Markdown ]]
h("markdownItalic", { fg = c.fg3, italic = true })
h("markdownH1", { fg = c.green, bold = true })
h("markdownH2", { fg = c.green, bold = true })
h("markdownH3", { fg = c.yellow, bold = true })
h("markdownH4", { fg = c.yellow, bold = true })
h("markdownH5", { fg = c.yellow })
h("markdownH6", { fg = c.yellow })
h("markdownCode", { fg = c.aqua })
h("markdownCodeBlock", { fg = c.aqua })
h("markdownCodeDelimiter", { fg = c.aqua })
h("markdownBlockquote", { fg = c.gray })
h("markdownListMarker", { fg = c.gray })
h("markdownOrderedListMarker", { fg = c.gray })
h("markdownRule", { fg = c.gray })
h("markdownHeadingRule", { fg = c.gray })
h("markdownUrlDelimiter", { fg = c.fg3 })
h("markdownLinkDelimiter", { fg = c.fg3 })
h("markdownLinkTextDelimiter", { fg = c.fg3 })
h("markdownHeadingDelimiter", { fg = c.orange })
h("markdownUrl", { fg = c.purple })
h("markdownUrlTitleDelimiter", { fg = c.green })
h("markdownLinkText", { fg = c.gray, underline = true })
h("markdownIdDeclaration", { link = "markdownLinkText" })
h("markdownError", { fg = c.red })
h("markdownBold", { fg = c.orange, bold = true })

-- [[ neovim health ]]
h("healthError", { fg = c.red })
h("healthSuccess", { fg = c.aqua })
h("healthWarning", { fg = c.yellow })
-- }}}

-- {{{ plugins

-- [[ diagnostic highlights ]]  `h diagnostic.txt:192`
h("DiagnosticError", { fg = c.red })
h("DiagnosticWarn", { fg = c.yellow })
h("DiagnosticInfo", { fg = c.aqua })
h("DiagnosticHint", { fg = c.green })
h("DiagnosticVirtualTextError", { fg = c.red, bg = c.visual_red, italic = true })
h("DiagnosticVirtualTextWarn", { fg = c.yellow, bg = c.visual_yellow, italic = true })
h("DiagnosticVirtualTextInfo", { fg = c.aqua, bg = c.visual_aqua, italic = true })
h("DiagnosticVirtualTextHint", { fg = c.green, bg = c.visual_green, italic = true })
h("DiagnosticUnderlineError", { undercurl = true, sp = c.red })
h("DiagnosticUnderlineWarn", { undercurl = true, sp = c.yellow })
h("DiagnosticUnderlineInfo", { undercurl = true, sp = c.aqua })
h("DiagnosticUnderlineHint", { undercurl = true, sp = c.green })
h("DiagnosticFloatingError", { fg = c.red, underline = true })
h("DiagnosticFloatingWarn", { fg = c.yellow, underline = true })
h("DiagnosticFloatingInfo", { fg = c.aqua, underline = true })
h("DiagnosticFloatingHint", { fg = c.green, underline = true })
h("DiagnosticSignError", { fg = c.red })
h("DiagnosticSignWarn", { fg = c.yellow })
h("DiagnosticSignInfo", { fg = c.aqua })
h("DiagnosticSignHint", { fg = c.green })

-- [[ lsp highlights ]] `h lsp.txt:446`
h("LspReferenceText", { bg = c.bg2 })
h("LspReferenceRead", { bg = c.bg2 })
h("LspReferenceWrite", { bg = c.bg2 })
h("LspCodeLens", { link = "Comment" })
h("LspCodeLensSeparator", { link = "Comment" })
h("LspSignatureActiveParameter", { fg = c.orange })

-- [[ TreeSitter Highlighting ]] `h treesitter-highlight-groups`
h("@comment", { link = "Comment" })
-- h("@error", { link = "error" })
h("@none", { bg = "NONE", fg = "NONE" })
h("@preproc", { fg = c.aqua, bold = true })
h("@define", { link = "@preproc" })
h("@operator", { fg = c.fg1 })

-- Punctuation
h("@punctuation.delimiter", { fg = c.fg0 })
h('@punctuation.bracket', { fg = c.fg0 })
h('@punctuation.special', { fg = c.fg0 })

-- Literals
h('@string', { fg = c.green })
h('@string.regex', { fg = c.green })
h('@string.escape', { fg = c.aqua })
h('@string.special', {})

h('@character', { fg = c.green })
h('@character.special', {})

h('@boolean', { fg = c.purple })
h('@number', { fg = c.purple })
h('@float', { fg = c.purple })

-- Functions
h('@function', { fg = c.orange, italic = true })
h('@function.call', { fg = c.yellow })
h('@function.builtin', { fg = c.orange })
h('@function.macro', { fg = c.blue })

h('@method', { fg = c.yellow, italic = true })
h('@method.call', { fg = c.yellow })

h('@constructor', { fg = c.aqua })
h('@parameter', { fg = c.fg1 })

-- Keywords
h('@keyword', { fg = c.purple })
h('@keyword.function', { fg = c.purple })
h('@keyword.operator', { fg = c.purple })
h('@keyword.return', { fg = c.red })

h('@conditional', { fg = c.purple })
h('@repeat', { fg = c.purple })
h('@debug', {})
h('@label', { fg = c.blue })
h("@include", { link = "@preproc" })
h('@exception', { fg = c.purple })

-- Types
h('@type', { fg = c.yellow })
h('@type.builtin', { fg = c.yellow })
h('@type.qualifier', { fg = c.purple })
h('@type.definition', {})

h('@storageclass', { fg = c.purple })
h('@attribute', { fg = c.aqua })
h('@field', { fg = c.red })
h('@property', { fg = c.orange })

-- Identifiers
h('@variable', { fg = c.fg1 })
h('@variable.builtin', { fg = c.yellow })
h('@storageclass.lifetime', { fg = c.aqua })

h('@constant', { fg = c.blue })
h('@constant.builtin', { fg = c.yellow })
h('@constant.macro', { fg = c.aqua })

h('@namespace', { link = '@type' })
h('@symbol', {})

-- Text
h('@text', { fg = c.yellow })
h('@text.strong', { fg = c.yellow })
h('@text.emphasis', { fg = c.yellow })
h('@text.underline', { underline = true })
h('@text.strike', { strikethrough = true })
h('@text.title', { fg = c.yellow })
h('@text.literal', { fg = c.yellow })
h('@text.uri', { link = 'Underlined' })
h('@text.math', {})
h('@text.environment', {})
h('@text.environment.name', {})
h('@text.reference', {})

-- Old: for treesitter comment
-- h('@text.todo', { link = 'Todo' })
-- h('@text.note', { fg = c.yellow, italic = true })
-- h('@text.warning', { link = 'Todo' })
-- h('@text.danger', { link = 'Error' })

-- New: for treesitter comment
h('@comment.todo.comment', { link = 'Todo' })
h('@comment.note.comment', { fg = c.yellow, italic = true })
h('@comment.warning.comment', { link = 'Todo' })
h('@comment.error.comment', { link = 'Error' })

-- Tags
h('@tag', { fg = c.red })
h('@tag.attribute', {})
h('@tag.delimiter', { fg = c.grey })

-- markdown
h('@markup.list.markdown', { link = "markdownListMarker" })
h('@markup.list.checked.markdown', { fg = c.bg0, bg = c.green })
h('@markup.list.unchecked.markdown', { fg = c.bg0, bg = c.red })
h('@markup.heading.1.marker.markdown', { fg = c.orange })
h('@markup.heading.1.markdown', { fg = c.green, bold = true })
h('@markup.heading.2.marker.markdown', { fg = c.orange })
h('@markup.heading.2.markdown', { fg = c.green, bold = true })
h('@markup.heading.3.marker.markdown', { fg = c.orange })
h('@markup.heading.3.markdown', { fg = c.yellow, bold = true })
h('@markup.heading.4.marker.markdown', { fg = c.orange })
h('@markup.heading.4.markdown', { fg = c.yellow, bold = true })
h('@markup.heading.5.marker.markdown', { fg = c.orange })
h('@markup.heading.5.markdown', { fg = c.yellow })
h('@markup.heading.6.marker.markdown', { fg = c.orange })
h('@markup.heading.6.markdown', { fg = c.yellow })
h('@markup.strong.markdown_inline', { fg = c.orange, bold = true })
h('@markup.italic.markdown_inline', { fg = c.fg3, italic = true })
h('@markup.quote.markdown', { fg = c.gray, italic = true })
h('@markup.raw.markdown_inline', { fg = c.aqua })
h('@markup.raw.delimiter.markdown_inline', { fg = c.aqua })
h('@markup.link.markdown_inline', { fg = c.fg3 })
h('@markup.link.label.markdown_inline', { fg = c.blue, underline = true })
h('@markup.link.url.markdown_inline', { underline = true })
h('@markup.strikethrough.markdown_inline', { fg = c.gray, strikethrough = true })

-- [[ lsp semantic_tokens highlight]]
h('@lsp.type.class', { link = "@constructor" })
h('@lsp.type.comment', {})
h('@lsp.type.decorator', { link = "@parameter" })
h('@lsp.type.enum', { link = "@type" })
h('@lsp.type.enumMember', { link = "@constant" })
h('@lsp.type.function', { link = "@function" })
h('@lsp.type.interface', { link = "@keyword" })
h('@lsp.type.macro', { link = "@macro" })
h('@lsp.type.method', { link = "@method" })
h('@lsp.type.namespace', { link = "@namespace" })
h('@lsp.type.parameter', { link = "@parameter" })
h('@lsp.type.property', { link = "@property" })
h('@lsp.type.struct', { link = "@constructor" })
h('@lsp.type.type', { link = "@type" })
h('@lsp.type.typeParameter', { link = "@type.definition" })
h('@lsp.type.variable', { link = "@variable" })

-- [[ telescope ]] `https://github.com/nvim-telescope/telescope.nvim/blob/master/plugin/telescope.lua`
h("TelescopeNormal", { fg = c.fg0 })
h("TelescopeSelection", { bg = c.bg4, bold = true })
h("TelescopeSlectionCaret", { fg = c.red })
h("TelescopeMultiSelection", { fg = c.grey })
h("TelescopeBorder", { fg = c.yellow })
h("TelescopePromptBorder", { fg = c.blue })
h("TelescopeResultsBorder", { fg = c.yellow })
h("TelescopePreviewBorder", { fg = c.purple })
h("TelescopeMatching", { fg = c.yellow, bold = true })
h("TelescopePromptPrefix", { fg = c.red })

-- [[ Undotree ]] `https://github.com/jiaoshijie/undotree/blob/main/syntax/Undotree.vim`
h("UndotreeDiffLine", { fg = c.aqua, bg = c.bg0 })
h("UndotreeDiffAdded", { fg = c.green, bg = c.bg0, reverse = true })
h("UndotreeDiffRemoved", { fg = c.red, bg = c.bg0, reverse = true })
-- }}}
