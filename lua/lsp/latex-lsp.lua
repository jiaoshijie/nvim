-- sudo pacman -S texlab
require'lspconfig'.texlab.setup{
  on_attach = Lsp_on_attach,
}
