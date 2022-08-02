local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "s", "<Nop>", { noremap = true })
map("n", "S", "<Nop>", { noremap = true })
map("n", "<Space>", "<NOP>", opts)

--[[
-- command mode
--]]

map("c", "<C-b>", "<Left>", { noremap = true })
map("c", "<C-f>", "<Right>", { noremap = true })
map("c", "<C-a>", "<Home>", { noremap = true })
map("c", "<m-b>", "<S-Left>", { noremap = true })
map("c", "<m-f>", "<S-Right>", { noremap = true })

--[[
-- visual mode
--]]

map("x", "<", "<gv", opts)
map("x", ">", ">gv", opts)

--[[
-- normal mode
--]]

map("n", "<leader><cr>", ":nohl<cr>", opts)
map("n", "<leader>/", "/\\<\\><left><left>", { noremap = true })

map("n", "<leader>ft", function()
  require("init-utils").JsjClearSE(false)
end, opts)
map("n", "<leader>fc", function()
  require("init-utils").JsjClearSE(true)
end, opts)

map("n", "<leader>ps", ":setlocal spell! spelllang=en_us<CR>", opts)
map("n", "<leader>eu", ":e ++enc=utf8<CR>", opts)
map("n", "<leader>eg", ":e ++enc=gbk<CR>", opts)
map("n", "Q", "q:", opts)
map("n", "gp", "`[v`]", opts)

JSJ_change_theme_alpha = false
map("n", "<leader>tt", require("init-utils").Change_theme_alpha, opts)

--[[
-- window
--]]
map("n", "<m-H>", "<C-w>h", opts)
map("n", "<m-L>", "<C-w>l", opts)
map("n", "<m-J>", "<C-w>j", opts)
map("n", "<m-K>", "<C-w>k", opts)
map("t", "<m-H>", "<C-\\><C-n><C-w>h", opts)
map("t", "<m-J>", "<C-\\><C-n><C-w>j", opts)
map("t", "<m-K>", "<C-\\><C-n><C-w>k", opts)
map("t", "<m-L>", "<C-\\><C-n><C-w>l", opts)
map("t", "<Esc>", "<C-\\><C-n>", opts)

--[[
--  utils
--]]
-- move text
map("n", "<m-j>", ":m .+1<cr>==", opts)
map("n", "<m-k>", ":m .-2<cr>==", opts)
map("v", "J", ":m '>+1<cr>gv=gv", opts)
map("v", "K", ":m '<-2<cr>gv=gv", opts)

-- quickfix list
map("n", "<leader>qq", function()
  require("init-utils").Jsj_ToggleList("quickfix", "c")
end, opts)
map("n", "<leader>ql", function()
  require("init-utils").Jsj_ToggleList("loclist", "l")
end, opts)
