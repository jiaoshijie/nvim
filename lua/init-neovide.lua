-- https://neovide.dev/
vim.opt.guifont = { "JetBrains_Mono:h13", "Hack:h13" }
vim.opt.guicursor = {
  "n-v-c-sm:block-Cursor", "i-ci-ve:ver15-Cursor", "r-cr-o:hor20-Cursor"
}

if vim.g.neovide then
  vim.g.neovide_transparency = 0.8
  vim.g.neovide_confirm_quit = true
  vim.g.neovide_fullscreen = true
  vim.g.neovide_cursor_vfx_mode = "ripple"

  vim.g.neovide_scale_factor = 1.0
  local change_font_size = function(delta)
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
  end
  vim.keymap.set("n", "<C-=>", function() change_font_size(1.25) end,
    { noremap = true })
  vim.keymap.set("n", "<C-->", function() change_font_size(1/1.25) end,
    { noremap = true })

  vim.keymap.set("n", "<leader>tt", function()
    if vim.g.neovide_transparency == 1.0 then
      vim.g.neovide_transparency = 0.8
    else
      vim.g.neovide_transparency = 1.0
    end
  end, { noremap = true })
end
