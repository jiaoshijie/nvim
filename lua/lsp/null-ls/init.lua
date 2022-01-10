local null_ls = require("null-ls")

local stylua_extra_args_cp = vim.fn.filereadable("stylua.toml") == 1 and 'stylua.toml' or vim.fn.expand("~/.config/nvim/lua/lsp/null-ls/stylua.toml")

local sources = {
  null_ls.builtins.formatting.stylua.with({
      extra_args = { "--config-path", stylua_extra_args_cp },
  }),
}

null_ls.setup{
  sources = sources,
  on_attach = require('lsp.on_attach'),
}
