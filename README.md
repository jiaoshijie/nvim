# My NeoVim Config

<!-- vim-markdown-toc GFM -->

* [安装依赖](#安装依赖)
* [Keyboard Shortcuts](#keyboard-shortcuts)
  * [command-mode](#command-mode)
  * [insert-mode](#insert-mode)
  * [visual-mode](#visual-mode)
  * [normal-mode](#normal-mode)
* [ctags使用(函数跳转)](#ctags使用函数跳转)
* [Quickfix列表](#quickfix列表)

<!-- vim-markdown-toc -->

## 安装依赖
- [x] `sudo pacman -S ccls ctags cscope` for c/c++
- [x] `sudo pacman -S fzf the_silver_searcher` for fzf-vim
- [x] `sudo pacman -S xsel` for using system clipboard
- [x] `sudo npm install -g trash` for coc-explorer
- [x] `pip install --user flake8 jedi==0.15.2 ` for python linting and completion
- [x] `pip install --user neovim-remote` for tex

- [ ] `sudo pacman -S nodejs npm` and `sudo npm install -g live-server` for html-preview
- [ ] `sudo pacman -S figlet` for ASCII art

## Keyboard Shortcuts
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
- `<leader>=space`
- **以下命令都有前缀键leader**

| Command | Motion                                |
| ------- | ---                                   |
| bb      | 切换buffer(fzf)                       |
| ff      | 打开FZF(FZF)                          |
| fg      | 打开当前文件夹git管理的文件(FZF)      |
| fr      | 最近打开的文件(FZF)                   |
| R       | 打开文件管理器Ranger                  |
| k       | 标记高亮一个单词(vim-interestingwors) |
| u       | 打开修改记录(undotree)                |
| pp      | markdown预览(markdownpreview)         |
| ps      | 关闭markdown预览(markdownpreview)     |
| cc      | 注释和反注释代码(NERDCommenter)       |
| ca      | 在代码后添加注释(NERDCommenter)       |
| cA      | 改变注释符号(NERDCommenter)           |
| G       | 打开Goyo模式(vim-Goyo)                |
| xd      | 切换为16进制模式                      |
| xr      | 切换回文本模式                        |
| eu      | 切换编码为utf-8(默认)                 |
| eg      | 切换编码为gbk                         |

- 以下命令不需要leader键

| Command  | Motion                       |
| -------  | ---                          |
| F2       | 打开init.vim                 |
| F3       | quickfix表的上一项           |
| F4       | quickfix表的下一项           |
| F5       | 编译运行一些小程序           |
| F6       | 打开quickfix窗口             |
| F7       | 关闭quickfix表               |
| F8       | 查找当前字符串               |
| F9       | 查找c符号                    |
| F10      | 查找本函数调用的函数         |
| F11      | 查找调用本函数的函数         |
| F12      | 跳转到函数定义的位置         |
| tt       | 打开coc-explorer             |
| T        | 打开Vista(Vista){类似tagbar} |
| `<C-t>`  | 打开ctags标签搜索(vista)     |

## ctags使用(函数跳转)
| command          | use                                      |
| -------          | ---                                      |
| `<C-]>`          | 跳转到匹配当前光标所在关键字的第一处标签 |
| `g<C-]>`         | 如果有多处标签则展开列表                 |
| :tag {keyword}   | 同`<C-]>`                                |
| :tjump {keyword} | 同`g<C-]>`                               |
| :pop 或 `<C-t>`  | 反向遍历标签历史                         |
| :tag             | 正向遍历标签历史                         |
| :tnext           | 下                                       |
| :tprev           | 上                                       |
| :tfirst          | 第一处                                   |
| :tlast           | 最后一处                                 |
| :tselect         | 从标签列表中进行选择                     |

## Quickfix列表
> `:make` `grep` `vimgrep`会使用quickfix列表

> `:lmake` `:lgrep` `:lvimgrep`会生成位置列表

| command | use                    |
| ------- | ---                    |
| :cnext  | 跳到下一项             |
| :cprev  | 跳到上一项             |
| :cfirst | 首项                   |
| :clast  | 最后一项               |
| :cnfile | 跳到下个文件的第一项   |
| :cpfile | 跳到上个文件的最后一项 |
| :cc N   | 跳到第n项              |
| :copen  | 打开quickfix窗口       |
| :cclose | 关闭quickfix窗口       |

> 位置列表把`c`变成`l`
