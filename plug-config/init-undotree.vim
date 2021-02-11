  " =======
  " undotree-config
  " =======
  let g:undotree_CustomUndotreeCmd  = 'topleft vertical 40 new'
  let g:undotree_CustomDiffpanelCmd = 'botright 10 new'
  let g:undotree_DiffAutoOpen = 1
  let g:undotree_SetFocusWhenToggle = 1
  let g:undotree_ShortIndicators = 1
  let g:undotree_HighlightChangedText = 1
  " =======
  " undotree-keymaps
  " =======
  nnoremap <silent> <leader>u :UndotreeToggle<cr>
