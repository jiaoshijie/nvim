local o = vim.opt
JSJ_normalbg = "NONE"

local h = function(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

local group = vim.api.nvim_create_augroup("Jsj_ColorScheme", { clear = true })
vim.api.nvim_create_autocmd("ColorScheme", {
  group = group,
  pattern = "*",
  callback = function()
    JSJ_normalbg = vim.fn.synIDattr(62, "bg", "gui")
    if JSJ_change_theme_alpha then
      vim.cmd("highlight Normal guibg=NONE ctermbg=NONE")
    end
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

vim.g.terminal_color_0 = '#2e2e2e'
vim.g.terminal_color_1 = '#eb4129'
vim.g.terminal_color_2 = '#abe047'
vim.g.terminal_color_3 = '#f6c744'
vim.g.terminal_color_4 = '#47a0f3'
vim.g.terminal_color_5 = '#7b5cb0'
vim.g.terminal_color_6 = '#64dbed'
vim.g.terminal_color_7 = '#e5e9f0'
vim.g.terminal_color_8 = '#565656'
vim.g.terminal_color_9 = '#ec5357'
vim.g.terminal_color_10 = '#c0e17d'
vim.g.terminal_color_11 = '#f9da6a'
vim.g.terminal_color_12 = '#49a4f8'
vim.g.terminal_color_13 = '#a47de9'
vim.g.terminal_color_14 = '#99faf2'
vim.g.terminal_color_15 = '#ffffff'

vim.cmd([[colorscheme gruvbox]])
