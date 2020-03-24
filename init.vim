"
"  __  __     __     _____ __  __ ____   ____
" |  \/  |_   \ \   / /_ _|  \/  |  _ \ / ___|
" | |\/| | | | \ \ / / | || |\/| | |_) | |
" | |  | | |_| |\ V /  | || |  | |  _ <| |___
" |_|  |_|\__, | \_/  |___|_|  |_|_| \_\\____|
"         |___/

" mkdir ~/.config/nvim/autoload
" git clone https://github.com/junegunn/vim-plug --depth=1

source ~/.config/nvim/config/vimrc

if has('nvim')
  source ~/.config/nvim/config/plugins.vim
endif

source ~/.config/nvim/config/keybindings.vim
source ~/.config/nvim/config/snippet.vim
