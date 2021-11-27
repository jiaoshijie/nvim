local ls = require("luasnip")
-- some shorthands...
local s = ls.snippet
-- local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node
-- local l = require("luasnip.extras").lambda
-- local r = require("luasnip.extras").rep
-- local p = require("luasnip.extras").partial
-- local m = require("luasnip.extras").match
-- local n = require("luasnip.extras").nonempty
-- local dl = require("luasnip.extras").dynamic_lambda
-- local types = require("luasnip.util.types")

ls.config.set_config{
  history = false,
  -- updateevents = "InsertLeave,TextChanged,TextChangedI"
  -- region_check_events =
  ext_opts = nil,
  -- treesitter-hl has 100, use something higher (default is 200).
  ext_base_prio = 300,
  -- minimal increase in priority.
  ext_prio_increase = 1,
  enable_autosnippets = true,
}

ls.snippets = {
  all = {
    s("jiao1", {
      t({"jiao1751959040@gmail.com"}),
    }),
    s("date", {
      f(function()
        return os.date()
      end, {})
    }),
  },
  c = {
    s("main", {
      t({"#include <stdio.h>", ""}),
      t({"#include <stdlib.h>", ""}),
      t({"#include <string.h>", ""}),
      t({"", "int main("}),
      i(1, "int argc, char *argv[]"),
      t({") {", "\t"}),
      i(2, {'printf("hello world!!!");'}),
      t({"", "\treturn 0;"}),
      t({"", "}"}),
      i(0),
    }),
  },
  cpp = {
    s("main", {
      t({"#include <iostream>", ""}),
      t({"#include <string>", ""}),
      t({"#include <vector>", ""}),
      t({"", "int main("}),
      i(1, "int argc, char *argv[]"),
      t({") {", "\t"}),
      i(2, {'std::cout << "hello world!!!" << std::endl;'}),
      t({"", "\treturn 0;"}),
      t({"", "}"}),
      i(0),
    }),
  },
  go = {
    s("main", {
      t({"package main", ""}),
      t({"", 'import ("fmt")', ""}),
      t({"", "func main() {", "\t"}),
      i(1, 'fmt.Println("hello world!!!")'),
      t({"", "}"}),
      i(0),
    }),
  },
  html = {
    s("html5", {
      t({"<!DOCTYPE html>", ""}),
      t({'<html lang="en">', ""}),
      t({'<head>', ""}),
      t({'\t<meta charset="UTF-8">', ""}),
      t({'\t<meta name="viewport" content="width=device-width, initial=scale=1.0">', ""}),
      t("\t<title>"),
      i(1, "title"),
      t({"</title>", ""}),
      t({"</head>", ""}),
      t({"<body>", "\t"}),
      i(2, "article"),
      t({"", "</body>"}),
      t({"", "</html>"}),
    }),
  },
}

-- https://github.com/L3MON4D3/LuaSnip/blob/master/plugin/luasnip.vim
vim.api.nvim_exec([[
  imap <silent> <C-l> <Plug>luasnip-expand-or-jump
  smap <silent> <C-l> <Plug>luasnip-expand-or-jump
  imap <silent> <C-a> <Plug>luasnip-jump-prev
  smap <silent> <C-a> <Plug>luasnip-jump-prev
  nnoremap <silent> <leader>u :LuaSnipUnlinkCurrent<cr>
]], false)
