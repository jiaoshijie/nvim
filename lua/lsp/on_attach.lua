local symbols_com = require("lsp.component").on_attach
local keymap = vim.keymap.set

local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  -- TO GET ALL PROVIDERs that lsp support, using `lua =vim.lsp.get_clients()[1].server_capabilities`
  -- Completion
  if client.server_capabilities.completionProvider then
    -- NOTE(lsp-default): omnifunc
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
  -- NOTE(lsp-default): tagfunc
  -- NOTE(lsp-default): ctrl-] -> goto definition
  keymap("n", "gd", vim.lsp.buf.type_definition, opts)
  keymap("n", "gD", vim.lsp.buf.declaration, opts)
  -- NOTE(lsp-default): grr -> references
  keymap("n", "gri", vim.lsp.buf.implementation, opts)
  -- NOTE(lsp-default): grn -> rename
  -- NOTE(lsp-default): K -> hover
  keymap("i", "<C-k>", vim.lsp.buf.signature_help, opts)
  -- NOTE(lsp-default): `gq` for format
  -- NOTE(lsp-default): `gra` for code action

  keymap("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
  keymap("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
  keymap("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts)

  local lsp_on_attach = vim.api.nvim_create_augroup("jsj_lsp_on_attach_" .. bufnr, { clear = true })

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

  if client.server_capabilities.documentSymbolProvider then
    -- this is in my config files
    symbols_com(client, bufnr)
  end

  -- NOTE: `:h vim.lsp.semantic_tokens.start` `:h lsp-semantic-highlight`
  client.server_capabilities.semanticTokensProvider = nil
end

return on_attach
