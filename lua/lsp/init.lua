-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
-- local nvim_lsp = require('lspconfig')
vim.lsp.protocol.CompletionItemKind = {
    "  (Text) ",
    "  (Method)",
    "  (Function)",
    "  (Constructor)",
    " ﴲ (Field)",
    "[](Variable)",
    "  (Class)",
    " ﰮ (Interface)",
    "  (Module)",
    " 襁(Property)",
    "  (Unit)",
    "  (Value)",
    " 練(Enum)",
    "  (Keyword)",
    " ﬌ (Snippet)",
    "  (Color)",
    "  (File)",
    "  (Reference)",
    "  (Folder)",
    "  (EnumMember)",
    " ﲀ (Constant)",
    " ﳤ (Struct)",
    "  (Event)",
    "  (Operator)",
    "  (TypeParameter)"
}

vim.fn.sign_define("LspDiagnosticsSignError",
                   {texthl = "LspDiagnosticsSignError", text = "", numhl = "LspDiagnosticsSignError"})
vim.fn.sign_define("LspDiagnosticsSignWarning",
                   {texthl = "LspDiagnosticsSignWarning", text = "", numhl = "LspDiagnosticsSignWarning"})
vim.fn.sign_define("LspDiagnosticsSignHint",
                   {texthl = "LspDiagnosticsSignHint", text = "", numhl = "LspDiagnosticsSignHint"})
vim.fn.sign_define("LspDiagnosticsSignInformation",
                   {texthl = "LspDiagnosticsSignInformation", text = "", numhl = "LspDiagnosticsSignInformation"})

vim.fn.sign_define("Jsj_codeAction", {text="", linehl=false, numhl=false, texthl="MoreMsg"})
