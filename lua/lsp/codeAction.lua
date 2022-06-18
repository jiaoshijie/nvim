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

local handler_factory = function(client_id, line, bufnr)
  local code_action_handler = function(responses)
    if responses[client_id] and not responses[client_id].error then
      if responses[client_id].result and not vim.tbl_isempty(responses[client_id].result) then
        update_sign(vim.b.lightbulb_line, line + 1, bufnr)
      else
        update_sign(vim.b.lightbulb_line, nil, bufnr)
      end
    end
  end

  return code_action_handler
end

local request_codeAction = function(client_id, bufnr)
  local params = vim.lsp.util.make_range_params()
  vim.lsp.buf_request_all(bufnr, "textDocument/codeAction", params,
    handler_factory(client_id, params.range.start.line, bufnr))
end

function _M.on_attach(client, bufnr)
  if vim.b.jsj_lsp_codeAction_client_id ~= nil then
    return
  end
  vim.b.jsj_lsp_codeAction_client_id = client.id
  local group = vim.api.nvim_create_augroup("lsp_codeAction", { clear = false })
  vim.api.nvim_clear_autocmds({
    buffer = bufnr,
    group = group,
  })
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
