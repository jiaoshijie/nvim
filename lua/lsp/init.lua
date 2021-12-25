-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
-- local nvim_lsp = require('lspconfig')
local lsp_using_list = {
  clangd = "clangd-lsp",
  bashls = "bash-lsp",
  cssls = "css-lsp",
  gopls = "go-lsp",
  html = "html-lsp",
  jsonls = "json-lsp",
  ltex = "latex-lsp",
  -- texlab = "latex-lsp",
  sumneko_lua = "lua-lsp",
  pylsp = "python-lsp",
  -- pyright = "python-lsp",
  -- jedi_language_server = "python-lsp",
  tsserver = "tsserver-lsp",
  vimls = "vim-lsp",
}

local capabilities = vim.lsp.protocol.make_client_capabilities()

for lsp_name, file_name in pairs(lsp_using_list) do
  local lspPconf = require('lsp.' .. file_name)
  lspPconf.on_attach = require('lsp.on_attach')
  -- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
  if lspPconf.capabilities then
    lspPconf.capabilities = require('cmp_nvim_lsp').update_capabilities(lspPconf.capabilities)
  else
    lspPconf.capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
  end
  require'lspconfig'[lsp_name].setup(lspPconf)
end
