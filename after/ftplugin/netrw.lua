local ol = vim.opt_local

ol.bufhidden = "delete"

local opts = { buffer = true }
vim.keymap.set("n", "i", "<Nop>", opts)
vim.keymap.set("n", "s", "<Nop>", opts)
vim.keymap.set("n", "x", "<Nop>", opts)
vim.keymap.set("n", "p", "<Nop>", opts)
vim.keymap.set("n", "o", "<Nop>", opts)
vim.keymap.set("n", "O", "<Nop>", opts)
vim.keymap.set("n", "r", "<Nop>", opts)
vim.keymap.set("n", "Tb", "<Nop>", opts)
vim.keymap.set("n", "Th", "<Nop>", opts)

pcall(vim.keymap.del, "n", "v", opts)
