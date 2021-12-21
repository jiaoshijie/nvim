local null_ls = require("null-ls")

local sources = {
  null_ls.builtins.formatting.stylua.with({
      extra_args = { "--config-path", vim.fn.expand("~/.config/nvim/lua/lsp/null-ls/stylua.toml") },
  }),
}

null_ls.setup{
  sources = sources,
  on_attach = require('lsp.on_attach'),
}
