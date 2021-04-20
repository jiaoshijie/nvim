local on_attach = function(client, bufnr)
  local buf_set_keymap = vim.api.nvim_buf_set_keymap
  local buf_set_option = vim.api.nvim_buf_set_option

  buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap(bufnr, 'n', 'K', ':Lspsaga hover_doc<CR>', opts)
  buf_set_keymap(bufnr, 'n', 'ca', ':Lspsaga code_action<CR>', opts)
  -- buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap(bufnr, 'n', '<space>rn', ':Lspsaga rename<CR>', opts)
  buf_set_keymap(bufnr, 'n', 'gee', ':Lspsaga show_cursor_diagnostics<CR>', opts)
  buf_set_keymap(bufnr, 'n', 'gep', ':Lspsaga diagnostic_jump_prev<CR>', opts)
  buf_set_keymap(bufnr, 'n', 'gen', ':Lspsaga diagnostic_jump_next<CR>', opts)
  -- buf_set_keymap(bufnr, 'n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  -- buf_set_keymap(bufnr, 'n', '<space>pa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  -- buf_set_keymap(bufnr, 'n', '<space>pr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  -- buf_set_keymap(bufnr, 'n', '<space>pl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)

  -- scroll down hover doc or scroll in definition preview
  buf_set_keymap(bufnr, 'n', '<C-f>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>', opts)
  -- scroll up hover doc
  buf_set_keymap(bufnr, 'n', '<C-b>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap(bufnr, "n", "<space>g=", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end
  if client.resolved_capabilities.document_range_formatting then
    buf_set_keymap(bufnr, "v", "<space>g=", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      set updatetime=1000
      hi LspReferenceRead guibg=#5C6370
      hi LspReferenceText guibg=#5C6370
      hi LspReferenceWrite guibg=#5C6370
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
end

return on_attach
