local null_ls = require("null-ls")

local sources = {
  null_ls.builtins.formatting.stylua.with({
      extra_args = { "--config-path", vim.fn.expand("~/.config/nvim/lua/lsp/null-ls/stylua.toml") },
  }),
}

null_ls.config({sources = sources})

require("lspconfig")["null-ls"].setup({
    -- see the nvim-lspconfig documentation for available configuration options
    on_attach = require('lsp.on_attach')
})
