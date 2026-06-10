local _M = {}
local fmt = string.format
local kit = require("statusline.kit")

local opt = {
    statusline = {
        [1] = kit.icon_block,
        [2] = kit.icon_neovim,
        [3] = kit.mode,
        [4] = kit.git_branch,
        [5] = kit.opt_spell,
        [6] = kit.file_type,
        [7] = "%<",
        [8] = kit.lsp_symbols,
        [9] = "%=",
        [10] = kit.lsp_info,
        [11] = kit.lsp_warn,
        [12] = kit.lsp_error,
        [13] = kit.file_indent,
        [14] = kit.file_format,
        [15] = kit.file_pos,
    },
    winbar = {
        [1] = "%<",
        [2] = kit.file_name,
        [3] = kit.file_info,
    }
}

local hl_cb = function(item)
    if type(item) == "string" then
        return item
    end
    local item_obj = item()
    local hl_group = fmt("JSJ_statusline_%s", item_obj.hlname)
    return fmt("%%#%s#%s%%*", hl_group, item_obj.text)
end

_M.statusline = function()
    return table.concat(vim.tbl_map(hl_cb, opt.statusline))
end

_M.winbar = function()
    return table.concat(vim.tbl_map(hl_cb, opt.winbar))
end

_M.setup = function()
    require("statusline.colors").setup_statusline_hl_groups()

    vim.o.showmode = false  -- disable showing -- INSERT --, etc.
    vim.o.statusline = [[%!luaeval('require("statusline").statusline()')]]

    vim.o.winbar = [[%!luaeval('require("statusline").winbar()')]]
end

return _M
