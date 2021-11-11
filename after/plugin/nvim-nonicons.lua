local fn = vim.fn

if fn.expand('$TERM') == 'xterm-kitty' then
  vim.cmd 'packadd nvim-nonicons'
end
