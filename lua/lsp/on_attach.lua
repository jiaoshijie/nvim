local symbols_com = require("lsp.component").on_attach
local keymap = vim.keymap.set

local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  -- Completion
  if client.supports_method('textDocument/completion') then
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'
    vim.lsp.completion.enable(true, client.id, bufnr, {autotrigger = false})
    keymap({'i', 's'}, '<C-l>', function()
      if vim.snippet.active({direction = 1}) then
        vim.snippet.jump(1)
      end
    end, opts)
    keymap({'i', 's'}, '<C-b>', function()
      if vim.snippet.active({direction = -1}) then
        vim.snippet.jump(-1)
      end
    end, opts)
  end

  -- Mappings.
  keymap("n", "<leader>D", vim.lsp.buf.type_definition, opts)
  keymap("n", "gd", vim.lsp.buf.definition, opts)
  keymap("n", "gD", vim.lsp.buf.declaration, opts)
  keymap("n", "gr", vim.lsp.buf.references, opts)
  keymap("n", "gi", vim.lsp.buf.implementation, opts)
  keymap("n", "<leader>cr", vim.lsp.buf.rename, opts)
  keymap("n", "<C-k>", vim.lsp.buf.hover, opts)
  keymap("i", "<C-k>", vim.lsp.buf.signature_help, opts)

  keymap("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
  keymap("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
  keymap("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts)

  local lsp_on_attach = vim.api.nvim_create_augroup("jsj_lsp_on_attach_" .. bufnr, { clear = true })

  if client.server_capabilities.documentFormattingProvider then
    keymap("n", "<leader>=", function()
      vim.lsp.buf.format({ async = true })
    end, opts)
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
    keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  end

  if client.server_capabilities.documentSymbolProvider then
    symbols_com(client, bufnr)
  end

  -- NOTE: `:h vim.lsp.semantic_tokens.start` `:h lsp-semantic-highlight`
  client.server_capabilities.semanticTokensProvider = nil
end

return on_attach
