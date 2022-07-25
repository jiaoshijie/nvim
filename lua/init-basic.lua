local o = vim.opt

-- [[
-- 读取文件配置
--]]
o.modeline = false
o.modelines = 0

-- vim.cmd('filetype plugin indent on')
-- vim.cmd('syntax on')

o.mouse = "a"
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
