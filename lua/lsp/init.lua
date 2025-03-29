local command = vim.api.nvim_create_user_command

-- https://code.visualstudio.com/api/references/icons-in-labels
vim.lsp.protocol.CompletionItemKind = {
    "  (Text) ",
    "  (Method)",
    "  (Function)",
    "  (Constructor)",
    "  (Field)",
    "  (Variable)",
    "  (Class)",
    "  (Interface)",
    "  (Module)",
    "  (Property)",
    "  (Unit)",
    "  (Value)",
    "  (Enum)",
    "  (Keyword)",
    "  (Snippet)",
    "  (Color)",
    "  (File)",
    "  (Reference)",
    "  (Folder)",
    "  (EnumMember)",
    "  (Constant)",
    "  (Struct)",
    "  (Event)",
    "  (Operator)",
    "  (TypeParameter)",
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
