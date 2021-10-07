local o = vim.o
local wo = vim.wo

wo.number = true
wo.signcolumn = "yes"
wo.cursorline = true
wo.colorcolumn = "79"
o.scrolloff = 6
o.laststatus = 2
wo.list = true
o.listchars = "trail:␣,tab:•,extends:»,precedes:«,eol:↲"
o.splitright = true
o.splitbelow = true

o.termguicolors = true

-- o.background = "dark"
require('colorbuddy').colorscheme('jsj-theme/gruvbox', false, { disable_defaults = false })
require('jsj-statusline')

vim.cmd[[command! -nargs=* -complete=color Colorbuddy :lua require("init-utils").Jsj_colorbuddy(<f-args>)]]

vim.api.nvim_exec([[
augroup Jsj_highlight_yank
  autocmd!
  autocmd TextYankPost * silent! lua vim.highlight.on_yank{higourp="IncSearch", timeout=300}
augroup END
]], false)
