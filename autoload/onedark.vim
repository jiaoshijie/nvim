let s:colors = {
      \ "red"            : { "gui" : "#E06C75" },
      \ "dark_red"       : { "gui" : "#BE5046" },
      \ "green"          : { "gui" : "#98C379" },
      \ "yellow"         : { "gui" : "#E5C07B" },
      \ "dark_yellow"    : { "gui" : "#D19A66" },
      \ "blue"           : { "gui" : "#61AFEF" },
      \ "purple"         : { "gui" : "#C678DD" },
      \ "cyan"           : { "gui" : "#56B6C2" },
      \ "white"          : { "gui" : "#ABB2BF" },
      \ "black"          : { "gui" : "#282C34" },
      \ "visual_black"   : { "gui" : "NONE" },
      \ "comment_grey"   : { "gui" : "#5C6370" },
      \ "gutter_fg_grey" : { "gui" : "#4B5263" },
      \ "cursor_grey"    : { "gui" : "#2C323C" },
      \ "visual_grey"    : { "gui" : "#3E4452" },
      \ "menu_grey"      : { "gui" : "#3E4452" },
      \ "special_grey"   : { "gui" : "#3B4048" },
      \ "vertsplit"      : { "gui" : "#181A1F" },
      \}

function! onedark#GetColors()
  return s:colors
endfunction
