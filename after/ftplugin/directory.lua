local ol = vim.opt_local
local kit = require("kit")

ol.bufhidden = "delete"
ol.undolevels = -1

local opts = { buffer = true }
vim.keymap.set('n', '<C-r>', '<Plug>(nvim-dir-reload)', opts)
vim.keymap.set('n', 'gh', function()
    kit.v.dir_show_hidden = not kit.v.dir_show_hidden
    vim.api.nvim_feedkeys(kit.v.dir_reload_keys, "m", false)
end, opts)
