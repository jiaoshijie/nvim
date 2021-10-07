-- TODO: not use this
local _M = {}
local lsp_util = vim.lsp.util

function _M.code_action_listener()
  local params = lsp_util.make_range_params()
  vim.lsp.buf_request(0, 'textDocument/codeAction', params, function(err, _, result)
    if err ~= nil then
      return
    end
    if result ~= nil then
      vim.fn.sign_place(1, "Jsj_code", "Jsj_codeAction", vim.fn.bufname(), {lnum=vim.fn.line('.')})
    end
  end
  )
end

function _M.remove_code_action()
  local params = lsp_util.make_range_params()
  vim.lsp.buf_request(0, 'textDocument/codeAction', params, function(err)
    if err ~= nil then
      return
    end
    vim.fn.sign_unplace("Jsj_code", {buffer = vim.fn.bufname(), id = 1})
  end
  )
end

return _M
