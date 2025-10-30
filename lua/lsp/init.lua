local command = vim.api.nvim_create_user_command

-- https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#completionItemKind
-- https://code.visualstudio.com/api/references/icons-in-labels
vim.lsp.protocol.CompletionItemKind = {
    [1]  = "  (Text) ",
    [2]  = "  (Method)",
    [3]  = "  (Function)",
    [4]  = "  (Constructor)",
    [5]  = "  (Field)",
    [6]  = "  (Variable)",
    [7]  = "  (Class)",
    [8]  = "  (Interface)",
    [9]  = "  (Module)",
    [10] = "  (Property)",
    [11] = "  (Unit)",
    [12] = "  (Value)",
    [13] = "  (Enum)",
    [14] = "  (Keyword)",
    [15] = "  (Snippet)",
    [16] = "  (Color)",
    [17] = "  (File)",
    [18] = "  (Reference)",
    [19] = "  (Folder)",
    [20] = "  (EnumMember)",
    [21] = "  (Constant)",
    [22] = "  (Struct)",
    [23] = "  (Event)",
    [24] = "  (Operator)",
    [25] = "  (TypeParameter)",
}

vim.diagnostic.config({
    virtual_text = true,
    virtual_lines = false,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN]  = "",
            [vim.diagnostic.severity.HINT] = "",
            [vim.diagnostic.severity.INFO] = "󰋽",
        }
    },
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
        border = "rounded",
    },
})

-- NOTE: manually update this variable, if adding new lsp server
local configured_lsp_server = {'rust', 'lua', 'sh'}
vim.lsp.enable({ 'lua' })

command("LspEnable", function(opts)
    local server_name = opts.args  -- NOTE: or `opts.fargs`, maybe it doesn't matter at all.
    vim.lsp.enable(server_name, true)
end, {
nargs = 1,
complete = function(_, line)
    local pre_input = vim.split(line, "%s+")[2]
    local keys = {}
    for _, k in ipairs(configured_lsp_server) do
        table.insert(keys, k)
    end
    table.sort(keys)

    if pre_input ~= 0 then
        return vim.tbl_filter(function(val)
            return vim.startswith(val, pre_input)
        end, keys)
    end
    return keys
end,
})
