-- https://github.com/sumneko/lua-language-server/wiki/Build-and-Run-(Standalone)
-- use `sudo pacman -S lua-language-server`
local sumneko_root_path = '/usr/share/lua-language-server'
local sumneko_binary = '/usr/bin/lua-language-server'

return {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = vim.split(package.path, ';')
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {
          'vim',  -- nvim stuff
          'describe', 'it', 'pending', 'before_each', 'after_each', 'clear', 'assert',  -- plenary test stuff
          'Jsj_undotree'  -- my plugin global variable
        }
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        }
      }
    }
  },
}
