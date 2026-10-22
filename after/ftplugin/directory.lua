local ol = vim.opt_local

ol.bufhidden = "delete"
ol.undolevels = -1

local opts = { buffer = true }
vim.keymap.set('n', '<C-r>', '<Plug>(nvim-dir-reload)', opts)

local show_hidden = false
local keys = vim.api.nvim_replace_termcodes("<Plug>(nvim-dir-reload)", true, false, true)
vim.keymap.set('n', 'gh', function()
    show_hidden = not show_hidden
    vim.api.nvim_feedkeys(keys, "m", false)
end, opts)

vim.api.nvim_create_autocmd('User', {
    pattern = 'DirReadPost',
    callback = function(_)
        if not show_hidden then
            vim.cmd([[silent keeppatterns g/^\./d _]])
        end
    end,
})

local ns = vim.api.nvim_create_namespace('jsj.bulitin-dir.decoration')
vim.api.nvim_set_decoration_provider(ns, {
    on_win = function(_, _, buf)
        return vim.bo[buf].filetype == 'directory'
    end,
    on_range = function(_, _, buf, row)
        local dir = vim.api.nvim_buf_get_name(buf)
        local name = vim.api.nvim_buf_get_lines(buf, row, row + 1, true)[1]
        local path = vim.fs.joinpath(dir, (name:gsub('/$', '')))
        local stat = vim.uv.fs_lstat(path) or {}
        local exe = stat.type == 'file' and bit.band(stat.mode, tonumber('111', 8)) ~= 0
        if exe then
            vim.api.nvim_buf_set_extmark(buf, ns, row, #name, {
                virt_text = { { '*', 'netrwExe' } },
                virt_text_pos = 'overlay',
                ephemeral = true,
            })
        end
        if stat.type == 'link' then
            local target = vim.uv.fs_readlink(path) or '?'
            vim.api.nvim_buf_set_extmark(buf, ns, row, 0, {
                virt_text = { { '-> ' .. target, 'netrwSymLink' } },
                virt_text_pos = 'eol',
                ephemeral = true,
            })
        end
        return row + 1
    end,
})
