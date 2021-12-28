local o = vim.opt

o.number = true
o.signcolumn = "yes"
o.cursorline = true
o.colorcolumn = "79"
o.scrolloff = 6
o.laststatus = 2
o.list = true
o.listchars = {trail = '␣', tab = '•', --[[ eol = '↲',--]] extends = '»', precedes = '«'}
o.splitright = true
o.splitbelow = true

o.termguicolors = true

-- o.background = "dark"
require('colorbuddy').colorscheme('jsj-theme/onedark', false, { disable_defaults = false })
require('jsj-statusline')

-- vim.cmd[[command! -nargs=* -complete=color Colorbuddy :lua require("init-utils").Jsj_colorbuddy(<f-args>)]]

vim.api.nvim_exec([[
augroup Jsj_highlight_yank
  autocmd!
  autocmd TextYankPost * silent! lua vim.highlight.on_yank{higourp="IncSearch", timeout=300}
augroup END
]], false)
