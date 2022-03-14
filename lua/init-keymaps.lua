local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- I hate escape
map('i', '<C-j>', '<Esc>', opts)
map('', '<C-j>', '<Esc>', opts)

map('n', 's', '<Nop>', { noremap = true })
map('n', 'S', '<Nop>', { noremap = true })
map('n', '<Space>', '<NOP>', opts)

--[[
-- F 区
--]]

map('n', '<F12>', '<C-]>', opts)

--[[
-- insert mode
--]]

-- Recover from accidental Ctrl-U
-- http://vim.wikia.com/wiki/Recover_from_accidental_Ctrl-U
map('i', '<C-u>', '<C-g>u<C-u>', opts)
map('i', '<C-w>', '<C-g>u<C-w>', opts)
map('i', ',', ',<c-g>u', opts)
map('i', '.', '.<c-g>u', opts)
map('i', '!', '!<c-g>u', opts)
map('i', '?', '?<c-g>u', opts)

--[[
-- command mode
--]]

map('c', '<C-b>', '<Left>', { noremap = true })
map('c', '<C-f>', '<Right>', { noremap = true })
map('c', '<C-a>', '<Home>', { noremap = true })
map('c', '<m-b>', '<S-Left>', { noremap = true })
map('c', '<m-f>', '<S-Right>', { noremap = true })

--[[
-- visual mode
--]]

map('x', '<', '<gv', opts)
map('x', '>', '>gv', opts)

--[[
-- normal mode
--]]

map('n', '<C-e>', '2<C-e>', opts)
map('n', '<C-y>', '2<C-y>', opts)
map('n', '<leader><cr>', ':nohl<cr>', opts)
map('n', '<leader>/', '/\\<\\><left><left>', { noremap = true })

map('n', '<leader>ft', '<cmd>lua require("init-utils").JsjClearSE(false)<cr>', opts)
map('n', '<leader>fc', '<cmd>lua require("init-utils").JsjClearSE(true)<cr>', opts)

map('n', '<leader>=', "mIgg=G'ImI", opts)
map('n', '<leader>ps', ':setlocal spell! spelllang=en_us<CR>', opts)
map('n', '<leader>xd', ':%!xxd<CR>', opts)
map('n', '<leader>xr', ':%!xxd -r<CR>', opts)
map('n', '<leader>eu', ':e ++enc=utf8<CR>', opts)
map('n', '<leader>eg', ':e ++enc=gbk<CR>', opts)
map('n', 'Q', 'q:', opts)
map('n', 'n', 'nzzzv', opts)
map('n', 'N', 'Nzzzv', opts)
map('n', 'J', 'mJJ`JmJ', opts)
map('n', 'gp', '`[v`]', opts)

JSJ_change_theme_alpha = false
map('n', '<leader>tt', '<cmd>lua require("init-utils").Change_theme_alpha()<cr>', opts)

--[[
-- window
--]]
map('n', '<leader>w/', '<C-w>v', opts)
map('n', '<leader>w-', '<C-w>s', opts)
map('n', '<m-H>', '<C-w>h', opts)
map('n', '<m-L>', '<C-w>l', opts)
map('n', '<m-J>', '<C-w>j', opts)
map('n', '<m-K>', '<C-w>k', opts)
map('t', '<m-H>', '<C-\\><C-n><C-w>h', opts)
map('t', '<m-J>', '<C-\\><C-n><C-w>j', opts)
map('t', '<m-K>', '<C-\\><C-n><C-w>k', opts)
map('t', '<m-L>', '<C-\\><C-n><C-w>l', opts)
map('t', '<Esc>', '<C-\\><C-n>', opts)

--[[
--  utils
--]]
-- move text
map('n', '<m-j>', ':m .+1<cr>==', opts)
map('n', '<m-k>', ':m .-2<cr>==', opts)
map('v', 'J', ":m '>+1<cr>gv=gv", opts)
map('v', 'K', ":m '<-2<cr>gv=gv", opts)

-- quickfix list
map('n', '<leader>qq', '<cmd>lua require("init-utils").Jsj_ToggleList("quickfix", "c")<cr>', opts)
map('n', '<leader>ql', '<cmd>lua require("init-utils").Jsj_ToggleList("loclist", "l")<cr>', opts)
