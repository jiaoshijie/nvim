local command = vim.api.nvim_create_user_command
local lsp_config = require("lsp.config")
local api = vim.api

-- https://code.visualstudio.com/api/references/icons-in-labels
vim.lsp.protocol.CompletionItemKind = {
  "  (Text) ",
  "  (Method)",
  "  (Function)",
  "  (Constructor)",
  "  (Field)",
  "  (Variable)",
  "  (Class)",
  "  (Interface)",
  "  (Module)",
  "  (Property)",
  "  (Unit)",
  "  (Value)",
  "  (Enum)",
  "  (Keyword)",
  "  (Snippet)",
  "  (Color)",
  "  (File)",
  "  (Reference)",
  "  (Folder)",
  "  (EnumMember)",
  "  (Constant)",
  "  (Struct)",
  "  (Event)",
  "  (Operator)",
  "  (TypeParameter)",
}

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  -- Use a sharp border with `FloatBorder` highlights
  border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  -- Use a sharp border with `FloatBorder` highlights
  border = "rounded",
})

vim.diagnostic.config({
  virtual_text = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN]  = "",
      [vim.diagnostic.severity.HINT] = "",
      [vim.diagnostic.severity.INFO] = "󰋽",
    }
  },
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = {
    border = "rounded",
  },
})

command("LspStart", function(opts)
  local server_name = opts.args  -- NOTE: or `opts.fargs`, maybe it doesn't matter at all.
  local config = lsp_config[server_name]
  if  config ~= nil then
    if vim.fn.executable(config.cmd[1]) ~= 0 then
      -- NOTE: need to reopen the already opened files, using `:e`
      local group = vim.api.nvim_create_augroup("UserLspStart_" .. server_name, { clear = true })
      vim.api.nvim_create_autocmd("FileType", {
        group = group,
        pattern = config.filetypes,
        callback = function(_)
          vim.lsp.start(config)
        end,
      })
    else
      api.nvim_err_writeln("ERROR: `" .. config.cmd[1] .. "` is not executable!!!")
    end
  else
    api.nvim_err_writeln("ERROR: This file type `" .. server_name .. "` doesn't support lsp")
  end
end, {
  nargs = 1,
  complete = function(_, line)
    local pre_input = vim.split(line, "%s+")[2]
    local keys = {}
    for k, _ in pairs(lsp_config) do
      table.insert(keys, k)
    end
    table.sort(keys)

    if pre_input ~= 0 then
      return vim.tbl_filter(function(val)
        return vim.startswith(val, pre_input)
      end, keys)
    end
    return keys
  end,
})

-- NOTE: if want to Stop the Lsp, then just `:mksession` and quit and reopen
-- and `:source Session.vim`
