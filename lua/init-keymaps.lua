local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- I hate escape
map('i', '<C-j>', '<Esc>', opts)
map('x', '<C-j>', '<Esc>', opts)
map('s', '<C-j>', '<Esc>', opts)
map('o', '<C-j>', '<Esc>', opts)

map('n', 's', '<Nop>', { noremap = true })
map('n', 'S', '<Nop>', { noremap = true })
map('n', 'cc', '<Nop>', { noremap = true })
map('n', '<Space>', '<NOP>', opts)

--[[
-- F 区
--]]

map('n', '<F12>', '<C-]>', opts)

--[[
-- insert mode
--]]

map('i', '<C-b>', '<Left>', opts)
map('i', '<C-f>', '<Right>', opts)
-- Recover from accidental Ctrl-U
-- http://vim.wikia.com/wiki/Recover_from_accidental_Ctrl-U
map('i', '<C-u>', '<C-g>u<C-u>', opts)
map('i', '<C-w>', '<C-g>u<C-w>', opts)

--[[
-- command mode
--]]

map('c', '<C-b>', '<Left>', { noremap = true })
map('c', '<C-f>', '<Right>', { noremap = true })
map('c', '<C-a>', '<Home>', { noremap = true })
map('c', '<C-e>', '<End>', { noremap = true })
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

function JsjClearSE()
  local l = vim.fn.line('.')
  local c = vim.fn.col('.')
  vim.cmd([[%s/\s\+$//ge]])
  vim.cmd([[%s/\(\n\)\+\%$//ge]])
  vim.fn.cursor(l, c)
end
map('n', '<leader>fc', ':lua JsjClearSE()<cr>', opts)

map('n', '<leader>=', "mIgg=G'ImI", opts)
map('n', '<leader><Space>', "@:", opts)
map('v', '<leader><Space>', "@:", opts)
map('n', '<leader>o', ':setlocal spell! spelllang=en_us<CR>', opts)
map('n', '<leader>xd', ':%!xxd<CR>', opts)
map('n', '<leader>xr', ':%!xxd -r<CR>', opts)
map('n', '<leader>eu', ':e ++enc=utf8<CR>', opts)
map('n', '<leader>eg', ':e ++enc=gbk<CR>', opts)
map('n', '<leader>cz', ':lua ToggleFold()<CR>', opts)
map('n', 'Q', 'q:', opts)
map('n', 'Y', 'y$', opts)
map('n', 'n', 'nzzzv', opts)
map('n', 'N', 'Nzzzv', opts)
map('n', 'J', 'mJJ`JmJ', opts)

FoldMethod = false
function ToggleFold()
  if not FoldMethod then
    vim.cmd('normal! zM')
    FoldMethod = true
  else
    vim.cmd('normal! zR')
    FoldMethod = false
  end
end

map('n', '<leader>tt', ':lua Change_theme_alpha()<cr>', opts)
JSJ_change_theme_alpha = false
function Change_theme_alpha()
  if not JSJ_change_theme_alpha then
    JSJ_change_theme_alpha = true
    vim.cmd('highlight Normal guibg=NONE ctermbg=None')
  else
    JSJ_change_theme_alpha = false
    vim.cmd('highlight Normal guibg=#282c34 ctermbg=235')
  end
  vim.cmd('hi! link SignColumn LineNr')
end


--[[
-- window
--]]
map('n', '<leader>w/', '<C-w>v', opts)
map('n', '<leader>w-', '<C-w>s', opts)
map('n', '<leader>wo', '<C-w>o', opts)
map('n', '<leader>wd', '<C-w>c', opts)
map('n', '<Down>', '<C-w>5-', opts)
map('n', '<Up>', '<C-w>5+', opts)
map('n', '<Right>', '<C-w>5>', opts)
map('n', '<Left>', '<C-w>5<', opts)
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
-- buffer
--]]
map('n', '<leader>bd', ':bdelete %<cr>', opts)


--[[
-- tab
--]]
map('n', '<leader>td', ':tabclose<cr>', opts)
map('n', '<leader>to', ':tabonly<cr>', opts)


--[[
--  utils
--]]
-- move text
map('n', '<leader>j', ':m .+1<cr>==', opts)
map('n', '<leader>k', ':m .-2<cr>==', opts)
map('v', 'J', ":m '>+1<cr>gv=gv", opts)
map('v', 'K', ":m '<-2<cr>gv=gv", opts)

-- undo break points
map('i', ',', ',<c-g>u', opts)
map('i', '.', '.<c-g>u', opts)
map('i', '!', '!<c-g>u', opts)
map('i', '?', '?<c-g>u', opts)
