local _M = {}
local fmt = string.format
local o, wo = vim.o, vim.wo
local funcs = require("init-statusline.functions")
local git_branch = require("init-statusline.git_branch")
local h = require("init-utils").global_hl

local options = {
  colors = require("init-statusline.theme"),
  sections = {
    -- { class = "ArchIcon", item = funcs.get_ArchIcon },
    { class = "mode",     item = funcs.get_mode },
    { class = "git",      item = funcs.git_branch },
    { item = "%<" },
    -- { class = "info",     item = funcs.get_paste },
    { class = "info",     item = funcs.get_spell },
    { class = "file",     item = funcs.get_filetype },
    { class = "lsp",      item = funcs.get_lsp_com },
    { item = "%=" },
    { class = "lsp",      item = funcs.get_lsp_information },
    { class = "lsp",      item = funcs.get_lsp_hint },
    { class = "lsp",      item = funcs.get_lsp_warning },
    { class = "lsp",      item = funcs.get_lsp_error },
    { class = "file",     item = funcs.get_space_tab },
    { class = "file",     item = funcs.get_fileformat },
    { class = "mode",     item = funcs.get_filepos },
  },
  winbar_sections = {
    { item = "%<" },
    { class = "file", item = funcs.winbar_get_filename },
    { class = "file", item = funcs.get_fileinfo },
  },
}

local sethlgroups = function()
  local group = vim.api.nvim_create_augroup("Jsj_Statusline_Colors", { clear = true })
  vim.api.nvim_create_autocmd({ "VimEnter", "ColorScheme" }, {
    pattern = "*",
    group = group,
    callback = function()
      h("StatusLine", { bg = "#2c323c" })
      h("StatusLineNC", { bg = "#5c6370" })
      h("WinBar", { link = "StatusLine" })
      h("WinBarNC", { link = "StatusLineNC" })
    end,
  })
  for class, attr in pairs(options.colors) do
    for state, args in pairs(attr) do
      local hlgroup = fmt("Statusline_%s_%s", class, state)
      vim.api.nvim_create_autocmd({ "VimEnter", "ColorScheme" }, {
        pattern = "*",
        group = group,
        callback = function() h(hlgroup, args) end,
      })
    end
  end
end

local highlight_section = function(section)
  if type(section.item) == "string" then
    return section.item
  end
  local hg = fmt("Statusline_%s_%s", section.class, section.item().state)
  return fmt("%%#%s#%s%%*", hg, section.item().text)
end

local highlight_sections = function(sections)
  return vim.tbl_map(highlight_section, sections)
end

_M.update_statusline = function()
  return table.concat(highlight_sections(options.sections))
end

_M.update_winbar = function()
  return table.concat(highlight_sections(options.winbar_sections))
end

local set_statusline = function()
  o.showmode = false
  o.statusline = [[%!luaeval('require("init-statusline").update_statusline()')]]
  wo.statusline = o.statusline
end

local set_winbar = function()
  o.winbar = [[%!luaeval('require("init-statusline").update_winbar()')]]
  wo.winbar = o.winbar
end

_M.setup = function()
  sethlgroups()
  set_statusline()
  set_winbar()
  git_branch.setup()
end

return _M
