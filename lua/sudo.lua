local _M = {}
local vf = vim.fn
local api = vim.api
local command = vim.api.nvim_create_user_command

-- NOTE: args
--   cmd: the command that need to be execute as root user.
--   verbose: if true, print the `cmd` output, if false, ignore the `cmd` output
_M.sudo_exec = function(cmd, verbose)
    vf.inputsave()  -- TODO: I don't know if this input[save/restore] pair is needed.
    local password = vf.inputsecret("Password: ")
    vim.cmd("echo '' | redraw")  -- clear the cmd line
    vf.inputrestore()

    if not password or #password == 0 then
        api.nvim_err_writeln("Invaild password, sudo aborted")
        return false
    end

    -- NOTE: `sudo` flags explain
    --   -p '': overwrite the default prompt of sudo program to ''(empty string)
    --   -S: read the password from stdin and write the prompt to stderr instead of stdout
    local out = vf.system(string.format("sudo -p '' -S %s", cmd), password)
    if vim.v.shell_error ~= 0 then
        api.nvim_err_writeln(out)
        return false
    end

    if verbose then print(out) end

    return true
end

_M.sudo_write = function()
    local tempfile = vf.tempname()
    local filepath = vf.expand('%')

    if not filepath or #filepath == 0 then
        api.nvim_err_writeln("E32: No file name")
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

return _M
