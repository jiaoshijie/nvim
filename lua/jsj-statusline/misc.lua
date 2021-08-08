local fn, lsp = vim.fn, vim.lsp
local fmt = string.format
local get_icon = require('nvim-web-devicons').get_icon
local _M = {}

local modes = {
  ['?']  = {text = '', state           = 'inactive'},
  ['n']  = {text = ' NORMAL ', state   = 'normal'},
  ['i']  = {text = ' INSERT ', state   = 'insert'},
  ['R']  = {text = ' REPLACE ', state  = 'replace'},
  ['v']  = {text = ' VISUAL ', state   = 'visual'},
  ['V']  = {text = ' V-LINE ', state   = 'visual'},
  [''] = {text = ' V-BLOCK ', state  = 'visual'},
  ['c']  = {text = ' COMMAND ', state  = 'command'},
  ['s']  = {text = ' SELECT ', state   = 'visual'},
  ['S']  = {text = ' S-LINE ', state   = 'visual'},
  [''] = {text = ' S-BLOCK ', state  = 'visual'},
  ['t']  = {text = ' TERMINAL ', state = 'command'},
}

local is_active = function()
  return vim.g.statusline_winid == fn.win_getid()
end

_M.get_ArchIcon = function()
  return {
    text = is_active() and '▊  ' or '',
    state = is_active() and 'ArchIcon' or '',
  }
end

_M.get_mode = function()
  return is_active() and modes[fn.mode()] or modes['?']
end

_M.get_paste = function()
  return {
    text = vim.o.paste and ' PASTE ' or '',
    state = 'paste',
  }
end

_M.get_spell = function()
  return {
    text = vim.wo.spell and is_active() and fmt(' SPELL[%s] ', string.upper(vim.bo.spelllang)) or '',
    state = 'spell',
  }
end

_M.get_filename = function()
  local icon = get_icon(fn.expand('%:t:r'), fn.expand('%:e'), { default = true })
  return {
    text = is_active() and ' ' .. icon .. ' %t ' or ' %F ',
    state = is_active() and 'filename' or 'inactive',
  }
end

_M.get_filepos = function()
  return {
    state = _M.get_mode().state,
    text = is_active() and ' %p%% 並%v:%l/%L ' or ' %v:%l/%L ',
  }
end

_M.get_fileinfo = function()
  return {
    state = 'fileinfo',
    text = '%m%h%r',
  }
end

_M.get_filetype = function()
  return {
    state = is_active() and 'filetype' or 'inactive',
    -- text = is_active() and ' %Y ' or '',
    text = is_active() and ' %{&ft} ' or '',
  }
end

_M.get_fileformat = function()
  return {
    state = is_active() and 'fileformat' or 'inactive',
    text = is_active() and ' %{&fenc?&fenc:&enc}[%{&ff}] ' or '',
  }
end

local get_diagnostic = function(prefix, severity)
  local count = lsp.diagnostic.get_count(0, severity)
  if count < 1 then return '' end
  return fmt(' %s:%d ', prefix, count)
end

_M.get_lsp_information = function()
  return {
    text = get_diagnostic('', 'Information'),
    state = 'information',
  }
end

_M.get_lsp_hint = function()
  return {
    text = get_diagnostic('', 'Hint'),
    state = 'hint',
  }
end

_M.get_lsp_warning = function()
  return {
    text = get_diagnostic('', 'Warning'),
    state = 'warning',
  }
end

_M.get_lsp_error = function()
  return {
    text = get_diagnostic('', 'Error'),
    state = 'error',
  }
end

return _M
