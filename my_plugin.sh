#!/usr/bin/env bash

OPT="$1"

MY_PLUGIN_DIR="$HOME/.config/nvim/pack/my/start"
EXT_PLUGIN_DIR="$HOME/.config/nvim/pack/ext/start"

mkdir -p "$MY_PLUGIN_DIR"
mkdir -p "$EXT_PLUGIN_DIR"

git_sync() {
  [[ -d "$1" ]] && git -C "$1" pull || git clone "$2" "$1"
}

my_plugin() {
  [[ -z "$OPT" ]] && return

  NAME="$1"
  DIR="$MY_PLUGIN_DIR/$NAME"

  echo "sync ${NAME}..."
  git_sync "$DIR" "https://github.com/jiaoshijie/${NAME}.git"
  [[ -f "$DIR/Makefile" ]] && make -C "$DIR"
  echo "----------------------------------------------------------------------"
}

ext_plugin() {
  URI="$1"
  NAME="${URI#*/}"

  echo "sync ${NAME}..."
  git_sync "$EXT_PLUGIN_DIR/$NAME" "https://github.com/${URI}.git"
  echo "----------------------------------------------------------------------"
}

my_plugin "undotree"
my_plugin "onlysearch"
my_plugin "ffmk"

ext_plugin "tpope/vim-fugitive"
ext_plugin "tpope/vim-surround"
ext_plugin "tpope/vim-repeat"
ext_plugin "godlygeek/tabular"
