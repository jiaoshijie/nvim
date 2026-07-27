#!/usr/bin/env bash

OPT="$1"

MY_PLUGIN_DIR="$HOME/.config/nvim/pack/my/start"
EXT_PLUGIN_DIR="$HOME/.config/nvim/pack/ext/start"
TEMP_PLUGIN_DIR="$HOME/.config/nvim/pack/tmp/opt"
NVIM_CMD="${JSJ_NEOVIM_BIN:-nvim}"
NVIM_FLAGS="--headless --clean -u NONE"

[[ -x "$NVIM_CMD" ]] || { echo "ERROR: nvim binary not found" && exit 1 ;}

mkdir -p "$MY_PLUGIN_DIR"
mkdir -p "$EXT_PLUGIN_DIR"
mkdir -p "$TEMP_PLUGIN_DIR"

git_sync() {
  [[ -d "$1" ]] && git -C "$1" pull || git clone "$2" "$1"
}

helptags() {
  [[ -d "$1/doc" ]] && \
    "$NVIM_CMD" $NVIM_FLAGS -c "cd $1/doc" -c "helptags $1/doc" -c "quit"
}

ext_plugin() {
  URI="$1"
  NAME="${URI#*/}"
  DIR="${2:-${EXT_PLUGIN_DIR}}/$NAME"

  echo "---------------------------- SYNC ${NAME} ----------------------------"
  git_sync "$DIR" "https://github.com/${URI}.git"
  helptags "$DIR"
  [[ -f "$DIR/Makefile" ]] && make -C "$DIR"
}

my_plugin() {
  [[ -z "$OPT" ]] || ext_plugin "jiaoshijie/${1}" "$MY_PLUGIN_DIR"
}

# -----------------------------------------------------------------------------

ext_plugin "tpope/vim-fugitive"
ext_plugin "tpope/vim-surround"
ext_plugin "tpope/vim-repeat"
ext_plugin "godlygeek/tabular"

my_plugin "undotree"
my_plugin "onlysearch"
my_plugin "ffmk"
my_plugin "compilation"
