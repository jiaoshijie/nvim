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
- [x] `sudo pacman -S clangd ccls ctags cscope` for c/c++
- [x] `sudo pacman -S fzf the_silver_searcher` for fzf-vim
- [x] `sudo pacman -S xsel xclip` for using system clipboard
- [x] `sudo npm install -g trash` for coc-explorer
- [x] `pip install --user flake8 jedi==0.15.2 ` for python linting and completion
- [x] `pip install --user neovim-remote` for tex
- [x] `pip install --user pynvim` for rnvimr

- [ ] `sudo pacman -S nodejs npm` and `sudo npm install -g live-server` for html-preview
- [ ] `sudo pacman -S figlet` for ASCII art

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
| `<leader>xd` | 切换为16进制模式     |
| `<leader>xr` | 切换回文本模式       |
| `<leader>eu` | 切换编码为utf-8      |
| `<leader>eg` | 切换编码为gbk        |
| `F2`         | 打开init.vim         |
| `F3`         | quickfix表的上一项   |
| `F4`         | quickfix表的下一项   |
| `F5`         | 编译运行一些小程序   |
| `F6`         | 打开quickfix窗口     |
| `F7`         | 关闭quickfix表       |
| `F8`         | 查找当前字符串       |
| `F9`         | 查找c符号            |
| `F10`        | 查找本函数调用的函数 |
| `F11`        | 查找调用本函数的函数 |
| `F12`        | 跳转到函数定义的位置 |
