---------------
-- markdown snippets
---------------
local l = '<localleader>'
local mdlist = {
  {m = 'n', slient = true, k = 'f', e = '/<++><cr>:nohl<cr>"_c4l'},
  {k = 'f', e = '<Esc>/<++><cr>:nohl<cr>"_c4l'},
  {k = 'm', e = '```<Enter><++><Enter>```<Enter><Enter><++><Esc>4k$a'},
  {k = 'b', e = '****<++><Esc>F*hi'},
  {k = 'i', e = '**<++><Esc>F*i'},
  {k = 'e', e = '***<CR><CR>'},
  {k = 'a', e = '$$<left>'},
  {k = 'A', e = '$$<CR><CR>$$<ESC>ki'},
  {k = 'p', e = '![](<++>)<Esc>F]i'},
  {k = 'l', e = '[](<++>)<Esc>F]i'},
  {k = '1', e = '# <CR><CR><++><Esc>2kA'},
  {k = '2', e = '## <CR><CR><++><Esc>2kA'},
  {k = '3', e = '### <CR><CR><++><Esc>2kA'},
  {k = '4', e = '#### <CR><CR><++><Esc>2kA'},
  {k = '5', e = '##### <CR><CR><++><Esc>2kA'},
  {k = '6', e = '###### <CR><CR><++><Esc>2kA'},
  {k = ',', e = '<br>'},
  {k = 'z', e = '<font color=><++></font><Esc>F>;i'},
  {k = 't2', e = [[|<++>|<++>|<cr>|----|----|<cr><Esc>2kyyj2p2ki<Esc>]]},
  {k = 't3', e = [[|<++>|<++>|<++>|<cr>|----|----|----|<cr><Esc>2kyyj2p2ki<Esc>]]},
  {k = 't4', e = [[|<++>|<++>|<++>|<++>|<cr>|----|----|----|----|<cr><Esc>2kyyj2p2ki<Esc>]]},
}

local group = vim.api.nvim_create_augroup('jsj_Markdown', {clear = true})
vim.api.nvim_create_autocmd("FileType", {
  pattern = 'markdown',
  group = group,
  callback = function()
    for _, i in ipairs(mdlist) do
      local m = i.m == nil and 'i' or i.m
      local k = l .. i.k
      local opts = { noremap = true }
      if i.slient then opts.silent = true end
      vim.api.nvim_buf_set_keymap(0, m, k, i.e, opts)
    end
  end
})
