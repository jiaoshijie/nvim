return function(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }
    -- NOTE(lsp-default): omnifunc

    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    -- NOTE(0.10): ctrl-w_d for vim.diagnostic.open_float
    -- NOTE(0.10): [d for vim.diagnostic.goto_prev
    -- NOTE(0.10): ]d for vim.diagnostic.goto_next
    -- `vim.diagnostic.setloclist` or `vim.diagnostic.setqflist`

    -- Mappings: h lsp-default
    -- NOTE(lsp-default): tagfunc
    -- NOTE(lsp-default): ctrl-] -> goto definition
    vim.keymap.set("n", "gd", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    -- NOTE(lsp-default): grr -> references
    -- NOTE(lsp-default): gri -> implementation
    -- NOTE(lsp-default): grn -> rename
    -- NOTE(lsp-default): gra -> code_action
    -- NOTE(lsp-default): K -> hover
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover({
        border = "rounded"
    }) end, opts)
    vim.keymap.set("i", "<C-k>", function() vim.lsp.buf.signature_help({
        border = "rounded"
    }) end, opts)
    -- NOTE(lsp-default): `gq` for format

    vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set("n", "<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)

    if client.server_capabilities.documentSymbolProvider then
        require("lsp.statusline").on_attach(client.id, bufnr)
    end

    if client.server_capabilities.completionProvider then
        vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = false })
    end

    if client.server_capabilities.documentHighlightProvider then
        vim.keymap.set("n", "<leader>n", vim.lsp.buf.document_highlight, opts)
        vim.keymap.set("n", "<leader>N", vim.lsp.buf.clear_references, opts)
    end

    -- NOTE: `:h vim.lsp.semantic_tokens.start` `:h lsp-semantic-highlight`
    client.server_capabilities.semanticTokensProvider = nil
end
