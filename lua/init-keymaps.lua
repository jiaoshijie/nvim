local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = ","

map({ "", "i" }, "<C-j>", "<C-[>", opts)

map("n", "s", "<Nop>", { noremap = true })
map("n", "S", "<Nop>", { noremap = true })
map("n", "C", "<Nop>", { noremap = true })
map({"n", "v"}, "<Space>", "<NOP>", opts)

--[[
-- normal mode
--]]

map("n", "<leader><leader>", "<C-^>", opts)
-- NOTE: `:h pattern.txt{magic}` `:h :substitute`
map("n", "<leader>/", "/\\<\\><left><left>", { noremap = true })

map("n", "<leader>fc", function()
  require("init-utils").JsjClearSE()
end, opts)

map("n", "<leader>ps", ":setlocal spell! spelllang=en_us<CR>", opts)
map("n", "Q", "q:", opts)

JSJ_change_theme_alpha = false  -- NOTE: global variable
map("n", "<leader>tt", require("init-utils").Change_theme_alpha, opts)

map("t", "<Esc>", "<C-\\><C-n>", opts)

--[[
--  utils
--]]
-- move text
map("v", "J", ":m '>+1<cr>gv=gv", opts)
map("v", "K", ":m '<-2<cr>gv=gv", opts)

-- quickfix list
map("n", "<leader>qq", function()
  require("init-utils").Jsj_ToggleList("quickfix", "c")
end, opts)
map("n", "<leader>ql", function()
  require("init-utils").Jsj_ToggleList("loclist", "l")
end, opts)

-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- NOTE(0.10): ctrl-w_d for vim.diagnostic.open_float
-- NOTE(0.10): [d for vim.diagnostic.goto_prev
-- NOTE(0.10): ]d for vim.diagnostic.goto_next
-- `vim.diagnostic.setloclist`: using telescope instead
