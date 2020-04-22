"
"  __  __     __     _____ __  __ ____   ____
" |  \/  |_   \ \   / /_ _|  \/  |  _ \ / ___|
" | |\/| | | | \ \ / / | || |\/| | |_) | |
" | |  | | |_| |\ V /  | || |  | |  _ <| |___
" |_|  |_|\__, | \_/  |___|_|  |_|_| \_\\____|
"         |___/

" mkdir ~/.config/nvim/autoload
" git clone https://github.com/junegunn/vim-plug --depth=1

" 加载基础配置
source ~/.config/nvim/config/init-basic.vim

" 加载扩展配置
source ~/.config/nvim/config/init-config.vim

" 设定 tabsize
source ~/.config/nvim/config/init-tabsize.vim

if has('nvim')
  " 插件加载
  source ~/.config/nvim/config/init-plugins.vim
endif

" 界面样式
source ~/.config/nvim/config/init-style.vim

" 自定义按键
source ~/.config/nvim/config/init-keymaps.vim

" 代码片段
source ~/.config/nvim/config/init-snippets.vim
