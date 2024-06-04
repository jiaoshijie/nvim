local found, gf = pcall(require, "grug-far")

if not found then
  return
end

gf.setup({
  -- TODO: only search when leaving insert mode
  startInInsertMode = false,
  headerMaxWidth = 80,
  placeholders = {
    -- whether to show placeholders
    enabled = true,

    search = ' ex: foo    foo([a-z0-9]*)    fun\\( ',
    replacement = ' ex: bar    ${1}_foo    $$MY_ENV_VAR ',
    filesFilter = ' ex: *.lua     *.{css,js}    **/docs/*.md ',
    flags = ' ex: --help --ignore-case (-i) <relative-file-path> --replace= (empty replace) --multiline (-U) ',
  },
})

local command = vim.api.nvim_create_user_command

command("GSr", gf.grug_far, { nargs = 0 })
