vim.opt.guifont = { "Fira_Code:h13", "JetBrains_Mono:h13", "Hack:h13" }
vim.opt.guicursor = {
  "n-v-c-sm:block-Cursor", "i-ci-ve:ver15-Cursor", "r-cr-o:hor20-Cursor"
}

if vim.g.neovide then
  vim.g.neovide_transparency = 0.95
  vim.g.neovide_confirm_quit = true
  vim.g.neovide_cursor_vfx_mode = "sonicboom"
end
