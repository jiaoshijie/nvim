local _M = {}

_M.JsjClearSE = function()
  local l = vim.fn.line(".")
  local c = vim.fn.col(".")
  vim.cmd([[%s/\s\+$//ge]])
  vim.cmd([[%s/\(\n\)\+\%$//ge]])
  vim.fn.cursor({ l, c })
  vim.cmd([[execute ":nohl"]])
end

_M.Change_theme_alpha = function()
  if not JSJ_change_theme_alpha then
    JSJ_change_theme_alpha = true
    -- NOTICE: 62 is the Normal highlight group synID
    JSJ_normalbg = vim.fn.synIDattr(62, "bg", "gui")
    vim.cmd("highlight Normal guibg=NONE ctermbg=NONE")
  else
    JSJ_change_theme_alpha = false
    vim.cmd("highlight! Normal guibg=" .. JSJ_normalbg)
  end
  vim.cmd("hi! link SignColumn LineNr")
end

_M.Jsj_ToggleList = function(listname, perfix)
  if #vim.fn.filter(vim.fn.getwininfo(), "v:val." .. listname) == 0 then
    xpcall(vim.api.nvim_exec, function()
      vim.api.nvim_err_writeln("Location List is Empty.")
    end, perfix .. "open", false)
  else
    vim.api.nvim_exec(perfix .. "close", false)
  end
end

_M.Jsj_CheckHlGroup = function()
  local l = vim.fn.line(".")
  local c = vim.fn.col(".")
  local synIDf = vim.fn.synID(l, c, false)
  local synIDt = vim.fn.synID(l, c, true)
  local synIDattr = vim.fn.synIDattr
  local synIDtrans = vim.fn.synIDtrans
  local synName = synIDattr(synIDf, "name")
  local synHlName = synIDattr(synIDt, "name")
  local synTransHlName = synIDattr(synIDtrans(synIDt), "name")
  local fg = synIDattr(synIDtrans(synIDt), "fg#")
  local bg = synIDattr(synIDtrans(synIDt), "bg#")
  local info = string.format("synName=`%s`", synName)

  if synHlName ~= "" or synTransHlName ~= "" then
    if synHlName == "" or synTransHlName == "" then
      info = string.format("%s\nsynName=`%s`", info, synHlName == "" and synTransHlName or synHlName)
    elseif synTransHlName == synHlName then
      info = string.format("%s\nsynName=`%s`", info, synHlName)
    else
      info = string.format("%s\nsynHlName=`%s->%s`", info, synHlName, synTransHlName)
    end
  end
  if fg ~= "" then
    info = string.format("%s\nfg=`%s`", info, fg)
  end
  if bg ~= "" then
    info = string.format("%s\nbg=`%s`", info, bg)
  end
  if info == "synName=``" then
    vim.api.nvim_err_writeln("There is no syntex item.")
  else
    print(info)
  end
end

_M.fcitx2en = function()
  if tonumber(vim.fn.system("fcitx5-remote")) == 2 then
    vim.fn.system("fcitx5-remote -c")
  end
end

_M.showFilePath = function()
  print(vim.fn.expand("%:p"))
end

_M.hl = function(group, style)
  if style.link then
    vim.cmd("highlight! link " .. group .. " " .. style.link)
  else
    local hl = "highlight "
        .. group
        .. " guifg="
        .. (style.fg and style.fg or "NONE")
        .. " guibg="
        .. (style.bg and style.bg or "NONE")
        .. " guisp="
        .. (style.sp and style.sp or "NONE")
        .. " gui="
        .. (style.gui and style.gui or "NONE")
        .. " cterm="
        .. (style.gui and style.gui or "NONE")
    vim.cmd(hl)
  end
end

_M.contains = function(tbl, val)
  for _, value in ipairs(tbl) do
    if value == val then
      return true
    end
  end
  return false
end

return _M
