-- https://github.com/doodleEsc/lightbulb.nvim
local _M = {}

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

local handler_factory = function(client_id, line, bufnr)
  local code_action_handler = function(responses)
    if responses[client_id].result and not vim.tbl_isempty(responses[client_id].result) then
      update_sign(vim.b.lightbulb_line, line + 1, bufnr)
    else
      update_sign(vim.b.lightbulb_line, nil, bufnr)
    end
  end

  return mk_handler(code_action_handler)
end

local request_codeAction = function(client_id, bufnr)
  local params = vim.lsp.util.make_range_params()
  vim.lsp.buf_request_all(0, "textDocument/codeAction", params, handler_factory(client_id, params.range.start.line, bufnr))
end

function _M.on_attach(client, bufnr)
  local group = vim.api.nvim_create_augroup("lsp_codeAction", { clear = true })
  vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
    buffer = bufnr,
    group = group,
    callback = function()
      request_codeAction(client.id, bufnr)
    end,
  })
end

_M.setup = function()
  if vim.tbl_isempty(vim.fn.sign_getdefined("Jsj_codeAction")) then
    vim.fn.sign_define("Jsj_codeAction", { text = "💡", linehl = false, numhl = false, texthl = "MoreMsg" })
  end
end

return _M
