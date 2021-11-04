require("which-key").setup {
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
            operators = true, -- adds help for operators like d, y, ...
            motions = true, -- adds help for motions
            text_objects = true, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true -- bindings for prefixed with g
        }
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "→", -- symbol used between a key and it's label
        group = "+" -- symbol prepended to a group
    },
    window = {
        border = "single", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = {1, 0, 1, 0}, -- extra window margin [top, right, bottom, left]
        padding = {2, 2, 2, 2} -- extra window padding [top, right, bottom, left]
    },
    layout = {
        height = {min = 4, max = 25}, -- min and max height of the columns
        width = {min = 20, max = 50}, -- min and max width of the columns
        spacing = 3 -- spacing between columns
    },
    hidden = {"<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
    show_help = true -- show help message on the command line when the popup is visible
}

local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false -- use `nowait` when creating keymaps
}

local mappings = {
  ["/"] = "Search single word",
  ["="] = "Format Code",
  ["<CR>"] = "Cancel search highlight",
  -- ["o"] = "Toggle English syntax check",
  ["s"] = "Search current dir",
  ["S"] = "Search current file",
  ["u"] = "Unlink LuaSnip",
  b = {
    name = "+Buffer",
    ["d"] = "Delete current buffer",
    ["b"] = "Chanage buffer",
  },
  c = {
    name = "+Code",
    ["f"] = "Lsp tags",
    ["t"] = "Ctags",
    ["r"] = "Lsp rename",
    ["z"] = "Fold code",
    ["="] = "Lsp format code",
    ["a"] = "Lsp action",
    ["c"] = "Add quick running keymap(F5 to run)",
    e = {
      name = "+Error & Warning",
      ["e"] = "Show error info in line",
      ["a"] = "Search all error in the file",
      ["A"] = "Search all error in the workspace",
      ["p"] = "Jump to prev error",
      ["n"] = "Jump to next error",
    },
  },
  e = {
    name = "+Encode",
    ["g"] = "Change file encode to gbk",
    ["u"] = "Change file encode to utf8",
  },
  f = {
    name = "+File",
    ["c"] = "Clean the space of the end of the line",
    ["f"] = "Search all files in current dir",
    ["g"] = "Git files",
    ["m"] = "Open My Own Notes",
    ["r"] = "Search history files",
    ["b"] = "File browser",
    ["o"] = "Open nvim config file",
  },
  g = {
    name = "+Git",
    ["a"] = "Stage this hunk",
    ["n"] = "Next hunk",
    ["p"] = "Prev hunk",
    ["s"] = "Select hunk",
    ["P"] = "Perview hunk",
    ["B"] = "Stage all hunk in this buffer",
    ["b"] = "Toggle blame line",
    ["h"] = "Toggle highlight hunk line",
    u = {
      name = "+Git UnStage",
      ['a'] = "undo stage hunk",
      ['b'] = "undo all stage hunk in this buffer",
    }
  },
  p = {
    name = "+Spell & Project",
    ["c"] = "Open Code dir",
    ["a"] = "Lsp add workspace folder",
    ["r"] = "Lsp remove workspace folder",
    ["l"] = "Lsp print workspace folder",
    ['s'] = "Toggle English syntax check",
  },
  ["P"] = "Preview image under the cursor",
  t = {
    name = "+Tab & Theme",
    ["o"] = "Close other tabs",
    ["d"] = "Close current tab",
    ["t"] = "Toggle background Color",
  },
  w = {
    name = "+Window",
    ["o"] = "Close other windows",
    ["d"] = "Close current window",
    ["/"] = "split current window vertically",
    ["-"] = "split current window",
  },
  x = {
    name = "+Hex & Text",
    ["d"] = "Change to hex mode",
    ["r"] = "Change to Text mode",
  },
  q = {
    name = "+Quickfix & Localist",
    ["q"] = "Toggle Quickfix",
    ["l"] = "Toggle Localist",
  },
  n = {
    name = "+Treesitter"
  },
  v = {
    name = "+Vista",
    ["v"] = "find workspace symbols",
    ["l"] = "find local flie symbols",
  },
  m = {
    name = "+Mark",
    ["m"] = "show all marks",
  },
  r = {
    name = "+Replace",
    ["r"] = "open replace buffer",
    ["w"] = "open replace buffer with word under the curosr",
    ["l"] = "open replace buffer in current file",
  },
}

local wk = require("which-key")
wk.register(mappings, opts)
