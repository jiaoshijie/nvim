-- pip install --user python-language-server
require('lspconfig').pyls.setup{
  on_attach = require'lsp.on_attach',
  autostart = true,
}
