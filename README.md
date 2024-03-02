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
========        /::::::::::|  |::::::::::\  \ no mouse \     ========
========       /:::========|  |==hjkl==:::\  \ required \    ========
========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
========                                                     ========
=====================================================================
=====================================================================
```
Totally stole this from [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua), no shame.

- nvim configuration(as small as possiable).

## Requirements

- nvim lately(~~nightly~~) version
- `:checkhealth` for more infomation.

## Hints

- using `column` to align text
  * markdown table: `!column -t -s "|" -o "|"` or `!column -t -s \| -o \|`
- vim search/replace
  * using tools(rg, grep) search text, and moving the result to quickfix, then do `cdo` for line and `cfdo` for file.
  * `args */**.lua` `argdo`
  * `bufdo`

## Ref

- [align-text-on-an-equals-sign-in-vim](https://stackoverflow.com/questions/8964953/align-text-on-an-equals-sign-in-vim)
