#!/usr/bin/env bash

PLUGIN_DIR="$HOME/.config/nvim/pack/my/start"
UNDOTREE_DIR="$PLUGIN_DIR/undotree"
ONLYSEARCH_DIR="$PLUGIN_DIR/onlysearch"
FFMK_DIR="$PLUGIN_DIR/ffmk"

mkdir -p $PLUGIN_DIR

if [[ -d "$UNDOTREE_DIR" ]]; then
  echo "pulling undotree..."
  git -C "$UNDOTREE_DIR" pull
else
  git clone https://github.com/jiaoshijie/undotree.git "$UNDOTREE_DIR"
fi

if [[ -d "$ONLYSEARCH_DIR" ]]; then
  echo "pulling onlysearch..."
  git -C "$ONLYSEARCH_DIR" pull
else
  git clone https://github.com/jiaoshijie/onlysearch.git "$ONLYSEARCH_DIR"
fi

if [[ -d "$FFMK_DIR" ]]; then
  echo "pulling ffmk..."
  git -C "$FFMK_DIR" pull
  cd $FFMK_DIR && make
else
  git clone https://github.com/jiaoshijie/ffmk.git "$FFMK_DIR"
  cd $FFMK_DIR && make
fi
