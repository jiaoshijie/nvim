require('lspconfig').pylsp.setup{
  -- cmd = { "pyls" },  -- sudo pacman -S python-language-server
  -- sudo pacman -S python-lsp-server
  on_attach = require'lsp.on_attach',
  autostart = true,
}

-- require'lspconfig'.jedi_language_server.setup{
  -- sudo pacman -S jedi-language-server
--   on_attach = require'lsp.on_attach',
--   autostart = true,
-- }

-- require('lspconfig').pyright.setup{
  -- sudo pacman -S pyright
--   on_attach = require'lsp.on_attach',
--   autostart = true,
-- }
