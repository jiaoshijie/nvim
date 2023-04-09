local symbols_com = require("lsp.component").on_attach

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  local opts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.hover, opts)
  vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts)

  vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts)

  vim.keymap.set("n", "<leader>ee", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "<leader>ep", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "<leader>en", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "<leader>eq", vim.diagnostic.setloclist, opts)

  local lsp_on_attach = vim.api.nvim_create_augroup("lsp_on_attach", { clear = true })

  if client.server_capabilities.documentFormattingProvider then
    vim.keymap.set("n", "<leader>=", function()
      vim.lsp.buf.format({ async = true })
    end, opts)
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = lsp_on_attach,
      buffer = bufnr,
      callback = function() vim.lsp.buf.format({ async = false }) end,
    })
  end

  if client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_create_autocmd("CursorHold", {
      group = lsp_on_attach,
      buffer = bufnr,
      callback = function() vim.lsp.buf.document_highlight() end,
    })
    vim.api.nvim_create_autocmd("CursorMoved", {
      group = lsp_on_attach,
      buffer = bufnr,
      callback = function() vim.lsp.buf.clear_references() end,
    })
  end

  if client.server_capabilities.codeActionProvider then
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  end

  if client.server_capabilities.documentSymbolProvider then
    symbols_com(client, bufnr)
  end

  -- NOTE: `:h vim.lsp.semantic_tokens.start` `:h lsp-semantic-highlight`
  client.server_capabilities.semanticTokensProvider = nil
end

return on_attach
