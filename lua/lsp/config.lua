-- NOTE: most config just copied from https://github.com/neovim/nvim-lspconfig/
-- Because WHY NOT!!!

-- 1. rustup component add rust-analyzer
local rust_config = {
  name = "rust language server",
  -- TODO: check execuable also succeed, even if rust-analyzer not installed
  cmd = { "rustup", "run", "nightly", "rust-analyzer" },
  root_dir = vim.fs.root(0, {"Cargo.toml", "rust-project.json", ".git"}),
  on_attach = require("lsp.on_attach"),
  filetypes = { "rust" },
}

-- 1. pacman -S lua-language-server
-- 2. install from github release page
local lua_config = {
  name = "lua language server",
  cmd = { "lua-language-server" },
  root_dir = vim.fs.root(0, { ".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml", ".git"}),
  on_attach = require("lsp.on_attach"),
  filetypes = { "lua" },
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {
          'vim',
          'require'
        },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

-- 1. pacman -S bash-language-server shellcheck
local bash_config = {
  name = "bash language server",
  cmd = { 'bash-language-server', 'start' },
  on_attach = require("lsp.on_attach"),
  filetypes = { "sh" },
  single_file_support = true,
  settings = {
    bashIde = {
      -- Glob pattern for finding and parsing shell script files in the workspace.
      -- Used by the background analysis features across files.

      -- Prevent recursive scanning which will cause issues when opening a file
      -- directly in the home directory (e.g. ~/foo.sh).
      --
      -- Default upstream pattern is "**/*@(.sh|.inc|.bash|.command)".
      globPattern = vim.env.GLOB_PATTERN or '*@(.sh|.inc|.bash|.command)',
    },
  },
}

local _S = {
  rust = rust_config,
  lua = lua_config,
  sh = bash_config,
}

return _S
