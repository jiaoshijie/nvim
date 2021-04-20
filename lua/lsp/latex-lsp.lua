-- sudo pacman -S texlab
require'lspconfig'.texlab.setup{
  on_attach = require'lsp.on_attach',
}
