local vf = vim.fn
local api = vim.api

vim.opt_local.conceallevel = 3
vim.opt_local.concealcursor = ""

local l = "<localleader>"
local mdlist = {
    {
        m = "n",
        slient = true,
        k = "f",
        e =
        '/<++><cr>:nohl<cr>"_c4l'
    },
    { k = "f",  e = '<Esc>/<++><cr>:nohl<cr>"_c4l' },
}

local insert_table = function()
    local cols = tonumber(vf.input("Enter the number of columns > "))
    vim.cmd("echo '' | redraw")  -- clear the cmd line

    if cols == nil then
        api.nvim_err_writeln("The input must be a number!!!")
        return
    end

    local body = '|' .. string.rep('<++>|', cols)
    local sep  = '|' .. string.rep('----|', cols)
    return body .. '<cr>' .. sep .. '<cr><Esc>2kyyj2p2ki<Esc>'
end

for _, i in ipairs(mdlist) do
    local m = i.m == nil and "i" or i.m
    local k = l .. i.k
    local opts = { noremap = true, buffer = true }
    if i.slient then
        opts.silent = true
    end
    vim.keymap.set(m, k, i.e, opts)
end

vim.keymap.set('i', '<localleader>t', insert_table, { noremap = true, buffer = true, expr = true })
