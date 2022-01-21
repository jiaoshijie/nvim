local _M = {}

_M.JsjClearSE = function(var)
  local l = vim.fn.line('.')
  local c = vim.fn.col('.')
  if var then
    vim.cmd([[%s/\s\+$//ge]])
    vim.cmd([[%s/\(\n\)\+\%$//ge]])
  else
    local sp = ''
    for _ = 1, vim.opt.softtabstop:get() do
      sp = sp .. ' '
    end
    local s = '%s/\t/' .. sp .. '/ge'
    vim.cmd(s)
  end
  vim.fn.cursor({l, c})
  vim.cmd([[execute ":nohl"]])
end

_M.ToggleFold = function()
  if not Jsj_FoldMethod then
    vim.cmd('normal! zM')
    Jsj_FoldMethod = true
  else
    vim.cmd('normal! zR')
    Jsj_FoldMethod = false
  end
end

_M.Change_theme_alpha = function()
  if not JSJ_change_theme_alpha then
    JSJ_change_theme_alpha = true
    vim.cmd('highlight Normal guibg=NONE ctermbg=None')
  else
    local color = '#282c34'  -- onedark bg color
    if vim.g.colors_name == 'gruvbox' then
      color = vim.o.background == 'dark' and '#1d2021' or '#FFFFFF'
    end
    JSJ_change_theme_alpha = false
    vim.cmd('highlight! Normal guibg=' .. color)
  end
  vim.cmd('hi! link SignColumn LineNr')
end

_M.Jsj_ToggleList = function(listname, perfix)
  if #vim.fn.filter(vim.fn.getwininfo(), 'v:val.' .. listname) == 0 then
    xpcall(vim.cmd,
          function() vim.api.nvim_err_writeln("Location List is Empty.") end,
          perfix .. 'open')
  else
    vim.cmd(perfix .. 'close')
  end
end

_M.Jsj_colorbuddy = function(name, bg)
  if bg == nil then
    bg = 'dark'
  end
  vim.api.nvim_command(string.format("set background=%s", bg))
  vim.api.nvim_command(string.format("luafile %s", vim.fn.expand('$HOME') .. '/.config/nvim/lua/jsj-theme/' .. name .. '.lua'))
  if JSJ_change_theme_alpha then  -- lua/init-style.lua
    vim.api.nvim_command('highlight Normal guibg=NONE ctermbg=None')
    vim.api.nvim_command('hi! link SignColumn LineNr')
  end
end

_M.Jsj_CheckHlGroup = function()
  local l = vim.fn.line('.')
  local c = vim.fn.col('.')
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

  if synHlName ~= '' or synTransHlName ~= '' then
    if synHlName == '' or synTransHlName == '' then
      info = string.format("%s\nsynName=`%s`", info, synHlName == '' and synTransHlName or synHlName)
    elseif synTransHlName == synHlName then
      info = string.format("%s\nsynName=`%s`", info, synHlName)
    else
      info = string.format("%s\nsynHlName=`%s->%s`", info, synHlName, synTransHlName)
    end
  end
  if fg ~= '' then
    info = string.format("%s\nfg=`%s`", info, fg)
  end
  if bg ~= '' then
    info = string.format("%s\nbg=`%s`", info, bg)
  end
  if info == "synName=``" then
    vim.api.nvim_err_writeln('There is no syntex item.')
  else
    print(info)
  end
end

_M.fcitx2en = function()
  if tonumber(vim.fn.system('fcitx5-remote')) == 2 then
    vim.fn.system('fcitx5-remote -c')
  end
end

_M.showFilePath = function()
  print(vim.fn.expand('%:p'))
end

return _M
