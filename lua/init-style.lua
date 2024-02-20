local o = vim.opt

local group = vim.api.nvim_create_augroup("Jsj_ColorScheme", { clear = true })
vim.api.nvim_create_autocmd("ColorScheme", {
  group = group,
  pattern = "*",
  callback = function()
    JSJ_normal_hl = {
      fg = vim.fn.synIDattr(vim.fn.hlID("Normal"), "fg", "gui"),
      bg = vim.fn.synIDattr(vim.fn.hlID("Normal"), "bg", "gui")
    }
    if JSJ_change_theme_alpha then
      require("init-utils").global_hl("Normal", { fg = JSJ_normal_hl.fg, bg = "NONE" })
    end
  end,
})

o.number = true
o.signcolumn = "yes"
o.cursorline = true
o.colorcolumn = "79"
o.scrolloff = 6
o.list = true
o.listchars = {
  trail = "·",
  tab = "» ",
  extends = "…",
  precedes = "…",
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

require('init-statusline').setup()
vim.cmd.colorscheme("gruvbox")

vim.g.markdown_recommended_style = 0
