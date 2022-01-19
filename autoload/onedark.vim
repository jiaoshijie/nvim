" [onedark.vim](https://github.com/joshdick/onedark.vim/)

let s:overrides = get(g:, "onedark_color_overrides", {})

let s:colors = {
      \ "red": get(s:overrides, "red", { "gui": "#E06C75" }),
      \ "dark_red": get(s:overrides, "dark_red", { "gui": "#BE5046" }),
      \ "green": get(s:overrides, "green", { "gui": "#98C379" }),
      \ "yellow": get(s:overrides, "yellow", { "gui": "#E5C07B" }),
      \ "dark_yellow": get(s:overrides, "dark_yellow", { "gui": "#D19A66" }),
      \ "blue": get(s:overrides, "blue", { "gui": "#61AFEF" }),
      \ "purple": get(s:overrides, "purple", { "gui": "#C678DD" }),
      \ "cyan": get(s:overrides, "cyan", { "gui": "#56B6C2" }),
      \ "white": get(s:overrides, "white", { "gui": "#ABB2BF" }),
      \ "black": get(s:overrides, "black", { "gui": "#282C34" }),
      \ "visual_black": get(s:overrides, "visual_black", { "gui": "NONE" }),
      \ "comment_grey": get(s:overrides, "comment_grey", { "gui": "#5C6370" }),
      \ "gutter_fg_grey": get(s:overrides, "gutter_fg_grey", { "gui": "#4B5263" }),
      \ "cursor_grey": get(s:overrides, "cursor_grey", { "gui": "#2C323C" }),
      \ "visual_grey": get(s:overrides, "visual_grey", { "gui": "#3E4452" }),
      \ "menu_grey": get(s:overrides, "menu_grey", { "gui": "#3E4452" }),
      \ "special_grey": get(s:overrides, "special_grey", { "gui": "#3B4048" }),
      \ "vertsplit": get(s:overrides, "vertsplit", { "gui": "#181A1F" }),
      \}

function! onedark#GetColors()
  return s:colors
endfunction
