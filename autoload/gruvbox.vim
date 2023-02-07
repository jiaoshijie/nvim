" bg0 -> hard : #1d2021, normal : #282828, soft : #32302f
" fg0 -> hard : #f9f5d7, normal : #fbf1c7, soft : #f2e5bc
let s:dark_colors = {
      \ "bg0"    : "#1d2021",
      \ "bg1"    : "#3c3836",
      \ "bg2"    : "#504945",
      \ "bg3"    : "#665c54",
      \ "bg4"    : "#7c6f64",
      \ "gray"   : "#928374",
      \ "fg0"    : "#fbf1c7",
      \ "fg1"    : "#ebdbb2",
      \ "fg2"    : "#d5c4a1",
      \ "fg3"    : "#bdae93",
      \ "fg4"    : "#a89984",
      \ "red"    : "#fb4934",
      \ "green"  : "#b8bb26",
      \ "yellow" : "#fabd2f",
      \ "blue"   : "#83a598",
      \ "purple" : "#d3869b",
      \ "aqua"   : "#8ec07c",
      \ "orange" : "#f38019",
      \}

" bg0 -> hard : #f9f5d7, normal : #fbf1c7, soft : #f2e5bc
" fg0 -> hard : #1d2021, normal : #282828, soft : #32302f
let s:light_colors = {
      \ "bg0"    : "#ffffff",
      \ "bg1"    : "#ebdbb2",
      \ "bg2"    : "#d5c4a1",
      \ "bg3"    : "#bdae93",
      \ "bg4"    : "#a89984",
      \ "gray"   : "#928374",
      \ "fg0"    : "#282828",
      \ "fg1"    : "#3c3836",
      \ "fg2"    : "#504945",
      \ "fg3"    : "#665c54",
      \ "fg4"    : "#7c6f64",
      \ "red"    : "#9d0006",
      \ "green"  : "#79740e",
      \ "yellow" : "#b57614",
      \ "blue"   : "#076678",
      \ "purple" : "#8f3f71",
      \ "aqua"   : "#427b58",
      \ "orange" : "#af3a03",
      \}

function! gruvbox#GetColors()
  if &background == "light"
    return s:light_colors
  else
    return s:dark_colors
  endif
endfunction
