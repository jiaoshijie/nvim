local o = vim.o
local wo = vim.wo

wo.number = true
wo.signcolumn = "yes"
wo.cursorline = true
o.scrolloff = 6
o.laststatus = 2
wo.list = true
o.listchars = "trail:␣,tab:,extends:»,precedes:«,eol:↲,conceal:┊"
o.splitright = true
o.splitbelow = true

o.t_Co = "256" -- Support 256 colors
o.termguicolors = true

o.background = "dark"
require('colorbuddy').colorscheme('onebuddy')

vim.api.nvim_exec([[
augroup jsj_color_warning
  autocmd!
  highlight Todo cterm=bold,italic ctermfg=223 ctermbg=160 gui=bold,italic guifg=#e5b07b guibg=#D70000
  highlight Debug cterm=bold,italic ctermfg=223 ctermbg=235 gui=bold,italic guifg=#e5b07b guibg=#282828
  autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|DONE\|XXX\|BUG\|HACK\|???!!!\)')
  autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|NOTICE\)')
augroup END
]], false)
