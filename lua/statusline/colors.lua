local _M = {}

local fmt = string.format

local hl = function(group, opts)
    opts.default = false
    vim.api.nvim_set_hl(0, group, opts)
end

local c = {
    bg     = "#2c323c",
    bg_nc  = "#5c6370",

    black  = "#282c34",
    red    = "#e06c75",
    green  = "#98c379",
    yellow = "#e5c07b",
    blue   = "#61afef",
    purple = "#c678dd",
    cyan   = "#56b6c2",
    white  = "#abb2bf",

    gray   = "#3e4452",
    orange = "#d19a66",
}

local hls = {
    NC = {
        inactive = {
            fg = c.black,
            bg = c.bg_nc,
        },
    },
    icon = {
        block = {
            fg = c.blue,
            bg = c.bg,
        },
        neovim = {
            fg = c.green,
            bg = c.bg,
        },
    },
    mode = {
        normal = {
            fg = c.black,
            bg = c.green,
            bold = true,
        },
        insert = {
            fg = c.black,
            bg = c.blue,
            bold = true,
        },
        replace = {
            fg = c.black,
            bg = c.red,
            bold = true,
        },
        visual = {
            fg = c.black,
            bg = c.purple,
            bold = true,
        },
        command = {
            fg = c.black,
            bg = c.cyan,
            bold = true,
        },
    },
    file = {
        indent = {
            fg = c.yellow,
            bg = c.bg,
            bold = true,
        },
        name = {
            fg = c.yellow,
            bg = c.bg,
        },
        info = {
            fg = c.yellow,
            bg = c.red,
            bold = true,
        },
        type = {
            fg = c.yellow,
            bg = c.bg,
            bold = true,
        },
        format = {
            fg = c.white,
            bg = c.gray,
            bold = true,
        },
    },
    lsp = {
        symbols = {
            fg = c.yellow,
            bg = c.bg,
        },
        info = {
            fg = c.green,
            bg = c.black,
            bold = true,
        },
        warn = {
            fg = c.orange,
            bg = c.black,
            bold = true,
        },
        error = {
            fg = c.red,
            bg = c.black,
            bold = true,
        },
    },
    git = {
        branch = {
            fg = c.black,
            bg = c.yellow,
        }
    },
    opt = {
        spell = {
            fg = c.black,
            bg = c.orange,
        },
    },
}

_M.setup_statusline_hl_groups = function()
    local group = vim.api.nvim_create_augroup("JSJ_statusline_colors", { clear = true })
    vim.api.nvim_create_autocmd({ "VimEnter", "ColorScheme" }, {
        pattern = "*",
        group = group,
        callback = function()
            hl("StatusLine", { bg = c.bg })
            hl("StatusLineNC", { bg = c.bg_nc })
            hl("StatusLineTerm", { link = "StatusLine" })
            hl("StatusLineTermNC", { link = "StatusLineNC" })
            hl("WinBar", { link = "StatusLine" })
            hl("WinBarNC", { link = "StatusLineNC" })
            for class, attr in pairs(hls) do
                for name, args in pairs(attr) do
                    local hlname = fmt("JSJ_statusline_%s_%s", class, name)
                    hl(hlname, args)
                end
            end
        end,
    })
end

return _M
