-- https://github.com/doodleEsc/lightbulb.nvim
local _M = {}

local contains = function(tbl, val)
    for _, value in ipairs(tbl) do
        if value == val then
            return true
        end
    end
    return false
end

local update_sign = function(old_line, new_line, bufnr)
  bufnr = bufnr or "%"
  if old_line and (old_line ~= new_line) then
    vim.fn.sign_unplace("Jsj_code", { id = old_line, buffer = bufnr })
  end
  if new_line and (old_line ~= new_line) then
    vim.fn.sign_place(new_line, "Jsj_code", "Jsj_codeAction", bufnr, { lnum = new_line, priority = 13 })
  end
  vim.b.lightbulb_line = new_line
end

local mk_handler = function(fn)
  return function(...)
    local config_or_client_id = select(4, ...)
    local is_new = type(config_or_client_id) ~= "number"
    if is_new then
      fn(...)
    else
      local err = select(1, ...)
      local method = select(2, ...)
      local result = select(3, ...)
      local client_id = select(4, ...)
      local bufnr = select(5, ...)
      local config = select(6, ...)
      fn(err, result, { method = method, client_id = client_id, bufnr = bufnr }, config)
    end
  end
end

local handler_factory = function(line, bufnr)
  local code_action_handler = function(responses)
    local has_actions = false
    for _, resp in pairs(responses) do
      if resp.result and not vim.tbl_isempty(resp.result) then
        has_actions = true
        break
      end
    end
    if not has_actions then
      update_sign(vim.b.lightbulb_line, nil, bufnr)
    else
      update_sign(vim.b.lightbulb_line, line + 1, bufnr)
    end
  end

  return mk_handler(code_action_handler)
end

local check = function()
  local code_action_cap_found = false
  local active_clients = vim.lsp.get_active_clients()
  for _, client in pairs(active_clients) do
    if client then
      if client.supports_method("textDocument/codeAction") and contains(client.config.filetypes, vim.bo.filetype) then
        code_action_cap_found = true
      end
    end
  end
  local current_file = vim.api.nvim_buf_get_name(0)
  local is_file = vim.loop.fs_stat(current_file) ~= nil
  if not code_action_cap_found or not is_file then
    return
  end

  local params = vim.lsp.util.make_range_params()
  local bufnr = vim.api.nvim_get_current_buf()
  vim.lsp.buf_request_all(0, "textDocument/codeAction", params, handler_factory(params.range.start.line, bufnr))
end

_M.setup = function()
  if vim.tbl_isempty(vim.fn.sign_getdefined("Jsj_codeAction")) then
    vim.fn.sign_define("Jsj_codeAction", { text = "💡", linehl = false, numhl = false, texthl = "MoreMsg" })
  end
  local group = vim.api.nvim_create_augroup("lsp_codeAction", { clear = true })
  vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
    group = group,
    callback = check,
  })
end

return _M
