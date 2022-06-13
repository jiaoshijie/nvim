local colors = { -- onedark theme, only support gui colors
  black = { gui = "#282C34" },
  blue = { gui = "#61AFEF" },
  cyan = { gui = "#56B6C2" },
  green = { gui = "#98C379" },
  grey_comment = { gui = "#5C6370" },
  grey_cursor = { gui = "#2C323C" },
  grey_menu = { gui = "#3E4452" },
  purple = { gui = "#C678DD" },
  red = { gui = "#E06C75" },
  dark_red = { gui = "#BE5046" },
  white = { gui = "#ABB2BF" },
  yellow = { gui = "#E5C07B" },
  dark_yellow = { gui = "#D19A66" },
  light_yellow = { gui = "#FAFF00" },
  light_green = { gui = "#00FF00" },
  light_red = { gui = "#FF0009" },
}

local inactive = {
  guifg = colors.black.gui,
  guibg = colors.grey_comment.gui,
}

return {
  ArchIcon = {
    ArchIcon = {
      guifg = colors.blue.gui,
      guibg = colors.grey_cursor.gui,
    },
  },
  mode = {
    inactive = inactive,
    normal = {
      guifg = colors.black.gui,
      guibg = colors.green.gui,
      gui = "bold",
      cterm = "NONE",
    },
    insert = {
      guifg = colors.black.gui,
      guibg = colors.blue.gui,
      gui = "bold",
      cterm = "NONE",
    },
    replace = {
      guifg = colors.black.gui,
      guibg = colors.red.gui,
      gui = "bold",
      cterm = "NONE",
    },
    visual = {
      guifg = colors.black.gui,
      guibg = colors.purple.gui,
      gui = "bold",
      cterm = "NONE",
    },
    command = {
      guifg = colors.black.gui,
      guibg = colors.cyan.gui,
      gui = "bold",
      cterm = "NONE",
    },
  },
  file = {
    inactive = inactive,
    space_or_tab = {
      guifg = colors.yellow.gui,
      guibg = colors.grey_cursor.gui,
      gui = "italic,bold",
      cterm = "NONE",
    },
    filename = {
      guifg = colors.yellow.gui,
      guibg = colors.grey_cursor.gui,
      gui = "italic",
      cterm = "NONE",
    },
    fileinfo = {
      guifg = colors.yellow.gui,
      guibg = colors.red.gui,
      gui = "bold",
      cterm = "NONE",
    },
    filetype = {
      guifg = colors.yellow.gui,
      guibg = colors.grey_cursor.gui,
      gui = "bold",
      cterm = "NONE",
    },
    fileformat = {
      guifg = colors.white.gui,
      guibg = colors.grey_menu.gui,
      gui = "bold",
      cterm = "NONE",
    },
  },
  lsp = {
    information = {
      guifg = colors.blue.gui,
      guibg = colors.black.gui,
      gui = "bold",
      cterm = "NONE",
    },
    hint = {
      guifg = colors.green.gui,
      guibg = colors.black.gui,
      gui = "bold",
      cterm = "NONE",
    },
    warning = {
      guifg = colors.dark_yellow.gui,
      guibg = colors.black.gui,
      gui = "bold",
      cterm = "NONE",
    },
    error = {
      guifg = colors.red.gui,
      guibg = colors.black.gui,
      gui = "bold",
      cterm = "NONE",
    },
  },
  info = {
    paste = {
      guifg = colors.black.gui,
      guibg = colors.dark_red.gui,
    },
    spell = {
      guifg = colors.black.gui,
      guibg = colors.dark_yellow.gui,
    },
  },
  git = {
    inactive = inactive,
    branch = {
      guifg = colors.white.gui,
      guibg = colors.grey_menu.gui,
      gui = "bold,italic",
      cterm = "NONE",
    },
    added = {
      guifg = colors.light_green.gui,
      guibg = colors.grey_menu.gui,
    },
    changed = {
      guifg = colors.light_yellow.gui,
      guibg = colors.grey_menu.gui,
    },
    removed = {
      guifg = colors.light_red.gui,
      guibg = colors.grey_menu.gui,
    },
  },
}
