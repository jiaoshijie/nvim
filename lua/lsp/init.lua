vim.lsp.protocol.CompletionItemKind = {
  "  (Text) ",
  "  (Method)",
  "  (Function)",
  "  (Constructor)",
  " ﰠ (Field)",
  "  (Variable)",
  " ﴯ (Class)",
  "  (Interface)",
  "  (Module)",
  " ﰠ (Property)",
  "  (Unit)",
  "  (Value)",
  "  (Enum)",
  "  (Keyword)",
  "  (Snippet)",
  "  (Color)",
  "  (File)",
  "  (Reference)",
  "  (Folder)",
  "  (EnumMember)",
  "  (Constant)",
  "  (Struct)",
  "  (Event)",
  "  (Operator)",
  "  (TypeParameter)",
}

local signs = {
  { name = "DiagnosticSignError", text = "✗" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = "כֿ" },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  -- Use a sharp border with `FloatBorder` highlights
  border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  -- Use a sharp border with `FloatBorder` highlights
  border = "rounded",
})

vim.diagnostic.config({
  virtual_text = true,
  signs = {
    active = signs,
  },
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = {
    border = "rounded",
  },
})

local lsp_using_list = {
  sumneko_lua = "lua-lsp", -- pacman: lua-language-server
  clangd = "clangd-lsp", -- pacman: clang
  gopls = "go-lsp", -- pacman: gopls
  rust_analyzer = "rust-lsp", -- pacman: rust_analyzer
  pyright = "python-lsp", -- npm or pacman: pyright
  bashls = "bash-lsp",  -- pacman: bash-language-server shellcheck
}

require("lsp.codeAction").setup()

for lsp_name, file_name in pairs(lsp_using_list) do
  local lspPconf = require("lsp." .. file_name)
  lspPconf.on_attach = require("lsp.on_attach")
  require("lspconfig")[lsp_name].setup(lspPconf)
end
