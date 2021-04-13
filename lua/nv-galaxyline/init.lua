local gl = require('galaxyline')
-- local colors = require('galaxyline.theme').default
local colors = {
    -- bg = '#292D38',
    bg = '#4b5263',
    yellow = '#DCDCAA',
    dark_yellow = '#D7BA7D',
    cyan = '#4EC9B0',
    green = '#608B4E',
    light_green = '#B5CEA8',
    string_orange = '#CE9178',
    orange = '#FF8800',
    purple = '#C586C0',
    magenta = '#D16D9E',
    grey = '#858585',
    blue = '#569CD6',
    vivid_blue = '#4FC1FF',
    light_blue = '#9CDCFE',
    red = '#D16969',
    error_red = '#F44747',
    info_yellow = '#FFCC66'
}
local fileinfo = require('galaxyline.provider_fileinfo')
local condition = require('galaxyline.condition')
local gls = gl.section

gl.short_line_list = {'NvimTree', 'vista', 'dbui', 'packer'}

gls.left[0] = {
  NoneSpace = {
    provider = function() return '▊' end,
    highlight = {'#A719E5', colors.bg},
    separator = '  ',
    separator_highlight = {colors.blue, colors.bg},
  }
}

gls.left[1] = {
    ViMode = {
        provider = function()
            -- auto change color according the vim mode
            local mode_color = {
                n = {colors.green, 'NORMAL '},
                i = {colors.vivid_blue, 'INSERT '},
                v = {colors.purple, 'VISUAL '},
                V = {colors.purple, 'V•LINE '},
                [''] = {colors.purple, 'V•BLOCK '},
                R = {colors.red, 'REPLACE '},
                Rv = {colors.red, 'V•REPLACE '},
                t = {colors.green, 'TERMINAL '}
            }
            vim.api.nvim_command('hi GalaxyViMode gui=bold guifg=#080808 guibg=' ..
            (mode_color[vim.fn.mode()] or mode_color['n'])[1])
            return (mode_color[vim.fn.mode()] or mode_color['n'])[2]
        end,
        icon = ' ',
        separator = '%< ',
        separator_highlight = {'None', colors.bg}
    }
}

gls.left[2] = {
  FileName = {
    provider = 'FileName',
    icon = fileinfo.get_file_icon(),
    separator = '',
    highlight = {colors.orange, colors.bg},
    separator_highlight = {'None', colors.bg},
    condition = condition.buffer_not_empty,
  }
}

gls.left[3] = {
    GitIcon = {
        provider = function()
            return ''
        end,
        condition = condition.check_git_workspace,
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.info_yellow, colors.bg}
    }
}

gls.left[4] = {
    GitBranch = {
        provider = 'GitBranch',
        condition = condition.check_git_workspace,
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.cyan, colors.bg}
    }
}

gls.right[1] = {
  FileEncode = {
    provider = 'FileEncode',
    separator = ' ',
    highlight = {colors.grey, colors.bg, 'bold'},
    condition = condition.hide_in_width,
    separator_highlight = {'None', colors.bg}
  }
}

gls.right[2] = {
  FileFormat = {
    provider = 'FileFormat',
    separator = ' ',
    highlight = {colors.grey, colors.bg, 'bold'},
    condition = condition.hide_in_width,
    separator_highlight = {'None', colors.bg}
  }
}

gls.right[3] = {
  FileTypeName = {
    provider = 'FileTypeName',
    separator = ' ',
    highlight = {colors.dark_yellow, colors.bg, 'bold'},
    separator_highlight = {'None', colors.bg},
    condition = condition.buffer_not_empty,
  }
}

gls.right[4] = {
  LinePercent = {
    provider = 'LinePercent',
    separator = ' ',
    highlight = {colors.light_blue, colors.bg, 'bold,italic'},
    separator_highlight = {'None', colors.bg}
  }
}

gls.right[5] = {
  LineColumn = {
    provider = 'LineColumn',
    separator = ' ',
    icon = '並',
    highlight = {colors.vivid_blue, colors.bg, 'bold'},
    separator_highlight = {'None', colors.bg}
  }
}

gls.right[6] = {
  ScrollBar = {
    provider = 'ScrollBar',
    separator = '/%L ',
    highlight = {colors.orange , colors.purple},
    separator_highlight = {colors.vivid_blue, colors.bg, 'bold'}
  }
}

gls.mid[1] = {
  GetLspClient = {
    provider = 'GetLspClient',
    icon = ' LSP: ',
    highlight = {colors.grey, colors.bg},
    condition = condition.hide_in_width,
  }
}

gls.mid[2] = {
    DiagnosticError = {
      provider = 'DiagnosticError',
      icon = '   ',
      highlight = {colors.error_red, colors.bg}}
}
gls.mid[3] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = '   ',
    highlight = {colors.orange, colors.bg}
  }
}

gls.mid[4] = {
    DiagnosticHint = {
      provider = 'DiagnosticHint', 
      icon = '   ', 
      highlight = {colors.vivid_blue, colors.bg}
    }
}

gls.mid[5] = {
  DiagnosticInfo = {
    provider = 'DiagnosticInfo',
    icon = '   ',
    highlight = {colors.info_yellow, colors.bg}
  }
}


gls.short_line_left[1] = {
    SFileName = {
      provider = 'FileName',
      condition = condition.buffer_not_empty,
      highlight = {colors.grey, colors.bg}
    }
}

gls.short_line_left[2] = {
    SBufferTypeName = {
        provider = 'FileTypeName',
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.grey, colors.bg}
    }
}

gls.short_line_right[1] = {
  SLineColumn = {
    provider = 'LineColumn',
    highlight = {colors.grey, colors.bg},
    condition = condition.buffer_not_empty,
  }
}
