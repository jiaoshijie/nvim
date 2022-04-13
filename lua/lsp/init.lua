-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
local lsp_using_list = {
  clangd = "clangd-lsp",  -- pacman: clang
  bashls = "bash-lsp",  -- pacman: bash-language-server
  html = "html-lsp",  -- npm: vscode-langservers-extracted(html css json)
  cssls = "css-lsp",
  jsonls = "json-lsp",
  gopls = "go-lsp",  -- pacman: gopls
  -- ltex = "latex-lsp",
  texlab = "latex-lsp",  -- pacman: texlab
  sumneko_lua = "lua-lsp",  -- pacman: lua-language-server
  pylsp = "python-lsp",  -- pipx install 'python-lsp-server[all]'
  -- pyright = "python-lsp",  -- npm: pyright
  -- jedi_language_server = "python-lsp",
  tsserver = "tsserver-lsp",  -- npm: typescript typescript-language-server
  -- vimls = "vim-lsp",  -- npm: vim-language-server
  rust_analyzer = "rust-lsp",  -- pacman: rust_analyzer
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
  require('lspconfig')[lsp_name].setup(lspPconf)
end
