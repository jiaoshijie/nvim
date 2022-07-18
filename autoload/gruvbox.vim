" bg0 -> hard : #1d2021, normal : #282828, soft : #32302f
" fg0 -> hard : #f9f5d7, normal : #fbf1c7, soft : #f2e5bc
let s:dark_colors = {
      \ "bg0"    : { "gui" : "#1d2021" },
      \ "bg1"    : { "gui" : "#3c3836" },
      \ "bg2"    : { "gui" : "#504945" },
      \ "bg3"    : { "gui" : "#665c54" },
      \ "bg4"    : { "gui" : "#7c6f64" },
      \ "gray"   : { "gui" : "#928374" },
      \ "fg0"    : { "gui" : "#fbf1c7" },
      \ "fg1"    : { "gui" : "#ebdbb2" },
      \ "fg2"    : { "gui" : "#d5c4a1" },
      \ "fg3"    : { "gui" : "#bdae93" },
      \ "fg4"    : { "gui" : "#a89984" },
      \ "red"    : { "gui" : "#fb4934" },
      \ "green"  : { "gui" : "#b8bb26" },
      \ "yellow" : { "gui" : "#fabd2f" },
      \ "blue"   : { "gui" : "#83a598" },
      \ "purple" : { "gui" : "#d3869b" },
      \ "aqua"   : { "gui" : "#8ec07c" },
      \ "orange" : { "gui" : "#f38019" },
      \}

" bg0 -> hard : #f9f5d7, normal : #fbf1c7, soft : #f2e5bc
" fg0 -> hard : #1d2021, normal : #282828, soft : #32302f
let s:light_colors = {
      \ "bg0"    : { "gui" : "#ffffff" },
      \ "bg1"    : { "gui" : "#ebdbb2" },
      \ "bg2"    : { "gui" : "#d5c4a1" },
      \ "bg3"    : { "gui" : "#bdae93" },
      \ "bg4"    : { "gui" : "#a89984" },
      \ "gray"   : { "gui" : "#928374" },
      \ "fg0"    : { "gui" : "#282828" },
      \ "fg1"    : { "gui" : "#3c3836" },
      \ "fg2"    : { "gui" : "#504945" },
      \ "fg3"    : { "gui" : "#665c54" },
      \ "fg4"    : { "gui" : "#7c6f64" },
      \ "red"    : { "gui" : "#9d0006" },
      \ "green"  : { "gui" : "#79740e" },
      \ "yellow" : { "gui" : "#b57614" },
      \ "blue"   : { "gui" : "#076678" },
      \ "purple" : { "gui" : "#8f3f71" },
      \ "aqua"   : { "gui" : "#427b58" },
      \ "orange" : { "gui" : "#af3a03" },
      \}

function! gruvbox#GetColors()
  if &background == "light"
    return s:light_colors
  else
    return s:dark_colors
  endif
endfunction
