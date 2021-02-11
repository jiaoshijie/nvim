  " =======
  " nerdcommenter-config
  " =======
  let g:NERDCreateDefaultMappings = 0
  let g:NERDSpaceDelims = 1
  let g:NERDDefaultAlign = 'left'
  let g:NERDCompactSexyComs = 1
  let g:NERDToggleCheckAllLines = 1
  let g:NERDCustomDelimiters = { 'c': { 'left': '//' } }
  " =======
  " nerdcommenter-keymaps
  " =======
  nmap <silent> <leader>cc <plug>NERDCommenterToggle
  vmap <silent> <leader>cc <plug>NERDCommenterToggle
  nmap <silent> <leader>ca <plug>NERDCommenterAppend
  nmap <silent> <leader>cA <plug>NERDCommenterAltDelims
