local on_attach = function(client, bufnr)
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    -- Use a sharp border with `FloatBorder` highlights
    border = "single"
  }
  )

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help, {
    -- Use a sharp border with `FloatBorder` highlights
    border = "single"
  }
  )

  local buf_set_keymap = vim.api.nvim_buf_set_keymap
  local buf_set_option = vim.api.nvim_buf_set_option

  buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }
  -- buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  -- buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  -- buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap(bufnr, 'i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  buf_set_keymap(bufnr, 'n', '<leader>cr', ':<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  -- buf_set_keymap(bufnr, 'n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap(bufnr, 'n', '<leader>pa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap(bufnr, 'n', '<leader>pr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap(bufnr, 'n', '<leader>pl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap(bufnr, 'n', '<leader>cee', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap(bufnr, 'n', '<leader>cep', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap(bufnr, 'n', '<leader>cen', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap(bufnr, "n", "<leader>c=", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end
  if client.resolved_capabilities.document_range_formatting then
    buf_set_keymap(bufnr, "v", "<leader>c=", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      set updatetime=500
      hi! link LspReferenceRead Jsj_LspDochighlight
      hi! link LspReferenceText Jsj_LspDochighlight
      hi! link LspReferenceWrite Jsj_LspDochighlight
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end

  -- code action
  -- vim.api.nvim_exec([[
  --   augroup lsp_code_action
  --     autocmd! * <buffer>
  --     autocmd CursorHold,CursorHoldI <buffer> lua require('lsp.lsp-utils').code_action_listener()
  --     autocmd CursorMoved <buffer> lua require('lsp.lsp-utils').remove_code_action()
  --   augroup END
  -- ]], false)

  vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb{sign={enabled=true, priority=10,},float={enabled=false}, virtual_text={enabled=false}, status_text={enabled=false}}]]

  -- NOTICE: Telescope plugin
  buf_set_keymap(bufnr, 'n', '<leader>cf', ':lua require("telescope.builtin").lsp_document_symbols()<cr>', opts)
  -- buf_set_map(bufnr, 'n', '<leader>cF', ':lua require("telescope.builtin").lsp_workspace_symbols()<cr>', opts)
  buf_set_keymap(bufnr, 'n', '<leader>cea', ':Telescope lsp_document_diagnostics<cr>', opts)
  buf_set_keymap(bufnr, 'n', '<leader>ceA', ':Telescope lsp_workspace_diagnostics<cr>', opts)
  buf_set_keymap(bufnr, 'n', 'gr', ':Telescope lsp_references<cr>', opts)
  buf_set_keymap(bufnr, 'n', 'gd', ':Telescope lsp_definitions<cr>', opts)
  buf_set_keymap(bufnr, 'n', 'gI', ':Telescope lsp_implementations<cr>', opts)
  buf_set_keymap(bufnr, 'n', '<leader>ca', ':Telescope lsp_code_actions<cr>', opts)
  -- buf_set_keymap(bufnr, 'n', '<leader>cA', ':Telescope lsp_range_code_actions<cr>', opts)


end

return on_attach
