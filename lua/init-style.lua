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
require('colorbuddy').colorscheme('jsj-theme/gruvbox', false, { disable_defaults = false })
require('jsj-statusline')

-- vim.cmd[[command! -nargs=* -complete=color Colorbuddy :lua require("init-utils").Jsj_colorbuddy(<f-args>)]]

local group = vim.api.nvim_create_augroup("Jsj_neovim_autocmd_misc", {clear = true})
vim.api.nvim_create_autocmd('TextYankPost', {
  pattern = '*',
  group = group,
  callback = function() vim.highlight.on_yank{higourp="IncSearch", timeout=300} end
})
