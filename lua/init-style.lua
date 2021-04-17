local o = vim.o
local wo = vim.wo

wo.number = true
wo.signcolumn = "yes"
wo.cursorline = true
wo.colorcolumn = "81"
o.scrolloff = 6
o.laststatus = 2
wo.list = true
o.listchars = "trail:␣,tab:,extends:»,precedes:«,eol:↲,conceal:┊"
o.splitright = true
o.splitbelow = true

o.t_Co = "256" -- Support 256 colors
o.termguicolors = true

o.background = "dark"
vim.g.onebuddy_disable_italics = false
require('colorbuddy').colorscheme('onedark')

