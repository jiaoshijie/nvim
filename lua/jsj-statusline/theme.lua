local colors = {  -- onedark theme
  black        = { gui = '#282C34', cterm = '235' },
  blue         = { gui = '#61AFEF', cterm = '39' },
  cyan         = { gui = '#56B6C2', cterm = '38' },
  green        = { gui = '#98C379', cterm = '114' },
  grey_comment = { gui = '#5C6370', cterm = '59' },
  grey_cursor  = { gui = '#2C323C', cterm = '236' },
  grey_menu    = { gui = '#3E4452', cterm = '237' },
  purple       = { gui = '#C678DD', cterm = '170' },
  red          = { gui = '#E06C75', cterm = '204' },
  dark_red     = { gui = '#BE5046', cterm = '196' },
  white        = { gui = '#ABB2BF', cterm = '145' },
  yellow       = { gui = '#E5C07B', cterm = '180' },
  dark_yellow  = { gui = '#D19A66', cterm = '172' },
  light_yellow = { gui = '#FAFF00', cterm = '3' },
  light_green  = { gui = '#00FF00', cterm = '154' },
  light_red    = { gui = '#FF0009', cterm = '196' },
}

local inactive = {
  guifg = colors.black.gui,
  guibg = colors.grey_comment.gui,
  ctermfg = colors.black.cterm,
  ctermbg = colors.grey_comment.cterm,
}

return {
  ArchIcon = {
    ArchIcon = {
      guifg = colors.blue.gui,
      guibg = colors.grey_cursor.gui,
      ctermfg = colors.blue.cterm,
      ctermbg = colors.grey_cursor.cterm,
    },
  },
  mode = {
    inactive = inactive,
    normal = {
      guifg = colors.black.gui,
      guibg = colors.green.gui,
      ctermfg = colors.black.cterm,
      ctermbg = colors.green.cterm,
      gui = 'bold',
      cterm = 'bold'
    },
    insert = {
      guifg = colors.black.gui,
      guibg = colors.blue.gui,
      ctermfg = colors.black.cterm,
      ctermbg = colors.blue.cterm,
      gui = 'bold',
      cterm = 'bold'
    },
    replace = {
      guifg = colors.black.gui,
      guibg = colors.red.gui,
      ctermfg = colors.black.cterm,
      ctermbg = colors.red.cterm,
      gui = 'bold',
      cterm = 'bold'
    },
    visual = {
      guifg = colors.black.gui,
      guibg = colors.purple.gui,
      ctermfg = colors.black.cterm,
      ctermbg = colors.purple.cterm,
      gui = 'bold',
      cterm = 'bold'
    },
    command = {
      guifg = colors.black.gui,
      guibg = colors.cyan.gui,
      ctermfg = colors.black.cterm,
      ctermbg = colors.cyan.cterm,
      gui = 'bold',
      cterm = 'bold'
    },
  },
  file = {
    inactive = inactive,
    filename = {
      guifg = colors.yellow.gui,
      guibg = colors.grey_cursor.gui,
      ctermfg = colors.yellow.cterm,
      ctermbg = colors.grey_cursor.cterm,
      gui = 'italic',
      cterm = 'italic',
    },
    fileinfo = {
      guifg = colors.yellow.gui,
      guibg = colors.red.gui,
      ctermfg = colors.yellow.cterm,
      ctermbg = colors.red.cterm,
      gui = 'bold',
      cterm = 'bold',
    },
    filetype = {
      guifg = colors.yellow.gui,
      guibg = colors.grey_cursor.gui,
      ctermfg = colors.yellow.cterm,
      ctermbg = colors.grey_cursor.cterm,
      gui = 'bold',
      cterm = 'bold',
    },
    fileformat = {
      guifg = colors.white.gui,
      guibg = colors.grey_menu.gui,
      ctermfg = colors.white.cterm,
      ctermbg = colors.grey_menu.cterm,
      gui = 'bold',
      cterm = 'bold',
    },
  },
  lsp = {
    information = {
      guifg = colors.blue.gui,
      guibg = colors.black.gui,
      ctermfg = colors.blue.cterm,
      ctermbg = colors.black.cterm,
      gui = 'bold',
      cterm = 'bold',
    },
    hint = {
      guifg = colors.green.gui,
      guibg = colors.black.gui,
      ctermfg = colors.green.cterm,
      ctermbg = colors.black.cterm,
      gui = 'bold',
      cterm = 'bold',
    },
    warning = {
      guifg = colors.dark_yellow.gui,
      guibg = colors.black.gui,
      ctermfg = colors.dark_yellow.cterm,
      ctermbg = colors.black.cterm,
      gui = 'bold',
      cterm = 'bold',
    },
    error = {
      guifg = colors.red.gui,
      guibg = colors.black.gui,
      ctermfg = colors.red.cterm,
      ctermbg = colors.black.cterm,
      gui = 'bold',
      cterm = 'bold',
    },
  },
  info = {
    paste = {
      guifg = colors.black.gui,
      guibg = colors.dark_red.gui,
      ctermfg = colors.black.cterm,
      ctermbg = colors.dark_red.cterm,
    },
    spell = {
      guifg = colors.black.gui,
      guibg = colors.dark_yellow.gui,
      ctermfg = colors.black.cterm,
      ctermbg = colors.dark_yellow.cterm,
    },
  },
  git = {
    inactive = inactive,
    branch = {
      guifg = colors.white.gui,
      guibg = colors.grey_menu.gui,
      ctermfg = colors.white.cterm,
      ctermbg = colors.grey_menu.cterm,
      gui = 'bold,italic',
      cterm = 'bold,italic',
    },
    added = {
      guifg = colors.light_green.gui,
      guibg = colors.grey_menu.gui,
      ctermfg = colors.light_green.cterm,
      ctermbg = colors.grey_menu.cterm,
    },
    changed = {
      guifg = colors.light_yellow.gui,
      guibg = colors.grey_menu.gui,
      ctermfg = colors.light_yellow.cterm,
      ctermbg = colors.grey_menu.cterm,
    },
    removed = {
      guifg = colors.light_red.gui,
      guibg = colors.grey_menu.gui,
      ctermfg = colors.light_red.cterm,
      ctermbg = colors.grey_menu.cterm,
    },
  }
}
