local _M = {}
local fmt = string.format
local fn, cmd = vim.fn, vim.cmd
local o, wo = vim.o, vim.wo
local misc = require('jsj-statusline.misc')

local options = {
  colors = require('jsj-statusline.theme'),
  sections = {
    { class = 'ArchIcon', item = misc.get_ArchIcon },
    { class = 'mode', item = misc.get_mode },
    { item = '%<' },
    { class = 'info', item = misc.get_paste },
    { class = 'info', item = misc.get_spell },
    { class = 'git', item = misc.get_gitb },
    { class = 'git', item = misc.get_gitadd },
    { class = 'git', item = misc.get_gitchange },
    { class = 'git', item = misc.get_gitdel },
    { class = 'file', item = misc.get_filename },
    { class = 'file', item = misc.get_fileinfo },
    { item = '%=' },
    { class = 'lsp', item = misc.get_lsp_information },
    { class = 'lsp', item = misc.get_lsp_hint },
    { class = 'lsp', item = misc.get_lsp_warning },
    { class = 'lsp', item = misc.get_lsp_error },
    { class = 'file', item = misc.get_filetype },
    { class = 'file', item = misc.get_fileformat },
    { class = 'mode', item = misc.get_filepos },
  },
}

local sethlgroups = function()
  cmd('augroup Jsj_Statusline_Colors')
  cmd('autocmd!')
  for class, attr in pairs(options.colors) do
    for state, args in pairs(attr) do
      local hlgroup = fmt('Statusline_%s_%s', class, state)
      local temp = {}
      for i, j in pairs(args) do
        table.insert(temp, fmt('%s=%s', i, j))
      end
      temp = table.concat(temp, ' ')
      cmd(fmt('autocmd VimEnter,ColorScheme * hi %s %s', hlgroup, temp))
    end
  end
  cmd('augroup END')
end

local highlight_section = function(section)
  if type(section.item) == 'string' then
    return section.item
  end
  local hg = fmt('Statusline_%s_%s', section.class, section.item().state)
  return fmt('%%#%s#%s%%*', hg, section.item().text)
end

local highlight_sections = function(sections)
  return vim.tbl_map(highlight_section, sections)
end

_M.update_statusline = function()
  return table.concat(highlight_sections(options.sections))
end

local set_statusline = function()
  o.showmode = false
  o.statusline = [[%!luaeval('require("jsj-statusline.statusline").update_statusline()')]]
  wo.statusline = o.statusline
end

_M.setup = function()
  sethlgroups()
  set_statusline()
end

return _M
