-- https://github.com/SmiteshP/nvim-navic
-- https://github.com/SmiteshP/nvim-gps

local _M = {}

local statusline_symbols = {}
local statusline_context = {}

-- stylua: ignore
-- local lsp_str_to_num = {
--   File          = 1,
--   Module        = 2,
--   Namespace     = 3,
--   Package       = 4,
--   Class         = 5,
--   Method        = 6,
--   Property      = 7,
--   Field         = 8,
--   Constructor   = 9,
--   Enum          = 10,
--   Interface     = 11,
--   Function      = 12,
--   Variable      = 13,
--   Constant      = 14,
--   String        = 15,
--   Number        = 16,
--   Boolean       = 17,
--   Array         = 18,
--   Object        = 19,
--   Key           = 20,
--   Null          = 21,
--   EnumMember    = 22,
--   Struct        = 23,
--   Event         = 24,
--   Operator      = 25,
--   TypeParameter = 26,
-- }

-- stylua: ignore
local lsp_num_to_str = {
  [1]  = "File",
  [2]  = "Module",
  [3]  = "Namespace",
  [4]  = "Package",
  [5]  = "Class",
  [6]  = "Method",
  [7]  = "Property",
  [8]  = "Field",
  [9]  = "Constructor",
  [10] = "Enum",
  [11] = "Interface",
  [12] = "Function",
  [13] = "Variable",
  [14] = "Constant",
  [15] = "String",
  [16] = "Number",
  [17] = "Boolean",
  [18] = "Array",
  [19] = "Object",
  [20] = "Key",
  [21] = "Null",
  [22] = "EnumMember",
  [23] = "Struct",
  [24] = "Event",
  [25] = "Operator",
  [26] = "TypeParameter",
}

-- stylua: ignore
local icons = {
  [1] = " ", -- File
  [2] = " ", -- Module
  [3] = " ", -- Namespace
  [4] = " ", -- Package
  [5] = " ", -- Class
  [6] = " ", -- Method
  [7] = " ", -- Property
  [8] = " ", -- Field
  [9] = " ", -- Constructor
  [10] = "練", -- Enum
  [11] = "練", -- Interface
  [12] = " ", -- Function
  [13] = " ", -- Variable
  [14] = " ", -- Constant
  [15] = " ", -- String
  [16] = " ", -- Number
  [17] = "◩ ", -- Boolean
  [18] = " ", -- Array
  [19] = " ", -- Object
  [20] = " ", -- Key
  [21] = "ﳠ ", -- Null
  [22] = " ", -- EnumMember
  [23] = " ", -- Struct
  [24] = " ", -- Event
  [25] = " ", -- Operator
  [26] = " ", -- TypeParameter
}

local in_range = function(cursor_pos, range)
  local line = cursor_pos[1]
  local char = cursor_pos[2]
  if line < range["start"].line + 1 then
    return -1
  elseif line > range["end"].line + 1 then
    return 1
  end

  if line == range["start"].line + 1 and char < range["start"].character then
    return -1
  elseif line == range["end"].line + 1 and char > range["end"].character then
    return 1
  end

  return 0
end

local request_symbols = function(client_id, bufnr, handler)
  vim.lsp.buf_request_all(
    bufnr,
    "textDocument/documentSymbol",
    { textDocument = vim.lsp.util.make_text_document_params() },
    function(responses)
      if responses
          and responses[client_id]
          and not responses[client_id].error
          and responses[client_id].result
          and not vim.tbl_isempty(responses[client_id].result)
      then
        handler(bufnr, responses[client_id].result)
      end
    end
  )
end

local function parse_dfs(symbols)
  local ret = {}
  for i, v in ipairs(symbols) do
    local curr_parsed_symbol = {}
    -- NOTICE: only need modify this position below, when lsp range is not corrent
    local range = v.range or v.location.range -- `v.location.range` for bashls
    if range ~= nil then

      curr_parsed_symbol = {
        index = i,
        name = v.name,
        kind = v.kind,
        range = range,
      }
      if v.children then
        curr_parsed_symbol["children"] = parse_dfs(v.children)
      end
    end
    ret[#ret + 1] = curr_parsed_symbol
  end

  return ret
end

local update_symbols = function(bufnr, symbols)
  statusline_symbols[bufnr] = parse_dfs(symbols)
end

local update_context = function(bufnr)
  local cursor_pos = vim.api.nvim_win_get_cursor(0)
  if statusline_context[bufnr] == nil then
    statusline_context[bufnr] = {}
  end
  local old = statusline_context[bufnr]
  local new = {}
  local curr = statusline_symbols[bufnr]

  for _, context in ipairs(old) do
    if in_range(cursor_pos, context.range) == 0
        and curr[context.index] ~= nil
        and context.name == curr[context.index].name
        and context.kind == curr[context.index].kind
    then
      table.insert(new, curr[context.index])
      curr = curr[context.index].children
    else
      break
    end
  end

  while curr ~= nil do
    local go_deeper = false
    local l = 1
    local r = #curr
    while l <= r do
      local m = ((l + r) - (l + r) % 2) / 2
      local cmp = in_range(cursor_pos, curr[m].range)
      if cmp == -1 then
        r = m - 1
      elseif cmp == 1 then
        l = m + 1
      else
        table.insert(new, curr[m])
        curr = curr[m].children
        go_deeper = true
        break
      end
    end
    if not go_deeper then
      break
    end
  end

  statusline_context[bufnr] = new
end

local prepare_data = function()
  local data = statusline_context[vim.api.nvim_get_current_buf()]
  if data == nil then
    return nil
  end
  local ret = {}

  for _, v in ipairs(data) do
    table.insert(ret, {
      kind = v.kind,
      type = lsp_num_to_str[v.kind],
      name = v.name,
      icon = icons[v.kind],
    })
  end

  return ret
end

function _M.lsp_component()
  local data = prepare_data()
  local text = ""
  if data ~= nil then
    for _, v in ipairs(data) do
      text = text .. '  ' .. v.icon .. v.name
    end
  end
  return text
end

function _M.on_attach(client, bufnr)
  if vim.b.statusline_lsp_client_id ~= nil then
    return
  end
  vim.b.statusline_lsp_client_id = client.id
  local statusline_lsp_augroup = vim.api.nvim_create_augroup("statusline_lsp_component", { clear = false })
  vim.api.nvim_clear_autocmds({
    buffer = bufnr,
    group = statusline_lsp_augroup,
  })

  -- TODO: `BufEnter` doesn't work
  vim.api.nvim_create_autocmd({ "InsertLeave", "BufEnter" }, {
    group = statusline_lsp_augroup,
    buffer = bufnr,
    callback = function()
      request_symbols(client.id, bufnr, update_symbols)
    end,
  })

  vim.api.nvim_create_autocmd({ "CursorMoved", "CursorHold" }, {
    group = statusline_lsp_augroup,
    buffer = bufnr,
    callback = function()
      update_context(bufnr)
    end,
  })

  vim.api.nvim_create_autocmd({ "BufDelete", "BufWipeout" }, {
    group = statusline_lsp_augroup,
    buffer = bufnr,
    callback = function()
      statusline_symbols[bufnr] = nil
      statusline_context[bufnr] = nil
    end,
  })
end

return _M
