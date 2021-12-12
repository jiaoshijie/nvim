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

vim.fn.sign_define("DiagnosticSignError",
                   {texthl = "DiagnosticSignError", text = "✗", numhl = "DiagnosticSignError"})
vim.fn.sign_define("DiagnosticSignWarn",
                   {texthl = "DiagnosticSignWarn", text = "", numhl = "DiagnosticSignWarn"})
vim.fn.sign_define("DiagnosticSignHint",
                   {texthl = "DiagnosticSignHint", text = "", numhl = "DiagnosticSignHint"})
vim.fn.sign_define("DiagnosticSignInfo",
                   {texthl = "DiagnosticSignInfo", text = "", numhl = "DiagnosticSignInfo"})

-- vim.fn.sign_define("Jsj_codeAction", {text="", linehl=false, numhl=false, texthl="MoreMsg"})
vim.fn.sign_define('LightBulbSign', { text = "💡", texthl = false, linehl=false, numhl=false })
