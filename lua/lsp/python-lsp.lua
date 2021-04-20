-- npm i -g pyright
require('lspconfig').pyright.setup{
  on_attach = require'lsp.on_attach',
}
