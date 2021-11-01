-- require'lspconfig'.texlab.setup{
--   on_attach = require'lsp.on_attach',
--   autostart = false;
-- }

require'lspconfig'.ltex.setup{
  on_attach = require'lsp.on_attach',
  autostart = false;
}
