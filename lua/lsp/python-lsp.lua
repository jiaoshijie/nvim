require('lspconfig').pylsp.setup{
  -- pipx install 'python-lsp-server[all]'
  on_attach = require'lsp.on_attach',
  autostart = true,
}

-- require'lspconfig'.jedi_language_server.setup{
--   -- sudo pacman -S jedi-language-server
--   on_attach = require'lsp.on_attach',
--   autostart = true,
-- }

-- require('lspconfig').pyright.setup{
--   -- sudo pacman -S pyright
--   on_attach = require'lsp.on_attach',
--   autostart = true,
-- }
