local o = vim.opt

o.number = true
o.signcolumn = "yes"
o.cursorline = true
o.colorcolumn = "79"
o.scrolloff = 6
o.list = true
o.listchars = {
  trail = "␣",
  extends = "»",
  precedes = "«",
  -- eol = '↲',
}
o.splitright = true
o.splitbelow = true

o.laststatus = 3

o.termguicolors = true

o.background = "dark"
vim.cmd([[colorscheme gruvbox]])

require("jsj-statusline")
