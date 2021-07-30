-- pip install --user python-lsp-server
-- require('lspconfig').pylsp.setup{
--   on_attach = require'lsp.on_attach',
--   autostart = true,
-- }

require('lspconfig').pyright.setup{
  on_attach = require'lsp.on_attach',
  autostart = true,
}
