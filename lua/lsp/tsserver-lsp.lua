-- npm install -g typescript typescript-language-server
local lsputil = require'lspconfig/util'
return {
  root_dir = function(fname)
    return lsputil.find_git_ancestor(fname) or lsputil.path.dirname(fname)  -- TODO
  end,
}
