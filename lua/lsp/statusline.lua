local _M = {}
-- https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#symbolKind
-- https://code.visualstudio.com/api/references/icons-in-labels
local symbol_kind2icon = {
    [1]  = " ", -- File
    [2]  = " ", -- Module
    [3]  = " ", -- Namespace
    [4]  = " ", -- Package
    [5]  = " ", -- Class
    [6]  = " ", -- Method
    [7]  = " ", -- Property
    [8]  = " ", -- Field
    [9]  = " ", -- Constructor
    [10] = " ", -- Enum
    [11] = " ", -- Interface
    [12] = " ", -- Function
    [13] = " ", -- Variable
    [14] = " ", -- Constant
    [15] = " ", -- String
    [16] = "󰎠 ", -- Number
    [17] = " ", -- Boolean
    [18] = " ", -- Array
    [19] = " ", -- Object
    [20] = " ", -- Key
    [21] = "󰟢 ", -- Null
    [22] = " ", -- EnumMember
    [23] = " ", -- Struct
    [24] = " ", -- Event
    [25] = " ", -- Operator
    [26] = " ", -- TypeParameter
}

--- @class Range https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#range

--- @class FineTunedSyms
--- @field idx number
--- @field name string
--- @field kind number
--- @field range Range

--- @type FineTunedSyms[]
--- @index the bufnr
local doc_syms_map = {}
local statusline_ctx = {}

local in_range = function(cur_pos, range)
    local line, char = cur_pos[1] - 1, cur_pos[2]
    local s, e = range["start"], range["end"]

    if line < s.line then
        return -1
    elseif line > e.line then
        return 1
    end

    if line == s.line and char < s.character then
        return -1
    elseif line == e.line and char > e.character then
        return 1
    end

    return 0
end

-- recusively finetune the document symbols
local function finetune_syms(doc_syms)
    if not doc_syms then return nil end

    local finetuned_syms = {}
    for i, v in ipairs(doc_syms) do
        if v.range then
            table.insert(finetuned_syms, {
                idx = i,
                name = v.name,
                kind = v.kind,
                range = v.range,
                children = finetune_syms(v.children)
            })
        else
            -- NOTE: `SymbolInformation` should not be used to infer a hierarchy
            return nil
        end
    end

    return finetuned_syms
end

local document_symbol_cb = function(bufnr, doc_syms)
    doc_syms_map[bufnr] = finetune_syms(doc_syms)
end

local document_symbol_request = function(client_id, bufnr)
    vim.lsp.buf_request_all(vim.fn.bufnr(), "textDocument/documentSymbol", {
        textDocument =  vim.lsp.util.make_text_document_params()
    }, function(resp)
        if resp and resp[client_id] and resp[client_id].result
            and #resp[client_id].result > 0 then
            document_symbol_cb(bufnr, resp[client_id].result)
        end
    end)
end

local update_statusline = function(bufnr)
    if not doc_syms_map[bufnr] then
        return
    end
    local cur_pos = vim.api.nvim_win_get_cursor(0)
    local old = statusline_ctx[bufnr] or {}
    local new = {}
    local iter = doc_syms_map[bufnr]

    for _, ctx in ipairs(old) do
        if in_range(cur_pos, ctx.range) == 0
            and iter and iter[ctx.idx]
            and ctx.name == iter[ctx.idx].name
            and ctx.kind == iter[ctx.idx].kind
        then
            table.insert(new, iter[ctx.idx])
            iter = iter[ctx.idx].children
        end
    end

    while iter do
        local finished = true
        local l, r = 1, #iter

        while l <= r do
            local m = math.floor((l + r) / 2)
            local cmp = in_range(cur_pos, iter[m].range)

            if cmp == -1 then
                r = m - 1
            elseif cmp == 1 then
                l = m + 1
            else
                table.insert(new, iter[m])
                iter = iter[m].children
                finished = false
                break
            end
        end

        if finished then break end
    end

    statusline_ctx[bufnr] = new
end

_M.on_attach = function(client_id, bufnr)
    if doc_syms_map[bufnr] then return end

    local lsp_statusline_augroup = vim.api.nvim_create_augroup("JSJ_lsp_statusline_" .. bufnr, { clear = true })

    vim.api.nvim_create_autocmd({ "InsertLeave" }, {
        group = lsp_statusline_augroup,
        buffer = bufnr,
        callback = function()
            document_symbol_request(client_id, bufnr)
        end,
    })

    vim.api.nvim_create_autocmd({ "CursorMoved" }, {
        group = lsp_statusline_augroup,
        buffer = bufnr,
        callback = function()
            update_statusline(bufnr)
        end,
    })

    vim.api.nvim_create_autocmd({ "BufDelete", "BufWipeout" }, {
        group = lsp_statusline_augroup,
        buffer = bufnr,
        callback = function()
            doc_syms_map[bufnr] = nil
            statusline_ctx[bufnr] = nil
        end,
    })

    document_symbol_request(client_id, bufnr)
end


_M.statusline = function()
    local ctx = statusline_ctx[vim.api.nvim_get_current_buf()]
    if not ctx then return end
    local text = ""

    for _, v in ipairs(ctx) do
        text = text .. '  ' .. symbol_kind2icon[v.kind] .. v.name
    end

    return text
end

return _M
