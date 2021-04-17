-- npm i -g pyright
require('lspconfig').pyright.setup{
  on_attach = Lsp_on_attach,
}
