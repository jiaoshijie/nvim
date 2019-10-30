" 
"  __  __     __     _____ __  __ ____   ____ 
" |  \/  |_   \ \   / /_ _|  \/  |  _ \ / ___|
" | |\/| | | | \ \ / / | || |\/| | |_) | |    
" | |  | | |_| |\ V /  | || |  | |  _ <| |___ 
" |_|  |_|\__, | \_/  |___|_|  |_|_| \_\\____|
"         |___/                               

" auto load for first time uses
" if empty(glob('~/.config/nvim/autoload/plug.vim'))
"   silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
"     \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"   autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
" endif


source ~/.config/nvim/config/vimrc

if has('nvim')
  source ~/.config/nvim/config/plugins.vim
endif

source ~/.config/nvim/config/keybindings.vim
source ~/.config/nvim/config/snippet.vim
