local o = vim.opt
local api = vim.api
local autocmd = api.nvim_create_autocmd

o.modeline = false
o.modelines = 0

o.mouse = "nvi"
o.mousemodel = "extend"
o.title = true

o.smartindent = true

o.wrap = false
o.linebreak = true
o.textwidth = 0
o.formatoptions:append("mB")
o.formatoptions:remove({ "c", "t" })

o.timeoutlen = 500
o.updatetime = 500

o.ignorecase = true
o.smartcase = true

o.fileencoding = "utf-8"
o.fileencodings = "ucs-bom,utf-8,gbk,gb18030,big5,euc-jp,latin1"

o.fdm = "indent"
o.fdl = 99

-- o.completeopt = "menuone,noselect,preview"
o.completeopt = "menuone,noselect"

o.clipboard = "unnamedplus"

o.showmatch = true
o.matchtime = 3

o.hidden = true
o.confirm = true

o.virtualedit = "block"

o.path:append("**")

o.pumblend = 30
o.ph = 15

o.lazyredraw = true

o.nrformats = ""

o.shortmess:append("c")

o.inccommand = "split"

o.fsync = true

o.switchbuf = "useopen"

o.diffopt = "vertical,filler,context:3,foldcolumn:1,internal,algorithm:histogram,indent-heuristic"

o.suffixes = ".bak,~,.o,.h,.info,.swp,.obj,.pyc,.pyo,.egg-info,.class"

o.wildignore:append("*.o,*obj,*~,*.exe,*.a,*.dll,*.swp,*.jar,*.class,*.pyc,*.pyo,*.bin")
o.wildignore:append("*/.Trash/**,*.dmg,*/.rbenv/**,*DS_Store*")

vim.g.loaded_python_provider = 0 -- To disable Python2 support
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0 -- To disable Perl support
vim.g.loaded_ruby_provider = 0 -- To disable Ruby support
vim.g.python3_host_prog = "/usr/bin/python3"

-- for netrw
-- https://vonheikemen.github.io/devlog/tools/using-netrw-vim-builtin-file-explorer/
vim.g.netrw_banner = 0 -- disable annoying banner
vim.g.netrw_browse_split = 0
vim.g.netrw_altv = 1 -- open splits to the right
vim.g.netrw_alto = 0
vim.g.netrw_liststyle = 0 -- tree view
vim.g.netrw_winsize = 25
vim.g.netrw_preview = 1
vim.g.netrw_localrmdir = "rm -r"
vim.g.netrw_hide = 1
vim.g.netrw_keepdir = 1
vim.g.netrw_localcopydircmd = "cp -r"
vim.g.netrw_list_hide = "\\(^\\|\\s\\s\\)\\zs\\.\\S\\+"

local group = api.nvim_create_augroup("Jsj_neovim_autocmd_misc", { clear = true })

autocmd("BufReadPost", {
  pattern = "*",
  group = group,
  once = true,
  command = [[if &ft !~# 'commit\|rebase' && line("'\"") > 1 && line("'\"") <= line("$") | exe 'normal! g`"' | endif]],
})
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  group = group,
  callback = function()
    vim.highlight.on_yank({ higourp = "IncSearch", timeout = 300 })
  end,
})
if vim.fn.has("unix") then
  autocmd("InsertLeave", {
    pattern = "*",
    group = group,
    callback = require("init-utils").fcitx2en,
  })
end

o.backup = false
o.writebackup = true
o.backupext = ".bak"
o.backupdir = "~/.config/nvim/tmp/backup//,."

o.swapfile = false
o.directory = "~/.config/nvim/tmp/swp//,."

o.undofile = true
o.undodir = "/tmp/neovim_u/undodir//,."

if vim.fn.isdirectory(vim.fn.expand("$HOME/.config/nvim/tmp/swp")) ~= 1 then
  vim.cmd([[silent! call mkdir(expand('$HOME/.config/nvim/tmp/swp'), 'p', 0700)]])
end
if vim.fn.isdirectory(vim.fn.expand("$HOME/.config/nvim/tmp/backup")) ~= 1 then
  vim.cmd([[silent! call mkdir(expand('$HOME/.config/nvim/tmp/backup'), 'p', 0700)]])
end
if vim.fn.isdirectory(vim.fn.expand("/tmp/neovim_u/undodir")) ~= 1 then
  vim.cmd([[silent! call mkdir(expand('/tmp/neovim_u/undodir'), 'p', 0700)]])
end

vim.cmd([[command! -nargs=0 CheckHlGroupUnderCursor :lua require("init-utils").Jsj_CheckHlGroup()]])
vim.cmd([[command! -nargs=0 SF :lua require("init-utils").showFilePath()]])
