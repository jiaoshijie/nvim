local h = require("init-utils").hl

vim.g.colors_name = "gruvbox"
local c = {}
local s = { b = "bold", ul = "underline", ull = "underlineline", uc = "undercurl", r = "reverse", i = "italic" }

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
  c.visual_red = "#5D120A" -- lsp virual text
  c.visual_yellow = "#565303" -- lsp virual text
  c.visual_green = "#165603" -- lsp virual text
  c.visual_aqua = "#032C56" -- lsp virual text
else
  c.bg0 = "#ffffff" -- hard: #f9f5d7, normal: #fbf1c7, soft: #f2e5bc
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
  c.visual_red = "#FBD1C7" -- lsp virual text
  c.visual_yellow = "#FBFBC7" -- lsp virual text
  c.visual_green = "#C7FBD9" -- lsp virual text
  c.visual_aqua = "#C7E9FB" -- lsp virual text
end

c.statusline = "#2c323c"
c.statuslineNC = "#5c6370"

-------------------------
-- Vim Terminal Colors --
-------------------------

vim.g.terminal_color_0 = vim.o.background == "dark" and "#282828" or "#fbf1c7"
vim.g.terminal_color_8 = "#928374"
vim.g.terminal_color_1 = "#cc241d"
vim.g.terminal_color_9 = vim.o.background == "dark" and "#fb4934" or "#9d0006"
vim.g.terminal_color_2 = "#98971a"
vim.g.terminal_color_10 = vim.o.background == "dark" and "#b8bb26" or "#79740e"
vim.g.terminal_color_3 = "#d79921"
vim.g.terminal_color_11 = vim.o.background == "dark" and "#fabd2f" or "#b57614"
vim.g.terminal_color_4 = "#458588"
vim.g.terminal_color_12 = vim.o.background == "dark" and "#83a598" or "#076678"
vim.g.terminal_color_5 = "#b16286"
vim.g.terminal_color_13 = vim.o.background == "dark" and "#d3869b" or "#8f3f71"
vim.g.terminal_color_6 = "#689d6a"
vim.g.terminal_color_14 = vim.o.background == "dark" and "#8ec07c" or "#427b58"
vim.g.terminal_color_7 = "#d65d0e"
vim.g.terminal_color_15 = vim.o.background == "dark" and "#f38018" or "#af3a03"

h("Normal", { fg = c.fg1, bg = c.bg0 })
h("CursorLine", { bg = c.bg1 })
h("CursorColumn", { bg = c.bg1 })
h("MatchParen", { bg = c.bg3, gui = s.b })
h("ColorColumn", { bg = c.bg1 })
h("Conceal", { fg = c.blue })
h("CursorLineNr", { fg = c.yellow, bg = c.bg1, gui = s.b })
h("NonText", { fg = c.bg2 })
h("Whitespace", { fg = c.purple })
h("SpecialKey", { fg = c.bg2 })
h("Visual", { bg = c.bg3, gui = s.r })
h("VisualNOS", { link = "Visual" })
h("Search", { fg = c.yellow, bg = c.bg0, gui = s.r })
h("IncSearch", { fg = c.orange, bg = c.bg0, gui = s.r })
h("Underlined", { fg = c.blue, gui = s.ul })
h("NormalFloat", { link = "Normal" })

h("StatusLine", { bg = c.statusline })
h("StatusLineNC", { bg = c.statuslineNC })
h("WinBar", { bg = c.statusline })
h("WinBarNC", { bg = c.statuslineNC })
h("TabLineFill", { fg = c.gray, bg = c.fg0 })
h("TabLine", { link = "TabLineFill" })
h("TabLineSel", { fg = c.green, bg = c.bg2 })

h("VertSplit", { fg = c.bg3, bg = c.bg0 })
h("WinSeparator", { fg = c.bg3, bg = c.bg0 })
h("WildMenu", { fg = c.blue, bg = c.bg2, gui = s.b })
h("Directory", { fg = c.green, gui = s.b })
h("Title", { fg = c.green, gui = s.b })
h("ErrorMsg", { fg = c.bg0, bg = c.red, gui = s.b })
h("MoreMsg", { fg = c.yellow, gui = s.b })
h("ModeMsg", { fg = c.yellow, gui = s.b })
h("Question", { fg = c.orange, gui = s.b })
h("WarningMsg", { fg = c.red, gui = s.b })
h("LineNr", { fg = c.bg4 })
h("SignColumn", { link = "LineNr" })
h("Folded", { fg = c.gray, bg = c.bg1, gui = s.i })
h("FoldColumn", { fg = c.gray, bg = c.bg1 })
h("Cursor", { gui = s.r })
h("lCursor", { link = "Cursor" })

-- highlight

h("Special", { fg = c.orange })
h("Comment", { fg = c.gray, gui = s.i })
h("Todo", { fg = c.yellow, bg = c.bg0, gui = s.i .. "," .. s.b })
h("Error", { fg = c.red, bg = c.bg0, gui = s.r .. "," .. s.b })
h("Statement", { fg = c.red })
h("Conditional", { fg = c.red })
h("Repeat", { fg = c.red })
h("Label", { fg = c.red })
h("Exception", { fg = c.red })
h("Operator", { fg = c.fg1 })
h("Keyword", { fg = c.red })
h("Identifier", { fg = c.blue })
h("Function", { fg = c.green, gui = s.b })
h("PreProc", { fg = c.aqua })
h("Include", { fg = c.aqua })
h("Define", { fg = c.aqua })
h("Macro", { fg = c.aqua })
h("PreCondit", { fg = c.aqua })
h("Constant", { fg = c.purple })
h("Character", { fg = c.purple })
h("String", { fg = c.green, gui = s.i })
h("Boolean", { fg = c.purple })
h("Number", { fg = c.purple })
h("Float", { fg = c.purple })
h("Type", { fg = c.yellow })
h("StorageClass", { fg = c.orange })
h("Structure", { fg = c.aqua })
h("Typedef", { fg = c.yellow })
--[[ Completion Menu ]]
h("Pmenu", { fg = c.fg1, bg = c.bg2 })
h("PmenuSel", { fg = c.bg2, bg = c.blue, gui = s.b .. "," .. s.i })
h("PmenuSbar", { bg = c.bg2 })
h("PmenuThumb", { bg = c.bg4 })
-- [[ Diffs ]]
h("DiffDelete", { fg = c.red, bg = c.bg0, gui = s.r })
h("DiffAdd", { fg = c.green, bg = c.bg0, gui = s.r })
h("DiffChange", { fg = c.aqua, bg = c.bg0, gui = s.r })
h("DiffText", { fg = c.yellow, bg = c.bg0, gui = s.r })
-- [[ Spelling ]]
h("SpellCap", { gui = s.uc, sp = c.red })
h("SpellBad", { gui = s.uc, sp = c.blue })
h("SpellLocal", { gui = s.uc, sp = c.aqua })
h("SpellRare", { gui = s.uc, sp = c.purple })
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

---------------------
-- FileType specific
---------------------

h("diffAdded", { fg = c.green })
h("diffRemoved", { fg = c.red })
h("diffChanged", { fg = c.aqua })
h("diffFile", { fg = c.orange })
h("diffNewFile", { fg = c.yellow })
h("diffLine", { fg = c.blue })

-- vim
h("vimCommentTitle", { fg = c.fg4, gui = s.b .. "," .. s.i })
h("vimNotation", { fg = c.orange })
h("vimBracket", { fg = c.orange })
h("vimMapModKey", { fg = c.orange })
h("vimFuncSID", { fg = c.fg3 })
h("vimSetSep", { fg = c.fg3 })
h("vimSep", { fg = c.fg3 })
h("vimContinue", { fg = c.fg3 })

-- Markdown
h("markdownItalic", { fg = c.fg3, gui = s.i })
h("markdownH1", { fg = c.green, gui = s.b })
h("markdownH2", { fg = c.green, gui = s.b })
h("markdownH3", { fg = c.yellow, gui = s.b })
h("markdownH4", { fg = c.yellow, gui = s.b })
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
h("markdownLinkText", { fg = c.gray, gui = s.ul })
h("markdownIdDeclaration", { link = "markdownLinkText" })
h("markdownError", { fg = c.red })

----------------
-- plugins
----------------

-- lsp highlighting

h("DiagnosticError", { fg = c.red })
h("DiagnosticWarn", { fg = c.yellow })
h("DiagnosticInfo", { fg = c.aqua })
h("DiagnosticHint", { fg = c.green })
h("DiagnosticVirtualTextError", { fg = c.red, bg = c.visual_red, gui = s.i })
h("DiagnosticVirtualTextWarn", { fg = c.yellow, bg = c.visual_yellow, gui = s.i })
h("DiagnosticVirtualTextInfo", { fg = c.aqua, bg = c.visual_aqua, gui = s.i })
h("DiagnosticVirtualTextHint", { fg = c.green, bg = c.visual_green, gui = s.i })
h("DiagnosticUnderlineError", { gui = s.uc, sp = c.red })
h("DiagnosticUnderlineWarn", { gui = s.uc, sp = c.yellow })
h("DiagnosticUnderlineInfo", { gui = s.uc, sp = c.aqua })
h("DiagnosticUnderlineHint", { gui = s.uc, sp = c.green })
h("DiagnosticFloatingError", { fg = c.red, gui = s.ul })
h("DiagnosticFloatingWarn", { fg = c.yellow, gui = s.ul })
h("DiagnosticFloatingInfo", { fg = c.aqua, gui = s.ul })
h("DiagnosticFloatingHint", { fg = c.green, gui = s.ul })
h("DiagnosticSignError", { fg = c.red })
h("DiagnosticSignWarn", { fg = c.yellow })
h("DiagnosticSignInfo", { fg = c.aqua })
h("DiagnosticSignHint", { fg = c.green })

h("Jsj_LspDochighlight", { bg = c.bg2 })

-- lsp document_highlight
h("LspReferenceRead", { link = "Jsj_LspDochighlight" })
h("LspReferenceText", { link = "Jsj_LspDochighlight" })
h("LspReferenceWrite", { link = "Jsj_LspDochighlight" })

-- TreeSitter Highlighting

-- h("TSNone", {})
h("TSPunctDelimiter", { fg = c.fg0 })
h("TSPunctBracket", { fg = c.fg0 })
h("TSPunctSpecial", { fg = c.fg0 })

h("TSConstant", { fg = c.blue })
h("TSConstBuiltin", { fg = c.yellow })
h("TSConstMacro", { fg = c.aqua })
h("TSString", { fg = c.green })
h("TSStringRegex", { fg = c.green })
h("TSStringEscape", { fg = c.aqua })
-- h("TSStringSpecial", {})
h("TSCharacter", { fg = c.green })
-- h("TSCharacterSpecial", {})
h("TSNumber", { fg = c.purple })
h("TSBoolean", { fg = c.purple })
h("TSFloat", { fg = c.purple })

h("TSFunction", { fg = c.blue, gui = s.i })
h("TSFuncBuiltin", { fg = c.blue })
h("TSFuncMacro", { fg = c.yellow })
h("TSParameter", { fg = c.aqua })
h("TSParameterReference", { fg = c.aqua })
h("TSMethod", { fg = c.blue, gui=s.i })
h("TSField", { fg = c.red })
h("TSProperty", { fg = c.yellow })
h("TSConstructor", { fg = c.aqua })
h("TSAnnotation", { fg = c.yellow })
h("TSAttribute", { fg = c.aqua })
h("TSNamespace", { fg = c.purple })
-- h("TSSymbol", {})

h("TSConditional", { fg = c.purple })
h("TSRepeat", { fg = c.purple })
h("TSLabel", { fg = c.blue })
h("TSOperator", { fg = c.fg0 })
h("TSKeyword", { fg = c.purple })
h("TSKeywordFunction", { fg = c.purple })
h("TSKeywordOperator", { fg = c.purple })
h("TSKeywordReturn", { fg = c.red })
h("TSException", { fg = c.purple })
-- h("TSDebug", {})
-- h("TSDefine", {})
-- h("TSPreProc", {})
-- h("TSStorageClass", {})

-- h("TSTodo", {})

h("TSType", { fg = c.yellow })
h("TSTypeBuiltin", { fg = c.purple })
-- h("TSTypeQualifier", {})
-- h("TSTypeDefinition", {})

h("TSInclude", { fg = c.aqua, gui=s.b })

h("TSVariable", { fg = c.fg1 })
h("TSVariableBuiltin", { fg = c.yellow })

h("TSText", { fg = c.yellow })
h("TSStrong", { fg = c.yellow })
h("TSEmphasis", { fg = c.yellow })
h("TSUnderline", { fg = c.yellow })
-- h("TSStrike", {})

-- h("TSMath", {})
-- h("TSTextReference", {})
-- h("TSEnvironment", {})
-- h("TSEnvironmentName", {})
h("TSTitle", { fg = c.yellow })
h("TSLiteral", { fg = c.yellow })
h("TSURI", { fg = c.yellow })

-- h("TSComment", {})
-- h("TSNote", {})
-- h("TSWarning", {})
-- h("TSDanger", {})

h("TSTag", { fg = c.red })
h("TSTagDelimiter", { fg = c.grey })
-- h("TSTagAttribute", {})

-- telescope

h("TelescopeNormal", { fg = c.fg0 })
h("TelescopeSelection", { bg = c.bg4, gui = s.b })
h("TelescopeSlectionCaret", { fg = c.red })
h("TelescopeMultiSelection", { fg = c.grey })
h("TelescopeBorder", { fg = c.yellow })
h("TelescopePromptBorder", { fg = c.blue })
h("TelescopeResultsBorder", { fg = c.yellow })
h("TelescopePreviewBorder", { fg = c.purple })
h("TelescopeMatching ", { fg = c.yellow, gui = s.b })
h("TelescopePromptPrefix", { fg = c.red })

-- Undotree
h("UndotreeDiffLine", { fg = c.aqua, bg = c.bg0 })
h("UndotreeDiffAdded", { fg = c.green, bg = c.bg0, gui = s.r })
h("UndotreeDiffRemoved", { fg = c.red, bg = c.bg0, gui = s.r })
