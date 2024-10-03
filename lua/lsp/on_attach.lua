local symbols_com = require("lsp.component").on_attach

local on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }
    -- NOTE(lsp-default): omnifunc

    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    -- NOTE(0.10): ctrl-w_d for vim.diagnostic.open_float
    -- NOTE(0.10): [d for vim.diagnostic.goto_prev
    -- NOTE(0.10): ]d for vim.diagnostic.goto_next
    -- `vim.diagnostic.setloclist`: using telescope instead

    -- Mappings.
    -- NOTE(lsp-default): tagfunc
    -- NOTE(lsp-default): ctrl-] -> goto definition
    vim.keymap.set("n", "gd", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "grr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "gri", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "grn", vim.lsp.buf.rename, opts)
    -- NOTE(lsp-default): K -> hover
    vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts)
    -- NOTE(lsp-default): `gq` for format

    vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set("n", "<leader>wl", function()
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

    if client.server_capabilities.codeActionProvider then
        vim.keymap.set("n", "gra", vim.lsp.buf.code_action, opts)
    end

    if client.server_capabilities.documentSymbolProvider then
        symbols_com(client, bufnr)
    end

    -- NOTE: `:h vim.lsp.semantic_tokens.start` `:h lsp-semantic-highlight`
    client.server_capabilities.semanticTokensProvider = nil
end

return on_attach
