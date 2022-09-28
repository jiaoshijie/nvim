local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = ","

map({"", "i"}, "<C-j>", "<C-[>", opts)

map("n", "s", "<Nop>", { noremap = true })
map("n", "S", "<Nop>", { noremap = true })
map("n", "<Space>", "<NOP>", opts)

--[[
-- normal mode
--]]

map("n", "<leader><cr>", ":nohl<cr>", opts)
map("n", "<leader>/", "/\\<\\><left><left>", { noremap = true })

map("n", "<leader>fc", function()
  require("init-utils").JsjClearSE()
end, opts)

map("n", "<leader>ps", ":setlocal spell! spelllang=en_us<CR>", opts)
map("n", "<leader>eu", ":e ++enc=utf8<CR>", opts)
map("n", "<leader>eg", ":e ++enc=gbk<CR>", opts)
map("n", "Q", "q:", opts)
map("n", "gp", "`[v`]", opts)

JSJ_change_theme_alpha = false
map("n", "<leader>tt", require("init-utils").Change_theme_alpha, opts)

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
