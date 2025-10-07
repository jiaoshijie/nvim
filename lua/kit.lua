local _M = {}
local o = vim.opt
local vf = vim.fn
local api = vim.api

_M.v = {
    theme_transparent = true,
}

_M.echo_err_msg = function(msg)
    vim.api.nvim_echo({ { msg } }, true, { err = true })
end

-- NOTE: args
--   cmd: the command that need to be execute as root user.
--   verbose: if true, print the `cmd` output, if false, ignore the `cmd` output
_M.sudo_exec = function(cmd, verbose)
    vf.inputsave()  -- TODO: I don't know if this input[save/restore] pair is needed.
    local password = vf.inputsecret("Password: ")
    vim.cmd("echo '' | redraw")  -- clear the cmd line
    vf.inputrestore()

    if not password or #password == 0 then
        _M.echo_err_msg("Invaild password, sudo aborted")
        return false
    end

    -- NOTE: `sudo` flags explain
    --   -p '': overwrite the default prompt of sudo program to ''(empty string)
    --   -S: read the password from stdin and write the prompt to stderr instead of stdout
    local out = vf.system(string.format("sudo -p '' -S %s", cmd), password)
    if vim.v.shell_error ~= 0 then
        _M.echo_err_msg(out)
        return false
    end

    if verbose then print(out) end

    return true
end

_M.sudo_write = function()
    local tempfile = vf.tempname()
    local filepath = vf.expand('%')

    if not filepath or #filepath == 0 then
        _M.echo_err_msg("E32: No file name")
        return
    end

    -- NOTE: I think using `dd` should be ok.
    -- `bs=1048576` is equivalent to `bs=1M` for GNU dd or `bs=1m` for BSD dd
    -- Both `bs=1M` and `bs=1m` are non-POSIX
    local cmd = string.format("dd if=%s of=%s bs=1048576",
    vim.fn.shellescape(tempfile),
    vim.fn.shellescape(filepath))

    -- NOTE: no need to check error as this fails the entire function
    api.nvim_exec2(string.format("silent write! %s", tempfile), { output = false })
    if _M.sudo_exec(cmd) then
        api.nvim_echo({{string.format([["%s" written]], filepath)}}, true, { verbose = false })
        vim.cmd("e!")
    end
    vf.delete(tempfile)
end

_M.set_indentation = function(is_space, width)
    o.expandtab = is_space  -- When expandtab is on, how many space a tab should represent
    o.shiftwidth = width  -- set the indent width
    o.tabstop = width  -- A single <tab> character '\t' should take how many normal character length
    o.softtabstop = width  -- When on, a <tab> press in the begin of the line is base on `shiftwidth`, not `tabstop` or `softtabstop`
end

_M.ts_enable = function(lang, regexp_syntax)
    if vim.treesitter.language.add(lang) then
        vim.treesitter.start(0, lang)
        if regexp_syntax then
            vim.bo.syntax = 'on'
        end
    end
end

local jsj_normal_hl = {}  -- after nvim startup, this variable will not be empty anymore
_M.theme_alpha_init = function()
    jsj_normal_hl = {
        fg = vim.fn.synIDattr(vim.fn.hlID("Normal"), "fg", "gui"),
        bg = vim.fn.synIDattr(vim.fn.hlID("Normal"), "bg", "gui"),
        default = false,
    }
    if _M.v.theme_transparent then
        api.nvim_set_hl(0, "Normal", { fg = jsj_normal_hl.fg, bg = "NONE", default = false })
    end
end
_M.theme_alpha_switch = function()
    if not _M.v.theme_transparent then
        _M.v.theme_transparent = true
        jsj_normal_hl = {
            fg = vf.synIDattr(vf.hlID("Normal"), "fg", "gui"),
            bg = vf.synIDattr(vf.hlID("Normal"), "bg", "gui"),
            default = false,
        }
        api.nvim_set_hl(0, "Normal", { fg = jsj_normal_hl.fg, bg = "NONE", default = false })
    else
        _M.v.theme_transparent = false
        api.nvim_set_hl(0, "Normal", jsj_normal_hl)
    end
    api.nvim_set_hl(0, "SignColumn", { link = "LineNr", default = false })
end

_M.copy_file_path_lnum = function(flag, line)
    -- flag:
    --    't' : only file name
    --    nil : relative file path
    --    'p' : absoulte file path
    --    other: Error but no checking
    local path = flag and vf.expand("%:" .. flag) or vf.expand("%")
    if line then
        path = path .. ':' .. vim.fn.line('.')
    end
    if #path ~= 0 then
        vf.setreg('+', path)
        print("File Path Copied: " .. path)
    else
        _M.echo_err_msg("No file opened in this buffer!!!")
    end
end

_M.edit_my_todolist = function()
    if vim.fn.filereadable(vim.fn.expand("~/media/GDrive/todo.md")) == 1 then
        vim.cmd(":edit ~/media/GDrive/todo.md")
    else
        _M.echo_err_msg("File `~/media/GDrive/todo.md` doesn't exist or is not readable!!!")
    end
end

_M.markdown_glow_render = function()
    if vim.o.filetype == "markdown" then
        if vim.fn.executable('glow') == 1 then
            vim.cmd("tabnew term://glow %:p -w " .. (vim.o.columns - 4))
        else
            _M.echo_err_msg("ERROR: `glow` is not executable!!!")
        end
    else
        _M.echo_err_msg("ERROR: only support `markdown` file!!!")
    end
end

_M.clean_trailing_spaces_and_lines = function()
    local l, c = vf.line("."), vf.col(".")
    vim.cmd([[%s/\s\+$//ge]])
    vim.cmd([[%s/\(\n\)\+\%$//ge]])
    vf.cursor({ l, c })
    vim.cmd.nohlsearch()
end

-- quickfix list
_M.toggle_qf_list = function(listname, perfix)
    if #vf.filter(vf.getwininfo(), "v:val." .. listname) == 0 then
        xpcall(api.nvim_exec2, function()
            _M.echo_err_msg("Location List is Empty.")
        end, perfix .. "open", { output = false })
    else
        api.nvim_exec2(perfix .. "close", { output = false })
    end
end

return _M
