local kit = require('kit')
local map = vim.keymap.set
local command = vim.api.nvim_buf_create_user_command

vim.opt_local.conceallevel = 3
vim.opt_local.concealcursor = ""
vim.opt_local.shiftwidth = 2
vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2

map('n', '<localleader>f', '/<++><cr>:nohl<cr>"_c4l', { noremap = true, buffer = true, silent = true })
map('i', '<localleader>f', '<Esc>/<++><cr>:nohl<cr>"_c4l', { noremap = true, buffer = true })

local table_insert = function(args)
    local cols = tonumber(args.args)

    if cols == nil then
        kit.echo_err_msg("The column must be a number!!!")
        return
    end

    local curpos = vim.api.nvim_win_get_cursor(0)
    if vim.fn.getline(curpos[1]) ~= "" then
        kit.echo_err_msg("The cursor must be on an empty line!!!")
        return
    end

    local header = '|' .. string.rep('<++>|', cols)
    local sep  = '|' .. string.rep('----|', cols)
    local body = header

    vim.api.nvim_buf_set_lines(0, curpos[1] - 1, curpos[1], false, { header, sep, body, body })
end

local table_align = function(spec)
    if vim.fn.exists(':Tabularize') == 0 then
        kit.echo_err_msg("`Tabularize` not available!!!")
        return
    end

    local line = vim.fn.getline('.')
    local cols = 0

    for i = 1,#line do
        if line:sub(i, i) == '|' then
            cols = cols + 1
        end
    end

    if cols == 0 or cols == 1 then
        kit.echo_err_msg("The cursor must be on a line in a table!!!")
        return
    end

    vim.cmd("Tabularize /|/c0" .. string.rep(spec, cols - 1) .. "c0")
end

command(0, "MdTabInsert", table_insert, { nargs = 1 })
command(0, "MdTabAlign", function() table_align("c1l1") end, { nargs = 0 })
command(0, "MdTabAlignRight", function() table_align("c1r1") end, { nargs = 0 })
command(0, "MdTabAlignCenter", function() table_align("c1c1") end, { nargs = 0 })

vim.treesitter.start()
