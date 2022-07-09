local symbols_com = require("lsp.component").on_attach
local codeAction = require("lsp.codeAction").on_attach

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

  if client.server_capabilities.documentFormattingProvider then
    vim.keymap.set("n", "<leader>c=", function()
      vim.lsp.buf.format({ async = true })
    end, opts)
  end
  if client.server_capabilities.documentRangeFormattingProvider then
    vim.keymap.set("v", "<leader>c=", vim.lsp.buf.range_formatting, opts)
  end

  if client.server_capabilities.documentHighlightProvider then
    local group = vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
    vim.api.nvim_create_autocmd("CursorHold", {
      group = group,
      callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd("CursorMoved", {
      group = group,
      callback = vim.lsp.buf.clear_references,
    })
  end

  if client.server_capabilities.codeActionProvider then
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    codeAction(client, bufnr)
  end

  if client.server_capabilities.documentSymbolProvider then
    symbols_com(client, bufnr)
  end

  -- NOTICE: Telescope plugin
  vim.keymap.set("n", "<leader>cf", require("telescope.builtin").lsp_document_symbols, opts)
  vim.keymap.set("n", "<leader>cF", require("telescope.builtin").lsp_dynamic_workspace_symbols, opts)
end

return on_attach
