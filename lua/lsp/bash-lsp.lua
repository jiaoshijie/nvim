-- npm i -g bash-language-server
require'lspconfig'.bashls.setup{
  on_attach = require'lsp.on_attach',
}
