#!/usr/bin/env bash

set -ex
TS_target_dir=$(pwd)/parser/

mkdir -p "${TS_target_dir}"

ts() {
  TS_name=$1
  TS_url=$2
  TS_lang=$3
  TS_dep_url=$4
  TMP_DIR=/tmp/nvim_ts/

  mkdir -p $TMP_DIR
  cd $TMP_DIR

  git clone --depth 1 "$TS_url" "$TS_name"
  cd "$TS_name"

  if [[ -n "$TS_dep_url" ]]; then
    mkdir -p node_modules
    cd node_modules
    git clone --depth 1 "$TS_dep_url"
    cd -
  fi

  tree-sitter generate
  tree-sitter build

  cp $TS_lang.so "$TS_target_dir"

  cd ..
}

ts 'tree-sitter-cpp' 'https://github.com/tree-sitter/tree-sitter-cpp.git' 'cpp' \
  'https://github.com/tree-sitter/tree-sitter-c.git'
ts 'tree-sitter-rust' 'https://github.com/tree-sitter/tree-sitter-rust.git' 'rust'
ts 'tree-sitter-go' 'https://github.com/tree-sitter/tree-sitter-go.git' 'go'
ts 'tree-sitter-python' 'https://github.com/tree-sitter/tree-sitter-python.git' 'python'
ts 'tree-sitter-bash' 'https://github.com/tree-sitter/tree-sitter-bash.git' 'bash'
ts 'tree-sitter-json' 'https://github.com/tree-sitter/tree-sitter-json.git' 'json'

ts 'tree-sitter-luadoc' 'https://github.com/tree-sitter-grammars/tree-sitter-luadoc.git' 'luadoc'
ts 'tree-sitter-diff' 'https://github.com/tree-sitter-grammars/tree-sitter-diff.git' 'diff'

ts 'tree-sitter-comment' 'https://github.com/stsewd/tree-sitter-comment.git' 'comment'
