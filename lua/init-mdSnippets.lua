---------------
-- markdown snippets
---------------
local _M = {}
local s = ' '
local l = '<localleader>'
local mdlist = {
  {m = 'nnoremap', b = '<buffer> <silent>', k = 'f', e = '/<++><cr>:nohl<cr>"_c4l'},
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
  {k = 't2', e = [[\|<++>\|<++>\|<cr>\|----\|----\|<cr><Esc>2kyyj2p2ki<Esc>]]},
  {k = 't3', e = [[\|<++>\|<++>\|<++>\|<cr>\|----\|----\|----\|<cr><Esc>2kyyj2p2ki<Esc>]]},
  {k = 't4', e = [[\|<++>\|<++>\|<++>\|<++>\|<cr>\|----\|----\|----\|----\|<cr><Esc>2kyyj2p2ki<Esc>]]},
}

_M.mkmdsnip = function()
  vim.cmd('augroup jsj_Markdown')
  vim.cmd('autocmd!')
  for _, i in pairs(mdlist) do
    local m = i.m == nil and 'inoremap' or i.m
    local b = i.b == nil and '<buffer>' or i.b
    local k = l .. i.k
    vim.cmd('autocmd Filetype markdown ' .. m .. s .. b .. s .. k .. s .. i.e)
  end
  vim.cmd('augroup END')
end

return _M
