-- vim.g.nvim_tree_disable_netrw = 0 -- 1 by default, disables netrw
vim.cmd([[let g:nvim_tree_disable_netrw = 0]])
-- vim.g.nvim_tree_hijack_netrw = 0 -- 1 by default, prevents netrw from automatically opening when opening directories (but lets you keep its other utilities)
vim.cmd([[let g:nvim_tree_hijack_netrw = 0]])
vim.g.nvim_tree_ignore = { '.git', 'node_modules' }
vim.g.nvim_tree_auto_open = 0
vim.g.nvim_tree_auto_close = 0  -- 0 by default, closes the tree when it's the last window
vim.g.nvim_tree_indent_markers = 1  -- 0 by default, this option shows indent markers when folders are open
vim.g.nvim_tree_width_allow_resize  = 1  -- 0 by default, will not resize the tree when opening a file
vim.g.nvim_tree_add_trailing = 1  -- 0 by default, append a trailing slash to folder names
vim.g.nvim_tree_group_empty = 1  -- 0 by default, compact folders that only contain a single folder into one node in the file tree
vim.g.nvim_tree_icons = {
    default = '',
    symlink = '',
    git = {
        unstaged = "",
        staged = "✓",
        unmerged = "",
        renamed = "➜",
        untracked = ""
    },
    folder = {
        default = "",
        open = "",
        empty = "",
        empty_open = "",
        symlink = ""
    }
}

-- nnoremap <C-n> :NvimTreeToggle<CR>
-- nnoremap <leader>r :NvimTreeRefresh<CR>
-- nnoremap <leader>n :NvimTreeFindFile<CR>

-- vim.g.nvim_tree_disable_keybindings=1

local tree_cb = require'nvim-tree.config'.nvim_tree_callback

vim.g.nvim_tree_bindings = {
    -- mappings
    ["<CR>"] = tree_cb("cd"),
    ["l"] = tree_cb("edit"),
    ["v"] = tree_cb("vsplit"),
    ["s"] = tree_cb("split"),
    ["<C-t>"] = tree_cb("tabnew"),
    ["h"] = tree_cb("close_node"),
    ["<BS>"] = tree_cb("dir_up"),
    ["<Tab>"] = tree_cb("preview"),
    ["I"] = tree_cb("toggle_ignored"),
    ["H"] = tree_cb("toggle_dotfiles"),
    ["R"] = tree_cb("refresh"),
    ["a"] = tree_cb("create"),
    ["d"] = tree_cb("remove"),
    ["r"] = tree_cb("rename"),
    ["<C-r>"] = tree_cb("full_rename"),
    ["x"] = tree_cb("cut"),
    ["c"] = tree_cb("copy"),
    ["p"] = tree_cb("paste"),
    ["[c"] = tree_cb("prev_git_item"),
    ["]c"] = tree_cb("next_git_item"),
    ["q"] = tree_cb("close")
}

vim.api.nvim_set_keymap('n', 'tt', ':NvimTreeToggle<CR>', { noremap = true })
