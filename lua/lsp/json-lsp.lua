-- npm install -g vscode-json-languageserver
require'lspconfig'.jsonls.setup {
  commands = {
    Format = {
      function()
        vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
      end
    }
  },
  root_dir = vim.loop.cwd,
  on_attach = require'lsp.on_attach',
}
