# My NeoVim Config

<!-- vim-markdown-toc GFM -->

* [安装依赖](#安装依赖)
* [Keyboard Shortcuts](#keyboard-shortcuts)
  * [command-mode](#command-mode)
  * [insert-mode](#insert-mode)
  * [visual-mode](#visual-mode)
  * [normal-mode](#normal-mode)

<!-- vim-markdown-toc -->

## 安装依赖
- [x] `sudo pacman -S clangd(ccls) ctags cscope` for c/c++
- [x] `sudo pacman -S fzf ripgrep fd` for fzf-vim
- [x] `sudo pacman -S xclip(xsel)` for using system clipboard
- [x] `sudo npm install -g trash` for coc-explorer
- [x] `pip install --user flake8 jedi>=0.17.0 ` for python linting and completion
- [x] `pip install --user neovim-remote` for tex
- [x] `pip install --user pynvim` for rnvimr
- [x] `sudo pacman -S golangci-lint` and `(GO111MODULE=on) go get golang.org/x/tools/gopls@latest` for vim-go
- [x] `sudo pacman -S ffplay(ffmpeg) mpv`
- [x] `sudo pacman -S nodejs npm` and `sudo npm install -g live-server`

- [ ] `sudo pacman -S figlet` for ASCII art

使用`:checkhealth`检查安装其他的依赖和设置一些环境变量

## Keyboard Shortcuts
- `<leader>=space`

### command-mode
| Command | Motion   |
| ----    | ----     |
| `<C-f>` | Right    |
| `<C-b>` | Left     |
| `:w!!`  | 提权保存 |

### insert-mode
| Command | Motion          |
| ------- | ---             |
| `<C-j>` | 进入normal-mode |
| `<C-b>` | left            |
| `<C-f>` | right           |

### visual-mode
| Command     | Motion                 |
| ----        | ----                   |
| `<leader>a` | 将选中的文本添加双引号 |

### normal-mode

| Command      | Motion               |
| -------      | ---                  |
| `F2`         | 打开init.vim         |
