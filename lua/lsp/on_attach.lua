local on_attach = function(client, bufnr)
  vim.lsp.protocol.CompletionItemKind = {
      "  (Text) ",
      "  (Method)",
      "  (Function)",
      "  (Constructor)",
      " ﴲ (Field)",
      "[](Variable)",
      "  (Class)",
      " ﰮ (Interface)",
      "  (Module)",
      " 襁(Property)",
      "  (Unit)",
      "  (Value)",
      " 練(Enum)",
      "  (Keyword)",
      " ﬌ (Snippet)",
      "  (Color)",
      "  (File)",
      "  (Reference)",
      "  (Folder)",
      "  (EnumMember)",
      " ﲀ (Constant)",
      " ﳤ (Struct)",
      "  (Event)",
      "  (Operator)",
      "  (TypeParameter)"
  }

  local signs = {
    {name = "DiagnosticSignError", text = "✗"},
    {name = "DiagnosticSignWarn", text = ""},
    {name = "DiagnosticSignHint", text = ""},
    {name = "DiagnosticSignInfo", text = ""},
  }
  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  -- vim.fn.sign_define("Jsj_codeAction", {text="💡", linehl=false, numhl=false, texthl="MoreMsg"})

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    -- Use a sharp border with `FloatBorder` highlights
    border = "rounded"
  }
  )

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help, {
    -- Use a sharp border with `FloatBorder` highlights
    border = "rounded"
  }
  )

  vim.diagnostic.config{
    virtual_text = true,
    signs = {
      active = signs,
    },
    -- update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      -- focusable = false,
      -- style = "minimal",
      border = "rounded",
      -- source = "always",
      -- header = "",
      -- prefix = "",
    },
  }

  local buf_set_option = vim.api.nvim_buf_set_option

  buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true, buffer=bufnr }
  -- vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end, opts)
  -- vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end, opts)
  -- vim.keymap.set('n', 'gi', function() vim.lsp.buf.implementation() end, opts)
  vim.keymap.set('i', '<C-k>', function() vim.lsp.buf.signature_help() end, opts)
  vim.keymap.set('n', '<leader>ca', function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set('n', '<leader>cr', function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set('n', '<C-k>', function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set('n', '<leader>D', function() vim.lsp.buf.type_definition() end, opts)
  -- vim.keymap.set('n', '<leader>q', function() vim.diagnostic.setloclist() end, opts)
  -- vim.keymap.set('n', '<leader>pa', function() vim.lsp.buf.add_workspace_folder() end, opts)
  -- vim.keymap.set('n', '<leader>pr', function() vim.lsp.buf.remove_workspace_folder() end, opts)
  -- vim.keymap.set('n', '<leader>pl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
  vim.keymap.set('n', '<leader>cee', function() vim.diagnostic.open_float(nil, {source="always"}) end, opts)
  vim.keymap.set('n', '<leader>cep', function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set('n', '<leader>cen', function() vim.diagnostic.goto_next() end, opts)

  -- Set some keybinds conditional on server capabilities
  if client.server_capabilities.documentFormattingProvider then
    vim.keymap.set("n", "<leader>c=", function() vim.lsp.buf.format({async = true}) end, opts)
  end
  if client.server_capabilities.documentRangeFormattingProvider then
    vim.keymap.set("v", "<leader>c=", function() vim.lsp.buf.range_formatting() end, opts)
  end

  -- Set autocommands conditional on server_capabilities
  if client.server_capabilities.documentHighlightProvider then
    local group = vim.api.nvim_create_augroup("lsp_document_highlight", {clear = true})
    vim.api.nvim_create_autocmd("CursorHold", {
      group = group,
      callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd("CursorMoved", {
      group = group,
      callback = vim.lsp.buf.clear_references,
    })
  end

  -- NOTICE: Telescope plugin
  vim.keymap.set('n', '<leader>cf', function() require("telescope.builtin").lsp_document_symbols() end, opts)
  vim.keymap.set('n', '<leader>cF', function() require("telescope.builtin").lsp_dynamic_workspace_symbols() end, opts)
  vim.keymap.set('n', '<leader>cea', function() require("telescope.builtin").diagnostics({bufnr = 0}) end, opts)
  vim.keymap.set('n', '<leader>ceA', function() require("telescope.builtin").diagnostics() end, opts)
  vim.keymap.set('n', 'gr', function() require("telescope.builtin").lsp_references() end, opts)
  vim.keymap.set('n', 'gd', function() require("telescope.builtin").lsp_definitions() end, opts)
  vim.keymap.set('n', 'gI', function() require("telescope.builtin").lsp_implementations() end, opts)
end

return on_attach
