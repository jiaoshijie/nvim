local o = vim.opt
local h = require("init-utils").hl

local group = vim.api.nvim_create_augroup("Jsj_ColorScheme", { clear = true })
vim.api.nvim_create_autocmd("ColorScheme", {
  group = group,
  pattern = "*",
  callback = function()
    h("StatusLine", { bg = "#2c323c" })
    h("StatusLineNC", { bg = "#5c6370" })
    h("WinBar", { bg = "#2c323c" })
    h("WinBarNC", { bg = "#5c6370" })
  end,
})

o.number = true
o.signcolumn = "yes"
o.cursorline = true
o.colorcolumn = "79"
o.scrolloff = 6
o.list = true
o.listchars = {
  trail = "␣",
  tab = "•",
  extends = "»",
  precedes = "«",
  -- eol = '↲',
}
o.splitright = true
o.splitbelow = true

o.laststatus = 3

o.termguicolors = true

o.background = "dark"

vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_day_brightness = 0.1
vim.cmd([[colorscheme tokyonight]])

require("jsj-statusline")
