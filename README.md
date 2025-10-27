```
=====================================================================
=====================================================================
========                                    .-----.          ========
========         .----------------------.   | === |          ========
========         |.-""""""""""""""""""-.|   |-----|          ========
========         ||                    ||   | === |          ========
========         ||        NVIM        ||   |-----|          ========
========         ||                    ||   | === |          ========
========         ||                    ||   |-----|          ========
========         ||:Tutor              ||   |:::::|          ========
========         |'-..................-'|   |____o|          ========
========         `"")----------------(""`   ___________      ========
========          /::::::::::::::::::::\    \ no mouse \     ========
========         /:::==========hjkl==:::\    \ required \    ========
========        '""""""""""""""""""""""""'    '""""""""""'   ========
========                                                     ========
=====================================================================
=====================================================================
```
Totally stole this from [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua), no shame.

- nvim configuration(as small as possiable).

## Requirements

- nvim **lately**(~~nightly~~) version
- `:checkhealth` for more infomation.

## Hints

- using `column` to align text
  * markdown table: `!column -t -s "|" -o "|"` or `!column -t -s \| -o \|`
- vim search/replace
  * using tools(rg, grep) search text, and moving the result to quickfix, then do `cdo` for line and `cfdo` for file.
  * `args */**.lua` `argdo`
  * `bufdo`

## treesitter queries

> [!NOTE]
> [How to disable conceal highlight?](https://github.com/nvim-treesitter/nvim-treesitter/discussions/6208)
>
> I want to disable code block concealing, but I haven’t found a good way to do it yet.

##### queries/markdown/highlights.scm

```diff
 (fenced_code_block
-  (fenced_code_block_delimiter) @markup.raw.block
-  (#set! conceal "")
-  (#set! conceal_lines ""))
+  (fenced_code_block_delimiter) @markup.raw.block)

 (fenced_code_block
   (info_string
-    (language) @label
-    (#set! conceal "")
-    (#set! conceal_lines "")))
+    (language) @label))
```

##### queries/markdown_inline/highlights.scm

```diff
 ; Conceal codeblock and text style markers
 ([
-  (code_span_delimiter)
+;  (code_span_delimiter)
   (emphasis_delimiter)
 ] @conceal
   (#set! conceal ""))
```

##### queries/json/highlights.scm

```diff
-("\"" @conceal
-  (#set! conceal ""))
+; ("\"" @conceal
+;   (#set! conceal ""))

 (escape_sequence) @string.escape

-((escape_sequence) @conceal
-  (#eq? @conceal "\\\"")
-  (#set! conceal "\""))
+; ((escape_sequence) @conceal
+;   (#eq? @conceal "\\\"")
+;   (#set! conceal "\""))
```
