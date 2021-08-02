local o = vim.o
local wo = vim.wo

wo.number = true
wo.signcolumn = "yes"
wo.cursorline = true
wo.colorcolumn = "81"
o.scrolloff = 6
o.laststatus = 2
wo.list = true
o.listchars = "trail:␣,tab:•,extends:»,precedes:«,eol:↲"
o.splitright = true
o.splitbelow = true

o.termguicolors = true

-- o.background = "dark"
require('colorbuddy').colorscheme('theme/solarized', false, { disable_defaults = false })
vim.cmd[[command! -nargs=* -complete=color Colorbuddy :lua Jsj_colorbuddy(<f-args>)]]
function Jsj_colorbuddy(name, bg)
  if bg == nil then
    bg = 'dark'
  end
  vim.api.nvim_command(string.format("set background=%s", bg))
  vim.api.nvim_command(string.format("luafile %s", vim.fn.expand('$HOME') .. '/.config/nvim/lua/theme/' .. name .. '.lua'))
  if JSJ_change_theme_alpha then  -- lua/init-style.lua
    vim.api.nvim_command('highlight Normal guibg=NONE ctermbg=None')
  end
end

vim.api.nvim_exec([[
augroup Jsj_highlight_yank
  autocmd!
  autocmd TextYankPost * silent! lua vim.highlight.on_yank{higourp="IncSearch", timeout=300}
augroup END
]], false)
