require('mini.surround').setup({
    mappings = {
      add = 'ys',
      delete = 'ds',
      find = '',
      find_left = '',
      highlight = '',
      replace = 'cs',
      update_n_lines = '',

      -- Add this only if you don't want to use extended mappings
      suffix_last = '',
      suffix_next = '',
    },
    search_method = 'cover_or_next',
})

vim.keymap.del('x', 'ys')
vim.keymap.set('x', 'S', [[:<C-u>lua MiniSurround.add('visual')<CR>]], { noremap = true })
