local _M = {}
local fn = vim.fn
local dia, dia_s = vim.diagnostic, vim.diagnostic.severity
local fmt = string.format

local lsp_statusline = require("lsp.statusline").statusline
local nc_hl = "NC_inactive"

local com_statusline, com_severity, signal_msg = nil, nil, nil
local com_ok, com = pcall(require, "compile")
if com_ok then
    com_statusline = com.statusline
    com_severity = require("compile.defs").Severity
    signal_msg = require("compile.defs").signal_msg
end

local modes = {
    ["?"] = { text = "", hlname = nc_hl },
    ["n"] = { text = " NORMAL ", hlname = "mode_normal" },
    ["i"] = { text = " INSERT ", hlname = "mode_insert" },
    ["R"] = { text = " REPLACE ", hlname = "mode_replace" },
    ["v"] = { text = " VISUAL ", hlname = "mode_visual" },
    ["V"] = { text = " V-LINE ", hlname = "mode_visual" },
    [""] = { text = " V-BLOCK ", hlname = "mode_visual" },
    ["c"] = { text = " COMMAND ", hlname = "mode_command" },
    ["s"] = { text = " SELECT ", hlname = "mode_visual" },
    ["S"] = { text = " S-LINE ", hlname = "mode_visual" },
    [""] = { text = " S-BLOCK ", hlname = "mode_visual" },
    ["t"] = { text = " TERMINAL ", hlname = "mode_command" },
}

local is_active = function()
    return vim.g.statusline_winid == fn.win_getid()
end

_M.icon_block = function()
    return {
        text = is_active() and "█" or "",
        hlname = is_active() and "icon_block" or nc_hl,
    }
end

_M.icon_neovim = function()
    return {
        text = is_active() and "  " or "",
        hlname = is_active() and "icon_neovim" or nc_hl,
    }
end


_M.mode = function()
    return is_active() and modes[fn.mode()] or modes["?"]
end


_M.opt_spell = function()
    return {
        text = vim.wo.spell and is_active() and fmt(" SPELL[%s] ", string.upper(vim.bo.spelllang)) or "",
        hlname = "opt_spell",
    }
end

_M.file_name = function()
    return {
        text = is_active() and "▊" .. " %f " or " %F ",
        hlname = is_active() and "file_name" or nc_hl,
    }
end

_M.file_pos = function()
    return {
        hlname = _M.mode().hlname,
        text = is_active() and " %p%% ≡ %v:%l/%L " or " %v:%l/%L ",
    }
end

function _G.jsj_statusline_winfixbuf()
  return vim.wo.winfixbuf and "[WFB]" or ""
end

_M.file_info = function()
    return {
        hlname = "file_info",
        text = "%m%h%r%{v:lua.jsj_statusline_winfixbuf()}",
    }
end

_M.file_indent = function()
    local sot = vim.bo.expandtab and " S:" .. vim.bo.shiftwidth or " T:" .. vim.bo.tabstop
    return {
        hlname = is_active() and "file_indent" or nc_hl,
        text = is_active() and sot .. " " or "",
    }
end

_M.file_type = function()
    return {
        hlname = is_active() and "file_type" or nc_hl,
        -- text = is_active() and ' %Y ' or '',
        text = is_active() and " %{&ft}" or "",
    }
end

_M.file_format = function()
    return {
        hlname = is_active() and "file_format" or nc_hl,
        text = is_active() and " %{&fenc!=''?&fenc:&enc}[%{&ff}] " or "",
    }
end

local get_diagnostic = function(prefix, s0, s1)
    local count = #dia.get(0, { severity = s0 })

    if s1 then count = count + #dia.get(0, { severity = s1 }) end

    if count < 1 then
        return ""
    end
    return fmt(" %s:%d ", prefix, count)
end

_M.lsp_symbols = function()
    return {
        hlname = is_active() and "lsp_symbols" or nc_hl,
        text = is_active() and lsp_statusline() or "",
    }
end

_M.lsp_info = function()
    return {
        text = get_diagnostic("I", dia_s.INFO, dia_s.HINT),
        hlname = "lsp_info",
    }
end

_M.lsp_warn = function()
    return {
        text = get_diagnostic("W", dia_s.WARN),
        hlname = "lsp_warn",
    }
end

_M.lsp_error = function()
    return {
        text = get_diagnostic("E", dia_s.ERROR),
        hlname = "lsp_error",
    }
end

local git_branch = function()
    if not is_active() or vim.g.loaded_fugitive ~= 1 then return "" end
    local branch = vim.fn['FugitiveStatusline']()
    return #branch > 0 and fmt("  %s ", branch:sub(6, -3)) or ""
end

_M.git_branch = function()
    return {
        text = git_branch(),
        hlname = "git_branch",
    }
end

local compilation_state = function(ret_code)
    if ret_code == false then return "" end

    assert(signal_msg)

    if ret_code == nil then
        return fmt("%%#CompileLuaWarning#run%%* ")
    end

    if ret_code == 0 then
        return fmt("%%#CompileLuaInfo#exit(0)%%* ")
    end

    local msg = "exit"
    if ret_code > 128 and signal_msg[ret_code - 128] then
        msg = "signal"
        ret_code = ret_code - 128
    end

    return fmt("%%#CompileLuaError#%s(%d)%%* ", msg, ret_code)
end

_M.compilation_info = function()
    if not com_statusline or not com_severity then return "" end

    local stat = com_statusline(vim.g.statusline_winid)
    if not stat then return "" end

    local state = compilation_state(stat.ret_code)

    return fmt(" [%s%%#%s#%d%%* %%#%s#%d%%* %%#%s#%d%%* %%#%s#%d%%*] ", state,
        "CompileLuaError", stat[com_severity.ERROR],
        "CompileLuaWarning", stat[com_severity.WARNING],
        "CompileLuaInfo", stat[com_severity.INFO],
        "CompileLuaHint", stat[com_severity.HINT])
end

return _M
