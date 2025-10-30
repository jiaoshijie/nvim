-- Inspired by: https://tonsky.me/blog/syntax-highlighting/ and https://github.com/morhetz/gruvbox

local hl = function(group, opts)
    opts.default = false
    vim.api.nvim_set_hl(0, group, opts)
end

vim.cmd("hi clear")
vim.opt.background = "dark"
vim.g.colors_name = "jsj"

-- terminal colors
vim.g.terminal_color_0 = '#2e2e2e'
vim.g.terminal_color_1 = '#eb4129'
vim.g.terminal_color_2 = '#abe047'
vim.g.terminal_color_3 = '#f6c744'
vim.g.terminal_color_4 = '#47a0f3'
vim.g.terminal_color_5 = '#7b5cb0'
vim.g.terminal_color_6 = '#64dbed'
vim.g.terminal_color_7 = '#e5e9f0'
vim.g.terminal_color_8 = '#565656'
vim.g.terminal_color_9 = '#ec5357'
vim.g.terminal_color_10 = '#c0e17d'
vim.g.terminal_color_11 = '#f9da6a'
vim.g.terminal_color_12 = '#49a4f8'
vim.g.terminal_color_13 = '#a47de9'
vim.g.terminal_color_14 = '#99faf2'
vim.g.terminal_color_15 = '#ffffff'

local c = {
    -- black
    bg = "#1d2021",   -- hard: #1d2021, normal: #282828, soft: #32302f
    -- white
    fg = "#fbf1c7",   -- hard: #f9f5d7, normal: #fbf1c7, soft: #f2e5bc

    -- other six colors
    red = "#fb4934",
    green = "#b8bb26",
    yellow = "#fabd2f",
    blue = "#83a598",
    purple = "#d3869b",
    aqua = "#8ec07c",

    -- other six visual colors
    v_red = "#5D120A",     -- error
    v_green = "#165603",   -- hint info
    v_yellow = "#565303",  -- warn
    v_blue = "#065567",
    v_purple = "#7e2e60",
    v_aqua = "#316a47",

    -- extra colors
    orange = "#f38019",
    gray = "#928374",
    gray_bg = "#504945",
    gray_fg = "#bdae93",

    -- for statusline and winbar
    statusline = "#2c323c",
    statuslineNC = "#5c6370",

    -- cursor colors
    cursor_fg = "#000000",
    cursor_bg = "#5588FF",
    cursor_line_bg = "#3c3836"
}

----------------------------> h syntax:5151 <---------------------------------
hl("ColorColumn", { link = "CursorLine" })
hl("Conceal", { fg = c.gray })
-- [[ cursor ]]
hl("CurSearch", { link = "IncSearch" })
hl("Cursor", { fg = c.cursor_fg, bg = c.cursor_bg })
hl("lCursor", { link = "Cursor" })
hl("CursorIM", { link = "Cursor" })
hl("CursorColumn", { link = "CursorLine" })
hl("CursorLine", { bg = c.cursor_line_bg })
hl("Directory", { link = "Normal" })
-- [[ Diff mode 'nvim -d']]
hl("DiffAdd", { fg = c.green, bg = c.bg, reverse = true })
hl("DiffChange", { fg = c.aqua, bg = c.bg, reverse = true })
hl("DiffDelete", { fg = c.red, bg = c.bg, reverse = true })
hl("DiffText", { fg = c.yellow, bg = c.bg, reverse = true })
hl("EndOfBuffer", { link = "NonText" })
-- [[ terminal Cursor ]]
hl("TermCursor", { link = "Cursor" })
hl("ErrorMsg", { fg = c.red, bold = true })
hl("WinSeparator", { fg = c.gray })
hl("Folded", { fg = c.gray, bg = c.gray_bg, italic = true })
hl("FoldColumn", { fg = c.gray, bg = c.gray_bg })
hl("SignColumn", { link = "LineNr" })
hl("IncSearch", { fg = c.orange, bg = c.bg, reverse = true })
hl("Substitute", { link = "Search" })
hl("LineNr", { fg = c.gray })
hl("LineNrAbove", { link = "LineNr" })
hl("LineNrBelow", { link = "LineNr" })
hl("CursorLineNr", { fg = c.yellow, bg = c.cursor_line_bg, bold = true })
hl("CursorLineFold", { link = "FoldColumn" })
hl("CursorLineSign", { link = "SignColumn" })
hl("MatchParen", { fg = c.cursor_bg, bg = c.gray_bg, bold = true })  -- matched () {} []
hl("ModeMsg", { fg = c.yellow })
hl("MsgArea", { fg = c.fg })
hl("MsgSeparator", { link = "StatusLine" })
hl("MoreMsg", { link = "ModeMsg" })
hl("NonText", { fg = c.gray_bg })
hl("Normal", { fg = c.fg, bg = c.bg })
hl("NormalFloat", { link = "Normal" })
hl("FloatBorder", { fg = c.gray })
hl("FloatTitle", { fg = c.green })
hl("FloatFooter", { fg = c.green })
hl("NormalNC", { link = "Normal" })
hl("Pmenu", { fg = c.fg, bg = c.bg })
hl("PmenuSel", { fg = c.fg, bg = c.blue, bold = true })
hl("PmenuKind", {  link = "Pmenu" })
hl("PmenuKindSel", { link = "PmenuSel" })
hl("PmenuExtra", {  link = "Pmenu" })
hl("PmenuExtraSel", { link = "PmenuSel" })
hl("PmenuSbar", { bg = c.gray_bg })
hl("PmenuThumb", { bg = c.gray })
hl("PmenuMatch", { fg = c.fg, bold = true })
hl("PmenuMatchSel", { link = "PmenuMatch" })
hl("ComplMatchIns", { fg = c.fg })
hl("Question", { fg = c.orange })
hl("QuickFixLine", { link = "Search" })
hl("Search", { fg = c.bg, bg = c.yellow })
hl("SnippetTabstop", { reverse = true })
hl("SpecialKey", { fg = c.gray_bg })
-- [[ Spelling ]]
hl("SpellBad", { fg = c.bg, bg = c.red })
hl("SpellCap", { fg = c.bg, bg = c.blue })
hl("SpellLocal", { fg = c.bg, bg = c.aqua })
hl("SpellRare", { fg = c.bg, bg = c.purple })
-- [[ statusline ]]
hl("StatusLine", { bg = c.statusline })
hl("StatusLineNC", { bg = c.statuslineNC })
hl("StatusLineTerm", { link = "StatusLine" })
hl("StatusLineTermNC", { link = "StatusLineNC" })
hl("TabLine", { fg = c.gray, bg = c.fg })
hl("TabLineFill", { link = "TabLine" })
hl("TabLineSel", { fg = c.yellow, bg = c.gray_bg })
hl("Title", { fg = c.green, bold = true })
hl("Visual", { bg = c.gray_bg, reverse = true })
hl("VisualNOS", { link = "Visual" })
hl("WarningMsg", { fg = c.red })
hl("Whitespace", { fg = c.gray_bg })  -- trailing space, tab
hl("WildMenu", { fg = c.blue, bg = c.bg, bold = true })
hl("WinBar", { link = "StatusLine" })
hl("WinBarNC", { link = "StatusLineNC" })

-- NOTE: for GUI
-- h("Menu", {})
-- h("Scrollbar", {})
-- h("Tooltip", {})

-----------------------------> h syntax:198 <---------------------------------
hl("Comment", { fg = c.gray, italic = true })
hl("Constant", { fg = c.purple })
hl("String", { fg = c.green })
hl("Character", { fg = c.purple })
hl("Number", { fg = c.purple })
hl("Boolean", { fg = c.purple })
hl("Float", { fg = c.purple })
hl("Identifier", { fg = c.blue })
hl("Function", { fg = c.fg })
hl("Statement", { fg = c.red })
hl("Conditional", { fg = c.red })
hl("Repeat", { fg = c.red })
hl("Label", { fg = c.blue })
hl("Operator", { fg = c.gray_fg })
hl("Keyword", { fg = c.red })
hl("Exception", { fg = c.red })
hl("PreProc", { fg = c.aqua })
hl("Include", { fg = c.aqua })
hl("Define", { fg = c.aqua })
hl("Macro", { fg = c.aqua })
hl("PreCondit", { fg = c.aqua })
hl("Type", { fg = c.yellow })
hl("StorageClass", { fg = c.red })
hl("Structure", { fg = c.red })
hl("Typedef", { fg = c.red })
hl("Special", { fg = c.green })
hl("SpecialChar", { fg = c.purple })
hl("Tag", { fg = c.aqua })
hl("Delimiter", { fg = c.gray })
hl("SpecialComment", { fg = c.orange })
hl("Debug", { fg = c.fg })
hl("Underlined", { fg = c.blue, underline = true })
hl("Ignore", { link = "Conceal" })
hl("Error", { fg = c.red, bg = c.bg, reverse = true, bold = true })
hl("Todo", { fg = c.yellow, bg = c.bg, reverse = true, bold = true })
hl("Added", { fg = c.green })
hl("Changed", { fg = c.yellow })
hl("Removed", { fg = c.red })

-----------------------------> FileType Specific <----------------------------
-- [[ Netrw ]]
hl("netrwDir", { fg = c.aqua })
hl("netrwClassify", { fg = c.aqua })
hl("netrwLink", { fg = c.gray })
hl("netrwSymLink", { fg = c.blue, underline = true, italic = true })
hl("netrwExe", { fg = c.yellow })
hl("netrwComment", { fg = c.gray })
hl("netrwList", { fg = c.blue })
hl("netrwHelpCmd", { fg = c.aqua })
hl("netrwCmdSep", { fg = c.gray_fg })
hl("netrwVersion", { fg = c.green })

-- [[ diff file *.diff ]]
hl("diffAdded", { fg = c.green })
hl("diffRemoved", { fg = c.red })
hl("diffChanged", { fg = c.aqua })
hl("diffFile", { fg = c.orange })
hl("diffNewFile", { fg = c.yellow })
hl("diffLine", { fg = c.blue })

-- [[ neovim health ]]
hl("healthError", { fg = c.red })
hl("healthSuccess", { fg = c.green })
hl("healthWarning", { fg = c.yellow })

-- [[ Markdown ]]
hl("markdownH1", { fg = c.yellow, bold = true })
hl("markdownH2", { fg = c.yellow, bold = true })
hl("markdownH3", { fg = c.green, bold = true })
hl("markdownH4", { fg = c.green, bold = true })
hl("markdownH5", { fg = c.green })
hl("markdownH6", { fg = c.green })
hl("markdownHeadingRule", { fg = c.gray })  -- Head 1\n============  Head2\n-----------
hl("markdownHeadingDelimiter", { fg = c.gray_fg })  -- # ## ### ,etc.
hl("markdownOrderedListMarker", { fg = c.gray_fg })
hl("markdownListMarker", { fg = c.gray })
hl("markdownBlockquote", { fg = c.gray })  -- `>`
hl("markdownRule", { fg = c.gray })  -- --------- or *************
hl("markdownFootnote", { fg = c.blue, underline = true })  -- [^1]
hl("markdownFootnoteDefinition", { fg = c.gray_fg })  -- [^1]:
hl("markdownLinkText", { fg = c.fg })  -- [link text](url)
hl("markdownIdDeclaration", { fg = c.gray_fg }) -- [1]:
hl("markdownAutomaticLink", { link = "markdownUrl" })  -- <url>
hl("markdownUrl", { fg = c.blue, underline = true })
hl("markdownUrlTitle", { fg = c.green }) -- (url "url title")
hl("markdownUrlDelimiter", { fg = c.gray_fg })  -- <url>
hl("markdownUrlTitleDelimiter", { fg = c.gray_fg }) -- (url "url title")
hl("markdownItalic", { fg = c.gray_fg, italic = true })  -- *text* _text_
hl("markdownBold", { fg = c.orange, bold = true })
hl("markdownBoldItalic", { fg = c.orange, bold = true, italic = true })
hl("markdownStrike", { fg = c.gray_fg, strikethrough = true }) -- ~~text~~
hl("markdownCode", { fg = c.aqua })
hl("markdownCodeDelimiter", { link = "markdownCode" })
hl("markdownEscape", { fg = c.gray })
hl("markdownError", { fg = c.red })
hl("markdownCodeBlock", { fg = c.aqua })
hl("markdownLinkDelimiter", { fg = c.gray })  -- (url)
hl("markdownLinkTextDelimiter", { fg = c.gray_fg })  -- ![link text]

-------------------------------> diagnostic <---------------------------------
-- `h diagnostic.txt:237`
hl("DiagnosticError", { fg = c.red })
hl("DiagnosticWarn", { fg = c.yellow })
hl("DiagnosticInfo", { fg = c.green })
hl("DiagnosticHint", { link = "DiagnosticInfo" })
hl("DiagnosticOk", { fg = c.fg })
hl("DiagnosticVirtualTextError", { fg = c.red, bg = c.v_red, italic = true })
hl("DiagnosticVirtualTextWarn", { fg = c.yellow, bg = c.v_yellow, italic = true })
hl("DiagnosticVirtualTextInfo", { fg = c.green, bg = c.v_green, italic = true })
hl("DiagnosticVirtualTextHint", { link = "DiagnosticVirtualTextInfo" })
hl("DiagnosticVirtualTextOk", { link = "DiagnosticOk" })
hl("DiagnosticVirtualLinesError", { link = "DiagnosticVirtualTextError" })
hl("DiagnosticVirtualLinesWarn", { link = "DiagnosticVirtualTextWarn" })
hl("DiagnosticVirtualLinesInfo", { link = "DiagnosticVirtualTextInfo" })
hl("DiagnosticVirtualLinesHint", { link = "DiagnosticVirtualTextHint" })
hl("DiagnosticVirtualLinesOk", { link = "DiagnosticVirtualTextOk" })
hl("DiagnosticUnderlineError", { sp = c.red, undercurl = true,  })
hl("DiagnosticUnderlineWarn", { sp = c.yellow, undercurl = true })
hl("DiagnosticUnderlineInfo", { sp = c.green, undercurl = true })
hl("DiagnosticUnderlineHint", { link = "DiagnosticUnderlineInfo" })
hl("DiagnosticUnderlineOk", { link = "DiagnosticOk" })
hl("DiagnosticFloatingError", { link = "DiagnosticError" })
hl("DiagnosticFloatingWarn", { link = "DiagnosticWarn" })
hl("DiagnosticFloatingInfo", { link = "DiagnosticInfo" })
hl("DiagnosticFloatingHint", { link = "DiagnosticHint" })
hl("DiagnosticFloatingOk", { link = "DiagnosticOk" })
hl("DiagnosticSignError", { link = "DiagnosticError" })
hl("DiagnosticSignWarn", { link = "DiagnosticWarn" })
hl("DiagnosticSignInfo", { link = "DiagnosticInfo" })
hl("DiagnosticSignHint", { link = "DiagnosticHint" })
hl("DiagnosticSignOk", { link = "DiagnosticOk" })
hl("DiagnosticDeprecated", { fg = c.fg, strikethrough = true })
hl("DiagnosticUnnecessary", { sp = c.gray, undercurl = true })

----------------------------------> lsp <-------------------------------------
-- `h lsp.txt:440`
hl("LspReferenceText", { bg = c.gray })
hl("LspReferenceRead", { link = "LspReferenceText" })
hl("LspReferenceWrite", { link = "LspReferenceText" })
hl("LspReferenceTarget", { link = "LspReferenceText" })
hl("LspInlayHint", { link = "NonText" })
hl("LspCodeLens", { link = "NonText" })
hl("LspCodeLensSeparator", { link = "NonText" })
hl("LspSignatureActiveParameter", { fg = c.yellow, bg = c.gray_bg })

-- `h lsp.txt:524`
-- NOTE: Using neovim's default highlight link mapping
-- hl("@lsp.type.class", {})
-- hl("@lsp.type.comment", {})
-- hl("@lsp.type.decorator", {})
-- hl("@lsp.type.enum", {})
-- hl("@lsp.type.enumMember", {})
-- hl("@lsp.type.event", {})
-- hl("@lsp.type.function", {})
-- hl("@lsp.type.interface", {})
-- hl("@lsp.type.keyword", {})
-- hl("@lsp.type.macro", {})
-- hl("@lsp.type.method", {})
-- hl("@lsp.type.modifier", {})
-- hl("@lsp.type.namespace", {})
-- hl("@lsp.type.number", {})
-- hl("@lsp.type.operator", {})
-- hl("@lsp.type.parameter", {})
-- hl("@lsp.type.property", {})
-- hl("@lsp.type.regexp", {})
-- hl("@lsp.type.string", {})
-- hl("@lsp.type.struct", {})
-- hl("@lsp.type.type", {})
-- hl("@lsp.type.typeParameter", {})
-- hl("@lsp.type.variable", {})
-- hl("@lsp.mod.abstract", {})
-- hl("@lsp.mod.async", {})
-- hl("@lsp.mod.declaration", {})
-- hl("@lsp.mod.defaultLibrary", {})
-- hl("@lsp.mod.definition", {})
-- hl("@lsp.mod.deprecated", {})
-- hl("@lsp.mod.documentation", {})
-- hl("@lsp.mod.modification", {})
-- hl("@lsp.mod.readonly", {})
-- hl("@lsp.mod.static", {})

-------------------------------> treesitter <---------------------------------
-- `h treesitter-highlight-groups`
hl("@variable", { fg = c.fg })
hl("@variable.builtin", { fg = c.yellow })
hl("@variable.parameter", { fg = c.fg })
hl("@variable.parameter.builtin", { fg = c.yellow })
hl("@variable.member", { fg = c.fg })
hl("@constant", { fg = c.purple })
hl("@constant.builtin", { fg = c.purple })
hl("@constant.macro", { fg = c.aqua })
hl("@module", { fg = c.fg })
hl("@module.builtin", { fg = c.yellow })
hl("@label", { fg = c.blue })
hl("@string", { fg = c.green })
hl("@string.documentation", { fg = c.orange })
hl("@string.regexp", { fg = c.green })
hl("@string.escape", { fg = c.orange })
hl("@string.special", { fg = c.green })
hl("@string.special.symbol", { fg = c.green })
hl("@string.special.path", { fg = c.green })
hl("@string.special.url", { fg = c.blue, underline = true })
hl("@character", { fg = c.purple })
hl("@character.special", { fg = c.purple })
hl("@boolean", { fg = c.purple })
hl("@number", { fg = c.purple })
hl("@number.float", { fg = c.purple })
hl("@type", { fg = c.yellow })
hl("@type.builtin", { fg = c.yellow })
hl("@type.definition", { fg = c.yellow })
hl("@attribute", { fg = c.aqua })
hl("@attribute.builtin", { fg = c.aqua })
hl("@property", { fg = c.fg })
hl("@function", { fg = c.orange })
hl("@function.builtin", { fg = c.orange })
hl("@function.call", { fg = c.fg })
hl("@function.macro", { fg = c.aqua })
hl("@function.method", { fg = c.orange })
hl("@function.method.call", { fg = c.fg })
hl("@constructor", { fg = c.orange })
hl("@operator", { fg = c.gray_fg })
hl("@keyword", {  fg = c.red })
hl("@keyword.coroutine", { fg = c.red })
hl("@keyword.function", { fg = c.red })
hl("@keyword.operator", { fg = c.purple })
hl("@keyword.import", { fg = c.aqua })
hl("@keyword.type", { fg = c.red })
hl("@keyword.modifier", { fg = c.red })
hl("@keyword.repeat", { fg = c.red })
hl("@keyword.return", { fg = c.red })
hl("@keyword.debug", { fg = c.fg })
hl("@keyword.exception", { fg = c.red })
hl("@keyword.conditional", { fg = c.red })
hl("@keyword.conditional.ternary", { fg = c.gray_fg })
hl("@keyword.directive", { fg = c.aqua })
hl("@keyword.directive.define", { fg = c.aqua })
hl("@punctuation.delimiter", { fg = c.gray_fg })
hl("@punctuation.bracket", { fg = c.gray_fg })
hl("@punctuation.special", { fg = c.gray_fg })
hl("@comment", { fg = c.gray, italic = true })
hl("@comment.documentation", { fg = c.orange })
hl("@comment.error", { fg = c.bg, bg = c.red, bold = true })
hl("@comment.warning", { fg = c.bg, bg = c.yellow, bold = true })
hl("@comment.todo", { link = "@comment.warning" })
hl("@comment.note", { fg = c.yellow })
hl("@markup.strong", { fg = c.orange, bold = true })
hl("@markup.italic", { fg = c.gray_fg, italic = true })
hl("@markup.strikethrough", { fg = c.gray_fg, strikethrough = true })
hl("@markup.underline", { fg = c.fg, underline = true })
hl("@markup.heading", { fg = c.yellow, bold = true })
hl("@markup.heading.1", { fg = c.yellow, bold = true })
hl("@markup.heading.2", { fg = c.yellow, bold = true })
hl("@markup.heading.3", { fg = c.green, bold = true })
hl("@markup.heading.4", { fg = c.green, bold = true })
hl("@markup.heading.5", { fg = c.green })
hl("@markup.heading.6", { fg = c.green })
hl("@markup.quote", { fg = c.gray_fg, italic = true })  -- >
hl("@markup.math", { fg = c.aqua })
hl("@markup.link", { fg = c.blue, underline = true })
hl("@markup.link.label", { fg = c.blue, italic = true })
hl("@markup.link.url", { fg = c.blue, underline = true })
hl("@markup.raw", { fg = c.aqua })
hl("@markup.raw.block", { fg = c.aqua })
hl("@markup.list", { fg = c.gray_fg })
hl("@markup.list.checked", { fg = c.green, bg = c.bg, reverse = true })
hl("@markup.list.unchecked", { fg = c.red, bg = c.bg, reverse = true })
hl("@diff.plus", { link = "Added" })
hl("@diff.minus", { link = "Removed" })
hl("@diff.delta", { link = "Changed" })
hl("@tag", { fg = c.aqua })
hl("@tag.builtin", { fg = c.aqua })
hl("@tag.attribute", { fg = c.yellow })
hl("@tag.delimiter", { fg = c.gray })

-- filetype specific
hl("@string.escape.markdown_inline", { fg = c.gray })

----------------------------------> plugins <---------------------------------
-- [[ fzf-lua ]] `https://github.com/ibhagwan/fzf-lua?tab=readme-ov-file#highlight-groups`
hl("FzfLuaNormal", { fg = c.fg })
hl("FzfLuaBorder", { fg = c.purple })
hl("FzfLuaTitleFlags", { fg = c.yellow, bg = c.gray_bg, bold = true })
hl("FzfLuaPreviewBorder", { fg = c.yellow })
hl("FzfLuaScrollBorderEmpty", { fg = c.blue })
hl("FzfLuaScrollBorderFull", { fg = c.blue })
hl("FzfLuaFzfMatch", { fg = c.yellow, bold = true })
hl("FzfLuaFzfPrompt", { fg = c.red })
hl("FzfLuaFzfBorder", { fg = c.aqua })
hl("FzfLuaFzfScrollbar", { fg = c.blue })
hl("FzfLuaFzfHeader", { fg = c.gray })
hl("FzfLuaFzfMarker", { fg = c.red })
hl("FzfLuaFzfPointer", { fg = c.yellow })

-- [[ Undotree ]] `https://github.com/jiaoshijie/undotree/blob/main/plugin/undotree.lua`
hl("UndotreeDiffLine", { fg = c.aqua })
hl("UndotreeDiffAdded", { fg = c.green })
hl("UndotreeDiffRemoved", { fg = c.red })
-- }}}

-- [[ onlysearch ]] `https://github.com/jiaoshijie/onlysearch/blob/main/plugin/onlysearch.lua`
hl("OnlysearchHeaderSearch", { fg = c.yellow, bg = c.v_yellow })
hl("OnlysearchHeaderPaths", { fg = c.blue, bg = c.v_blue })
hl("OnlysearchHeaderFlags", { fg = c.purple, bg = c.v_purple })
hl("OnlysearchHeaderFilters", { fg = c.aqua, bg = c.v_aqua })
hl("OnlysearchFilename", { fg = c.green, underline = true })
hl("OnlysearchMatchLNum", { fg = c.yellow })
hl("OnlysearchMatchCtx", { fg = c.red, bold = true })
hl("OnlysearchError", { fg = c.red })
hl("OnlysearchSep", { fg = c.gray })
hl("OnlysearchSepErr", { fg = c.red })
hl("OnlysearchSelectedLine", { reverse = true })
