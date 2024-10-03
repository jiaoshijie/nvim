local colors = {
    -- onedark theme, only support gui colors
    black        = "#282C34",
    blue         = "#61AFEF",
    cyan         = "#56B6C2",
    green        = "#98C379",
    grey_comment = "#5C6370",
    grey_cursor  = "#2C323C",
    grey_menu    = "#3E4452",
    purple       = "#C678DD",
    red          = "#E06C75",
    dark_red     = "#BE5046",
    white        = "#ABB2BF",
    yellow       = "#E5C07B",
    dark_yellow  = "#D19A66",
    light_yellow = "#FAFF00",
    light_green  = "#00FF00",
    light_red    = "#FF0009",
}

local inactive = {
    fg = colors.black,
    bg = colors.grey_comment,
}

return {
    Icon = {
        Block = {
            fg = colors.blue,
            bg = colors.grey_cursor,
        },
        Icon = {
            fg = colors.green,
            bg = colors.grey_cursor,
        },
    },
    mode = {
        inactive = inactive,
        normal = {
            fg = colors.black,
            bg = colors.green,
            bold = true,
        },
        insert = {
            fg = colors.black,
            bg = colors.blue,
            bold = true,
        },
        replace = {
            fg = colors.black,
            bg = colors.red,
            bold = true,
        },
        visual = {
            fg = colors.black,
            bg = colors.purple,
            bold = true,
        },
        command = {
            fg = colors.black,
            bg = colors.cyan,
            bold = true,
        },
    },
    file = {
        inactive = inactive,
        space_or_tab = {
            fg = colors.yellow,
            bg = colors.grey_cursor,
            bold = true,
        },
        filename = {
            fg = colors.yellow,
            bg = colors.grey_cursor,
        },
        fileinfo = {
            fg = colors.yellow,
            bg = colors.red,
            bold = true,
        },
        filetype = {
            fg = colors.yellow,
            bg = colors.grey_cursor,
            bold = true,
        },
        fileformat = {
            fg = colors.white,
            bg = colors.grey_menu,
            bold = true,
        },
    },
    lsp = {
        component = {
            fg = colors.yellow,
            bg = colors.grey_cursor,
        },
        information = {
            fg = colors.blue,
            bg = colors.black,
            bold = true,
        },
        hint = {
            fg = colors.green,
            bg = colors.black,
            bold = true
        },
        warning = {
            fg = colors.dark_yellow,
            bg = colors.black,
            bold = true,
        },
        error = {
            fg = colors.red,
            bg = colors.black,
            bold = true,
        },
    },
    info = {
        spell = {
            fg = colors.black,
            bg = colors.dark_yellow,
        },
    },
    git = {
        branch = {
            fg = colors.black,
            bg = colors.yellow,
        }
    }
}
