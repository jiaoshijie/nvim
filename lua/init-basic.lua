local o = vim.o
local wo = vim.wo

-- [[
-- 读取文件配置
--]]
vim.cmd('set nomodeline')
o.modelines = 0

o.mouse = "a"
o.title = true

vim.cmd('filetype plugin indent on')
vim.cmd('syntax on')

o.smartindent = true

wo.wrap = false
wo.linebreak = true
o.textwidth = 0
vim.cmd('set formatoptions+=mB')
vim.cmd('set formatoptions-=tc')

o.timeoutlen=500

o.ignorecase = true
o.smartcase = true

o.fileencoding = "utf-8"
o.fileencodings = "ucs-bom,utf-8,gbk,gb18030,big5,euc-jp,latin1"

wo.fdm = "indent"
wo.fdl = 99

o.completeopt = "menuone,noselect"

o.clipboard = "unnamedplus"

o.showmatch = true
o.matchtime = 3

o.hidden = true
o.confirm = true

o.virtualedit = "block"

vim.cmd('set path+=**')

o.pumblend = 10

o.lazyredraw = true

o.nrformats = "alpha,hex,octal"

vim.cmd('set shortmess+=cI')

o.inccommand = "split"

o.fsync = true

o.suffixes = ".bak,~,.o,.h,.info,.swp,.obj,.pyc,.pyo,.egg-info,.class"

vim.cmd('set wildignore=*.o,*.obj,*~,*.exe,*.a,*.pdb,*.lib')
vim.cmd('set wildignore+=*.so,*.dll,*.swp,*.egg,*.jar,*.class,*.pyc,*.pyo,*.bin,*.dex')
vim.cmd('set wildignore+=*.zip,*.7z,*.rar,*.gz,*.tar,*.gzip,*.bz2,*.tgz,*.xz')
vim.cmd('set wildignore+=*DS_Store*,*.ipch')
vim.cmd('set wildignore+=*.gem')
vim.cmd('set wildignore+=*.png,*.jpg,*.gif,*.bmp,*.tga,*.pcx,*.ppm,*.img,*.iso')
vim.cmd('set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/.rbenv/**')
vim.cmd('set wildignore+=*/.nx/**,*.app,*.git,.git')
vim.cmd('set wildignore+=*.wav,*.mp3,*.ogg,*.pcm')
vim.cmd('set wildignore+=*.mht,*.suo,*.sdf,*.jnlp')
vim.cmd('set wildignore+=*.chm,*.epub,*.pdf,*.mobi,*.ttf')
vim.cmd('set wildignore+=*.mp4,*.avi,*.flv,*.mov,*.mkv,*.swf,*.swc')
vim.cmd('set wildignore+=*.ppt,*.pptx,*.docx,*.xlt,*.xls,*.xlsx,*.odt,*.wps')
vim.cmd('set wildignore+=*.msi,*.crx,*.deb,*.vfd,*.apk,*.ipa,*.bin,*.msu')
vim.cmd('set wildignore+=*.gba,*.sfc,*.078,*.nds,*.smd,*.smc')
vim.cmd('set wildignore+=*.linux2,*.win32,*.darwin,*.freebsd,*.linux,*.android')
