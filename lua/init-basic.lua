local o = vim.opt

-- [[
-- 读取文件配置
--]]
o.modeline = false
o.modelines = 0

-- TODO
vim.cmd('filetype plugin indent on')
vim.cmd('syntax on')

o.mouse = "a"
o.title = true

o.smartindent = true

o.wrap = false
o.linebreak = true
o.textwidth = 0
o.formatoptions:append('mB')
o.formatoptions:remove({'c', 't'})

o.timeoutlen=500

o.ignorecase = true
o.smartcase = true

o.fileencoding = "utf-8"
o.fileencodings = "ucs-bom,utf-8,gbk,gb18030,big5,euc-jp,latin1"

o.fdm = "indent"
o.fdl = 99

o.completeopt = "menuone,noselect"

o.clipboard = "unnamedplus"

o.showmatch = true
o.matchtime = 3

o.hidden = true
o.confirm = true

o.virtualedit = "block"

o.path:append('**')

o.pumblend = 10

o.lazyredraw = true

o.nrformats = "alpha,hex,octal"

o.shortmess:append('cI')

o.inccommand = "split"

o.fsync = true

o.suffixes = ".bak,~,.o,.h,.info,.swp,.obj,.pyc,.pyo,.egg-info,.class"

o.wildignore:append('*.o,*.obj,*~,*.exe,*.a,*.pdb,*.lib')
o.wildignore:append('*.so,*.dll,*.swp,*.egg,*.jar,*.class,*.pyc,*.pyo,*.bin,*.dex')
o.wildignore:append('*.zip,*.7z,*.rar,*.gz,*.tar,*.gzip,*.bz2,*.tgz,*.xz')
o.wildignore:append('*DS_Store*,*.ipch')
o.wildignore:append('*.gem')
o.wildignore:append('*.png,*.jpg,*.gif,*.bmp,*.tga,*.pcx,*.ppm,*.img,*.iso')
o.wildignore:append('*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/.rbenv/**')
o.wildignore:append('*/.nx/**,*.app,*.git,.git')
o.wildignore:append('*.wav,*.mp3,*.ogg,*.pcm')
o.wildignore:append('*.mht,*.suo,*.sdf,*.jnlp')
o.wildignore:append('*.chm,*.epub,*.pdf,*.mobi,*.ttf')
o.wildignore:append('*.mp4,*.avi,*.flv,*.mov,*.mkv,*.swf,*.swc')
o.wildignore:append('*.ppt,*.pptx,*.docx,*.xlt,*.xls,*.xlsx,*.odt,*.wps')
o.wildignore:append('*.msi,*.crx,*.deb,*.vfd,*.apk,*.ipa,*.bin,*.msu')
o.wildignore:append('*.gba,*.sfc,*.078,*.nds,*.smd,*.smc')
o.wildignore:append('*.linux2,*.win32,*.darwin,*.freebsd,*.linux,*.android')
