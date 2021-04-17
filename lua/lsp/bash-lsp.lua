-- npm i -g bash-language-server
require'lspconfig'.bashls.setup{
  on_attach = Lsp_on_attach,
}
