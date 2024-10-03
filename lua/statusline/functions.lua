local _M = {}
local fn = vim.fn
local dia, dia_s = vim.diagnostic, vim.diagnostic.severity
local fmt = string.format

local lsp_com = require("lsp.component").lsp_component

local modes = {
    ["?"] = { text = "", state = "inactive" },
    ["n"] = { text = " NORMAL ", state = "normal" },
    ["i"] = { text = " INSERT ", state = "insert" },
    ["R"] = { text = " REPLACE ", state = "replace" },
    ["v"] = { text = " VISUAL ", state = "visual" },
    ["V"] = { text = " V-LINE ", state = "visual" },
    [""] = { text = " V-BLOCK ", state = "visual" },
    ["c"] = { text = " COMMAND ", state = "command" },
    ["s"] = { text = " SELECT ", state = "visual" },
    ["S"] = { text = " S-LINE ", state = "visual" },
    [""] = { text = " S-BLOCK ", state = "visual" },
    ["t"] = { text = " TERMINAL ", state = "command" },
}

local is_active = function()
    return vim.g.statusline_winid == fn.win_getid()
end

_M.get_Block = function()
    return {
        text = is_active() and "█" or "",
        -- text = is_active() and "▊" or "",
        state = is_active() and "Block" or "",
    }
end

_M.get_Icon = function()
    return {
        text = is_active() and "  " or "",
        state = is_active() and "Icon" or "",
    }
end


_M.get_mode = function()
    return is_active() and modes[fn.mode()] or modes["?"]
end


_M.get_spell = function()
    return {
        text = vim.wo.spell and is_active() and fmt(" SPELL[%s] ", string.upper(vim.bo.spelllang)) or "",
        state = "spell",
    }
end

_M.get_filename = function()
    return {
        text = is_active() and " %t " or " %F ",
        state = is_active() and "filename" or "inactive",
    }
end

_M.winbar_get_filename = function()
    return {
        text = is_active() and "▊" .. " %f " or " %F ",
        state = is_active() and "filename" or "inactive",
    }
end

_M.get_filepos = function()
    return {
        state = _M.get_mode().state,
        text = is_active() and " %p%%  %v:%l/%L " or " %v:%l/%L ",
    }
end

_M.get_fileinfo = function()
    return {
        state = "fileinfo",
        text = "%m%h%r",
    }
end

_M.get_space_tab = function()
    local sot = vim.bo.expandtab and " Space:" .. vim.bo.shiftwidth or " Tab:" .. vim.bo.tabstop
    return {
        state = is_active() and "space_or_tab" or "inactive",
        text = is_active() and sot .. " " or "",
    }
end

_M.get_filetype = function()
    return {
        state = is_active() and "filetype" or "inactive",
        -- text = is_active() and ' %Y ' or '',
        text = is_active() and " %{&ft}" or "",
    }
end

_M.get_fileformat = function()
    return {
        state = is_active() and "fileformat" or "inactive",
        text = is_active() and " %{&fenc?&fenc:&enc}[%{&ff}] " or "",
    }
end

local get_diagnostic = function(prefix, severity)
    local count = #dia.get(0, { severity = severity })
    if count < 1 then
        return ""
    end
    return fmt(" %s:%d ", prefix, count)
end

_M.get_lsp_com = function()
    return {
        state = is_active() and "component" or "inactive",
        text = is_active() and lsp_com() or "",
    }
end

_M.get_lsp_information = function()
    return {
        text = get_diagnostic("I", dia_s.INFO),
        state = "information",
    }
end

_M.get_lsp_hint = function()
    return {
        text = get_diagnostic("H", dia_s.HINT),
        state = "hint",
    }
end

_M.get_lsp_warning = function()
    return {
        text = get_diagnostic("W", dia_s.WARN),
        state = "warning",
    }
end

_M.get_lsp_error = function()
    return {
        text = get_diagnostic("E", dia_s.ERROR),
        state = "error",
    }
end

_M.git_branch = function()
    local branch = vim.b.Jsj_git_branch and "  " .. vim.b.Jsj_git_branch .. " " or ""
    return {
        text = is_active() and branch or "", -- e0a0
        state = "branch",
    }
end

return _M
