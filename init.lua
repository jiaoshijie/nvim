local o = vim.opt
local ol = vim.opt_local
local vf = vim.fn
local api = vim.api
local autocmd = api.nvim_create_autocmd
local command = vim.api.nvim_create_user_command
local keymap = vim.keymap.set
local keymap_opts = { noremap = true, silent = true }

o.modeline = false
o.modelines = 0

vim.g.loaded_python_provider = 0  -- To disable Python2 support
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0    -- To disable Perl support
vim.g.loaded_ruby_provider = 0    -- To disable Ruby support
vim.g.loaded_python3_provider = 0 -- To disable Python3 support

vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- NOTE: basic keymaps
keymap({ "", "i" }, "<C-j>", "<C-[>", keymap_opts)
keymap("n", "s", "<Nop>", { noremap = true })
keymap("n", "S", "<Nop>", { noremap = true })
keymap("n", "C", "<Nop>", { noremap = true })
keymap({"n", "v"}, "<Space>", "<NOP>", keymap_opts)
keymap("v", "J", ":m '>+1<cr>gv=gv", keymap_opts)
keymap("v", "K", ":m '<-2<cr>gv=gv", keymap_opts)
keymap("n", "<leader><leader>", "<C-^>", keymap_opts)
keymap("n", "<leader>/", "/\\<\\><left><left>", { noremap = true })  -- NOTE: `:h pattern.txt{magic}` `:h :substitute`
keymap("n", "<leader>ps", ":setlocal spell! spelllang=en_us<CR>", keymap_opts)
keymap("n", "Q", "q:", keymap_opts)
keymap("t", "<Esc>", "<C-\\><C-n>", keymap_opts)

-- NOTE: netrw
-- https://vonheikemen.github.io/devlog/tools/using-netrw-vim-builtin-file-explorer/
vim.g.netrw_banner = 0    -- disable annoying banner
vim.g.netrw_browse_split = 0
vim.g.netrw_altv = 1      -- open splits to the right
vim.g.netrw_alto = 0
vim.g.netrw_liststyle = 0 -- tree view
vim.g.netrw_winsize = 25
vim.g.netrw_preview = 1
vim.g.netrw_hide = 1
vim.g.netrw_keepdir = 1
vim.g.netrw_list_hide = "\\(^\\|\\s\\s\\)\\zs\\.\\S\\+"
vim.g.netrw_localcopycmd = "cp"
vim.g.netrw_localcopycmdopt = ""
vim.g.netrw_localcopydircmd = "cp"
vim.g.netrw_localcopydircmdopt = "-r"
vim.g.netrw_localmkdir = "mkdir"
vim.g.netrw_localmkdiropt = ""
vim.g.netrw_localmovecmd = "mv"
vim.g.netrw_localmovecmdopt = ""
-- NOTE: the `g:netrw_localrmdir` is no longer used, use vim's delete() function instead
-- NOTE: :h netrw
-- vim.g.netrw_localrmdir = "rm"
-- vim.g.netrw_localrmdiropt = "-r"

-- misc
o.mousemodel = "extend"
o.title = true
o.wrap = false
o.formatoptions:remove({ "c", "t" })
o.hidden = true
o.confirm = true
o.lazyredraw = true
o.nrformats = ""   -- For <C-a> and <C-x>
o.diffopt = "vertical,filler,context:3,foldcolumn:1,internal,algorithm:histogram,indent-heuristic"  -- TODO: `:h diffopt` linematch
vim.g.editorconfig = true  -- EditorConfig  `:h editorconfig`
o.colorcolumn = "79"
o.scrolloff = 6
o.splitright = true
o.splitbelow = true
o.laststatus = 3

-- NOTE: completion
o.completeopt = "menuone,noselect"
o.dictionary = "/usr/share/dict/words"
o.complete = ".,w,b"
o.path:append("**")
o.pumblend = 30
o.ph = 15
o.shortmess:append("c")
o.wildignore:append("*.o,*.a,*.so")

-- NOTE: search
o.ignorecase = true
o.smartcase = true

-- NOTE: indent
o.smartindent = true
o.smarttab = true
o.shiftwidth = 4  -- set the indent width
o.tabstop = 4  -- A single <tab> character '\t' should take how many normal character length
o.expandtab = true  -- When expandtab is on, how many space a tab should represent
o.softtabstop = 4  -- When on, a <tab> press in the begin of the line is base on `shiftwidth`, not `tabstop` or `softtabstop`
o.shiftround = true  -- for `<<` and `>>` in normal mode

-- NOTE: substitute
o.inccommand = "split"

-- NOTE: quickfix
o.switchbuf = "useopen"

-- NOTE: only use undofile
o.backup = false
o.swapfile = false
o.undofile = true
o.undodir = "/tmp/jsj_neovim_u/undodir//"

-- NOTE: colorscheme
o.signcolumn = "no"
o.cursorline = true
o.list = true
o.listchars = { trail = "·", tab = "» ", extends = "…", precedes = "…" }
o.termguicolors = true
o.background = "dark"
local jsj_colorscheme_autogroup = api.nvim_create_augroup("JSJ_colorscheme_autogroup", { clear = true })
local jsj_normal_hl = {}  -- after nvim startup, this variable will not be empty anymore
local jsj_change_theme_alpha = false
vim.api.nvim_create_autocmd("ColorScheme", {
    group = jsj_colorscheme_autogroup,
    pattern = "*",
    callback = function()
        jsj_normal_hl = {
            fg = vim.fn.synIDattr(vim.fn.hlID("Normal"), "fg", "gui"),
            bg = vim.fn.synIDattr(vim.fn.hlID("Normal"), "bg", "gui"),
            default = false,
        }
        if jsj_change_theme_alpha then
            api.nvim_set_hl(0, "Normal", { fg = jsj_normal_hl.fg, bg = "NONE", default = false })
        end
    end,
})
keymap("n", "<leader>tt", function()
    if not jsj_change_theme_alpha then
        jsj_change_theme_alpha = true
        jsj_normal_hl = {
            fg = vf.synIDattr(vf.hlID("Normal"), "fg", "gui"),
            bg = vf.synIDattr(vf.hlID("Normal"), "bg", "gui"),
            default = false,
        }
        api.nvim_set_hl(0, "Normal", { fg = jsj_normal_hl.fg, bg = "NONE", default = false })
    else
        JSJ_change_theme_alpha = false
        api.nvim_set_hl(0, "Normal", jsj_normal_hl)
    end
    api.nvim_set_hl(0, "SignColumn", { link = "LineNr", default = false })
end, keymap_opts)
require('statusline').setup()
vim.cmd.colorscheme("gruvbox")

-- NOTE: autogroups
local JSJ_useful_autogroup = api.nvim_create_augroup("JSJ_useful_autogroup", { clear = true })
autocmd("BufReadPost", {
    pattern = "*",
    group = JSJ_useful_autogroup,
    command = [[if &ft !~# 'commit\|rebase' && line("'\"") > 1 && line("'\"") <= line("$") | exe 'normal! g`"' | endif]],
})
autocmd("TermOpen", {
    pattern = "*",
    group = JSJ_useful_autogroup,
    callback = function()
        ol.number = false
        ol.relativenumber = false
        ol.signcolumn = "no"
    end,
})
autocmd("TextYankPost", {
    pattern = "*",
    group = JSJ_useful_autogroup,
    callback = function()
        vim.highlight.on_yank({ higourp = "IncSearch", timeout = 300 })
    end,
})


-- NOTE: commands
command("AI", [[echo "I want AI to do my laundry and dishes so that I can do art and writing, not for AI to do my art and writing so that I can do my laundry and dishes."]], { nargs = 0 })
command("Cc", function() vf.setreg('+', vf.getreg('0')) end, { nargs = 0 })
command("SudoWrite", require("sudo").sudo_write, { nargs = 0 })
local copy_file_path = function(flag)
    -- flag:
    --    't' : only file name
    --    nil : relative file path
    --    'p' : absoulte file path
    --    other: Error but no checking
    local path = flag and vf.expand("%:" .. flag) or vf.expand("%")
    if #path ~= 0 then
        vf.setreg('+', path)
        print("File Path Copied: " .. path)
    else
        api.nvim_err_writeln("No file opened in this buffer!!!")
    end
end
command("Yf", function() copy_file_path("t") end, { nargs = 0 })
command("Yr", function() copy_file_path(nil) end, { nargs = 0 })
command("Yp", function() copy_file_path("p") end, { nargs = 0 })
command("Todo", function()
    if vim.fn.filereadable(vim.fn.expand("~/Downloads/GDrive/todo.md")) == 1 then
        vim.cmd(":edit ~/Downloads/GDrive/todo.md")
    else
        vim.api.nvim_err_writeln("File `~/Downloads/GDrive/todo.md` doesn't exist or is not readable!!!")
    end
end, { nargs = 0 })
command("Glow", function()
    if vim.o.filetype == "markdown" then
        if vim.fn.executable('glow') == 1 then
            vim.cmd("tabnew term://glow %:p -w " .. (vim.o.columns - 4))
        else
            api.nvim_err_writeln("ERROR: `glow` is not executable!!!")
        end
    else
        api.nvim_err_writeln("ERROR: only support `markdown` file!!!")
    end
end, { nargs = 0 })
-- command("Vterm", "vsplit term://" .. vim.fn.expand("$SHELL"), { nargs = 0 })
-- command("Hterm", "split term://" .. vim.fn.expand("$SHELL"), { nargs = 0 })
-- command("Tterm", "tabnew term://" .. vim.fn.expand("$SHELL"), { nargs = 0 })


-- NOTE: keymaps
keymap("n", "<leader>fc", function()
    local l, c = vf.line("."), vf.col(".")
    vim.cmd([[%s/\s\+$//ge]])
    vim.cmd([[%s/\(\n\)\+\%$//ge]])
    vf.cursor({ l, c })
    vim.cmd.nohlsearch()
end, keymap_opts)
-- quickfix list
local toggle_list = function(listname, perfix)
    if #vf.filter(vf.getwininfo(), "v:val." .. listname) == 0 then
        xpcall(api.nvim_exec2, function()
            api.nvim_err_writeln("Location List is Empty.")
        end, perfix .. "open", { output = false })
    else
        api.nvim_exec2(perfix .. "close", { output = false })
    end
end
keymap("n", "<leader>qq", function()
    toggle_list("quickfix", "c")
end, keymap_opts)
keymap("n", "<leader>ql", function()
    toggle_list("loclist", "l")
end, keymap_opts)

-------------------------------------------------------------------------------

require("lsp")
require("pkg")

-------------------------------------------------------------------------------

if vim.fn.filereadable(vim.fn.expand('~/.nvimrc')) == 1 then
    vim.cmd('so ~/.nvimrc')
end

if vim.fn.filereadable('./.nvimrc') == 1 then
    vim.cmd('so ./.nvimrc')
end
