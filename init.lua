local o = vim.opt
local vf = vim.fn
local api = vim.api
local autocmd = api.nvim_create_autocmd
local command = vim.api.nvim_create_user_command
local keymap = vim.keymap.set
local keymap_opts = { silent = true }
local kit = require('kit')
local fmt = string.format

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
keymap("n", "s", "<Nop>")
keymap("n", "S", "<Nop>")
keymap("n", "C", "<Nop>")
keymap("n", "<C-f>", "<Nop>")  -- only use <C-u>
keymap("n", "<C-b>", "<Nop>")  -- only use <C-d>
keymap({"n", "v"}, "<Space>", "<NOP>", keymap_opts)
keymap("v", "J", ":m '>+1<cr>gv=gv", keymap_opts)
keymap("v", "K", ":m '<-2<cr>gv=gv", keymap_opts)
keymap("n", "<leader><leader>", "<C-^>", keymap_opts)
keymap("n", "<leader>/", [[/\<\><left><left>]])  -- NOTE: `:h pattern.txt{magic}` `:h :substitute`
keymap("n", "<leader>ps", "<Cmd>setlocal spell! spelllang=en_us<CR>", keymap_opts)
keymap("n", "Q", "q:", keymap_opts)
keymap("t", "<Esc>", [[<C-\><C-n>]], keymap_opts)
-- https://www.reddit.com/r/neovim/comments/1kv7som/search_within_selection_in_neovim/
keymap('x', '/', [[<C-\><C-n>`</\%V]], { desc = 'Search forward within visual selection' })
keymap('x', '?', [[<C-\><C-n>`>?\%V]], { desc = 'Search backward within visual selection' })

-- NOTE: netrw
-- https://vonheikemen.github.io/devlog/tools/using-netrw-vim-builtin-file-explorer/
vim.g.netrw_banner = 0    -- disable annoying banner
vim.g.netrw_browse_split = 0
vim.g.netrw_liststyle = 0 -- tree view
vim.g.netrw_keepdir = 1
vim.g.netrw_hide = 1
vim.g.netrw_list_hide = [[\(^\|\s\s\)\zs\.\S\+]]
vim.g.netrw_dirhistmax = 0  -- disable history (unfortunately, bookmark also being disable)

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
o.fileencodings = "ucs-bom,utf-8,cp936,default,latin1"  -- NOTE: cp936 is a superset of gbk
o.foldenable = false
o.updatetime = 500   -- 1. CursorHold event 2. write back swap file(not used) to disk
o.exrc = true
o.secure = true
o.sessionoptions:append('localoptions')

-- NOTE: completion
o.completeopt = "menuone,noselect"
o.dictionary = "/usr/share/dict/words"
o.complete = ".,w,b"
o.path:append("**")
o.pumblend = 7
o.pumborder = "bold"
o.ph = 15
o.shortmess:append("c")
o.wildignore:append("*.o,*.a,*.so,tags")

-- NOTE: search
o.ignorecase = true
o.smartcase = true

-- NOTE: indent
o.expandtab = true  -- When expandtab is on, how many space a tab should represent
o.shiftwidth = 4  -- set the indent width
o.tabstop = 4  -- A single <tab> character '\t' should take how many normal character length
o.softtabstop = 4  -- When on, a <tab> press in the begin of the line is base on `shiftwidth`, not `tabstop` or `softtabstop`
o.smartindent = true
o.smarttab = true
o.shiftround = true  -- for `<<` and `>>` in normal mode

-- NOTE: substitute
o.inccommand = "nosplit"  -- explicitly disable this

-- NOTE: quickfix
o.switchbuf = "uselast"

-- NOTE: only use undofile
o.backup = false
o.swapfile = false
o.undofile = true
o.undodir = string.format("/tmp/.nvim-%d-undodir", vim.uv.getuid())

-- NOTE: colorscheme
o.signcolumn = "no"
o.cursorline = true
o.list = true
o.listchars = { trail = "·", tab = "» ", extends = "…", precedes = "…" }
o.termguicolors = true
o.background = "dark"
local jsj_colorscheme_autogroup = api.nvim_create_augroup("JSJ_colorscheme_augroup", { clear = true })
vim.api.nvim_create_autocmd("ColorScheme", {
    group = jsj_colorscheme_autogroup,
    pattern = "*",
    callback = kit.colorscheme_change_cb,
})
keymap("n", "<leader>tt", kit.toggle_theme_transparent, keymap_opts)
require('statusline').setup()
vim.cmd.colorscheme("jsj")

-- NOTE: autogroups
local JSJ_useful_autogroup = api.nvim_create_augroup("JSJ_useful_augroup", { clear = true })
autocmd("BufReadPost", {
    pattern = "*",
    group = JSJ_useful_autogroup,
    callback = function()
        local r_c = vim.api.nvim_buf_get_mark(0, '"')
        local max_lnum = vim.api.nvim_buf_line_count(0)
        if r_c[1] > 0 and r_c[1] <= max_lnum then
            pcall(vim.api.nvim_win_set_cursor, 0, r_c)
        end
    end
})
autocmd("TextYankPost", {
    pattern = "*",
    group = JSJ_useful_autogroup,
    callback = function()
        vim.hl.on_yank({ higroup = "IncSearch", timeout = 300 })
    end,
})

-- NOTE: commands
command("AI", [[echo "I want AI to do my laundry and dishes so that I can do art and writing, not for AI to do my art and writing so that I can do my laundry and dishes."]], { nargs = 0 })
command("Cc", function(args) vf.setreg('+', vf.getreg(args.reg == "" and "0" or args.reg)) end, { nargs = 0, register = true })
command("SudoWrite", kit.sudo_write, { nargs = 0 })
command("Yf", function() kit.copy_file_path_lnum("t") end, { nargs = 0 })
command("Yr", function() kit.copy_file_path_lnum(nil) end, { nargs = 0 })
command("Yp", function() kit.copy_file_path_lnum("p") end, { nargs = 0 })
command("Df", function() kit.copy_file_path_lnum("t", true) end, { nargs = 0 })
command("Dr", function() kit.copy_file_path_lnum(nil, true) end, { nargs = 0 })
command("E", [[e %:h]], { nargs = 0 })
command("Todo", kit.edit_my_todolist, { nargs = 0 })

-- NOTE: keymaps
keymap("n", "<leader>fc", kit.clean_trailing_spaces_and_lines, keymap_opts)
keymap("n", "<leader>qq", function() kit.toggle_qf_list("quickfix", "c") end, keymap_opts)
keymap("n", "<leader>ql", function() kit.toggle_qf_list("loclist", "l") end, keymap_opts)

-----------------------------> diagnostic <------------------------------------
vim.diagnostic.config({
    virtual_text = true,
    virtual_lines = false,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "E",
            [vim.diagnostic.severity.WARN]  = "W",
            [vim.diagnostic.severity.HINT] = "",
            [vim.diagnostic.severity.INFO] = "",
        }
    },
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
        border = "rounded",
    },
})

--------------------------------> lsp <----------------------------------------

-- https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#completionItemKind
-- https://code.visualstudio.com/api/references/icons-in-labels
vim.lsp.protocol.CompletionItemKind = {
    [1]  = "  (Text) ",
    [2]  = "  (Method)",
    [3]  = "  (Function)",
    [4]  = "  (Constructor)",
    [5]  = "  (Field)",
    [6]  = "  (Variable)",
    [7]  = "  (Class)",
    [8]  = "  (Interface)",
    [9]  = "  (Module)",
    [10] = "  (Property)",
    [11] = "  (Unit)",
    [12] = "  (Value)",
    [13] = "  (Enum)",
    [14] = "  (Keyword)",
    [15] = "  (Snippet)",
    [16] = "  (Color)",
    [17] = "  (File)",
    [18] = "  (Reference)",
    [19] = "  (Folder)",
    [20] = "  (EnumMember)",
    [21] = "  (Constant)",
    [22] = "  (Struct)",
    [23] = "  (Event)",
    [24] = "  (Operator)",
    [25] = "  (TypeParameter)",
}
-- NOTE: using `exrc` to auto enable other configured lsps
-- `shellcheck` is more useful than lsp for shell
vim.lsp.enable({ "lua" })

-----------------------------> dir <------------------------------------------

vim.api.nvim_create_autocmd('User', {
    pattern = 'DirReadPost',
    callback = function(_)
        if not kit.v.dir_show_hidden then
            vim.cmd([[silent keeppatterns g/^\./d _]])
        end
    end,
})

local jsj_dir_ns = vim.api.nvim_create_namespace('jsj.built-in.dir.decoration_ns')
vim.api.nvim_set_decoration_provider(jsj_dir_ns, {
    on_win = function(_, _, buf)
        return vim.bo[buf].filetype == 'directory'
    end,
    on_range = function(_, _, buf, row)
        local dir = vim.api.nvim_buf_get_name(buf)
        local name = vim.api.nvim_buf_get_lines(buf, row, row + 1, true)[1]
        local path = vim.fs.joinpath(dir, (name:gsub('/$', '')))
        local stat = vim.uv.fs_lstat(path) or {}
        if stat.type == 'file'
            and bit.band(stat.mode, tonumber('111', 8)) ~= 0 then
            vim.api.nvim_buf_set_extmark(buf, jsj_dir_ns, row, 0, {
                hl_group = "netrwExe",
                end_col = -1,
                ephemeral = true,
            })
        end
        if stat.type == 'link' then
            local target = vim.uv.fs_readlink(path)
            local hl_group = target and 'netrwSymLink' or "Error"

            if target then
                local lpath = target:sub(1, 1) == "/" and target or vim.fs.joinpath(dir, (target:gsub('/$', '')))
                if not vim.uv.fs_stat(lpath) then
                    hl_group = "Removed"
                end
            end

            vim.api.nvim_buf_set_extmark(buf, jsj_dir_ns, row, 0, {
                virt_text = { { fmt('-> %s', target or "???"), hl_group } },
                virt_text_pos = 'eol',
                ephemeral = true,
            })
        end
        --- @diagnostic disable-next-line: return-type-mismatch
        return row + 1
    end,
})
