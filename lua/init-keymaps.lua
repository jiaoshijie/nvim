local map = vim.api.nvim_set_keymap

-- I hate escape
map('i', '<C-j>', '<Esc>', { noremap = true, silent = true })
map('x', '<C-j>', '<Esc>', { noremap = true, silent = true })
map('s', '<C-j>', '<Esc>', { noremap = true, silent = true })
map('o', '<C-j>', '<Esc>', { noremap = true, silent = true })

map('n', 's', '<Nop>', { noremap = true })
map('n', 'S', '<Nop>', { noremap = true })
map('n', 'cc', '<Nop>', { noremap = true })

--[[
-- F 区
--]]

map('n', '<F12>', '<C-]>', { noremap = true, silent = true })

--[[
-- insert mode
--]]

map('i', '<C-b>', '<Left>', { noremap = true, silent = true })
map('i', '<C-f>', '<Right>', { noremap = true, silent = true })
map('i', '<C-y>', '<C-r>+', { noremap = true, silent = true })
-- Recover from accidental Ctrl-U
-- http://vim.wikia.com/wiki/Recover_from_accidental_Ctrl-U
map('i', '<C-u>', '<C-g>u<C-u>', { noremap = true, silent = true })
map('i', '<C-w>', '<C-g>u<C-w>', { noremap = true, silent = true })

--[[
-- command mode
--]]

map('c', '<C-b>', '<Left>', { noremap = true })
map('c', '<C-f>', '<Right>', { noremap = true })
map('c', '<C-a>', '<Home>', { noremap = true })
map('c', '<C-e>', '<End>', { noremap = true })
map('c', '<C-y>', '<C-r>+', { noremap = true })
map('c', '<m-b>', '<S-Left>', { noremap = true })
map('c', '<m-f>', '<S-Right>', { noremap = true })

--[[
-- visual mode
--]]

map('x', '<', '<gv', { noremap = true, silent = true })
map('x', '>', '>gv', { noremap = true, silent = true })

--[[
-- normal mode
--]]

map('n', '<C-e>', '2<C-e>', { noremap = true, silent = true })
map('n', '<C-y>', '2<C-y>', { noremap = true, silent = true })
map('n', '<leader><cr>', ':nohl<cr>', { noremap = true, silent = true })

function JsjClearSE()
  local l = vim.fn.line('.')
  local c = vim.fn.col('.')
  vim.cmd([[%s/\s\+$//ge]])
  vim.cmd([[%s/\(\n\)\+\%$//ge]])
  vim.fn.cursor(l, c)
end
map('n', '<leader>fc', ':lua JsjClearSE()<cr>', { noremap = true, silent = true })

map('n', '<leader>=', "mIgg=G'ImI", { noremap = true, silent = true })
map('n', '<leader>o', ':setlocal spell! spelllang=en_us<CR>', { noremap = true, silent = true })
map('n', '<leader>xd', ':%!xxd<CR>', { noremap = true, silent = true })
map('n', '<leader>xr', ':%!xxd -r<CR>', { noremap = true, silent = true })
map('n', '<leader>eu', ':e ++enc=utf8<CR>', { noremap = true, silent = true })
map('n', '<leader>eg', ':e ++enc=gbk<CR>', { noremap = true, silent = true })
map('n', '<leader>zz', ':lua ToggleFold()<CR>', { noremap = true, silent = true })

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

map('n', '<leader>tt', ':lua Change_theme_alpha()<cr>', { noremap = true, silent = true })
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
map('n', '<leader>w/', '<C-w>v', { noremap = true, silent = true })
map('n', '<leader>w-', '<C-w>s', { noremap = true, silent = true })
map('n', '<leader>wo', '<C-w>o', { noremap = true, silent = true })
map('n', '<leader>wd', '<C-w>c', { noremap = true, silent = true })
map('n', '<Down>', '<C-w>5-', { noremap = true, silent = true })
map('n', '<Up>', '<C-w>5+', { noremap = true, silent = true })
map('n', '<Right>', '<C-w>5>', { noremap = true, silent = true })
map('n', '<Left>', '<C-w>5<', { noremap = true, silent = true })
map('n', '<m-H>', '<C-w>h', { noremap = true, silent = true })
map('n', '<m-L>', '<C-w>l', { noremap = true, silent = true })
map('n', '<m-J>', '<C-w>j', { noremap = true, silent = true })
map('n', '<m-K>', '<C-w>k', { noremap = true, silent = true })
map('t', '<m-H>', '<C-\\><C-n><C-w>h', { noremap = true, silent = true })
map('t', '<m-J>', '<C-\\><C-n><C-w>j', { noremap = true, silent = true })
map('t', '<m-K>', '<C-\\><C-n><C-w>k', { noremap = true, silent = true })
map('t', '<m-L>', '<C-\\><C-n><C-w>l', { noremap = true, silent = true })
map('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })

--[[
-- buffer
--]]
map('n', '<leader>bd', ':bdelete %<cr>', { noremap = true, silent = true })


--[[
-- tab
--]]
map('n', '<leader>td', ':tabclose<cr>', { noremap = true, silent = true })
map('n', '<leader>to', ':tabonly<cr>', { noremap = true, silent = true })
