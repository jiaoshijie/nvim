local _M = {}
local vf = vim.fn
local api = vim.api

_M.JsjClearSE = function()
  local l, c = vf.line("."), vf.col(".")
  vim.cmd([[%s/\s\+$//ge]])
  vim.cmd([[%s/\(\n\)\+\%$//ge]])
  vf.cursor({ l, c })
  vim.cmd.nohlsearch()
end

_M.Change_theme_alpha = function()
  if not JSJ_change_theme_alpha then
    JSJ_change_theme_alpha = true
    JSJ_normalbg = vf.synIDattr(vf.hlID("Normal"), "bg", "gui")
    _M.global_hl("Normal", { bg = "NONE" })
  else
    JSJ_change_theme_alpha = false
    _M.global_hl("Normal", { bg = JSJ_normalbg })
  end
  _M.global_hl("SignColumn", { link = "LineNr" })
end

_M.Jsj_ToggleList = function(listname, perfix)
  if #vf.filter(vf.getwininfo(), "v:val." .. listname) == 0 then
    xpcall(api.nvim_exec2, function()
      api.nvim_err_writeln("Location List is Empty.")
    end, perfix .. "open", { output = false })
  else
    api.nvim_exec2(perfix .. "close", { output = false })
  end
end

_M.fcitx2en = function()
  if tonumber(vf.system("fcitx5-remote")) == 2 then
    vf.system("fcitx5-remote -c")
  end
end

_M.showFilePath = function()
  print(vf.expand("%:p"))
end

_M.contains = function(tbl, val)
  for _, value in ipairs(tbl) do
    if value == val then
      return true
    end
  end
  return false
end

_M.global_hl = function(group, opts)
  opts.default = false
  api.nvim_set_hl(0, group, opts)
end

return _M
