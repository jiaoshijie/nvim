local command = vim.api.nvim_create_user_command
local copt = { nargs = 0 }

local _M = {}
local plugins = {}

local plugins_dir = vim.fn.stdpath('data') .. '/site/pack/plugins/opt/'

local use = function(uri)
  local plugin = string.match(uri, '[^/]+$')

  table.insert(plugins, {
    uri = uri,
    plugin = plugin,
  })

  local dir = vim.loop.fs_stat(plugins_dir .. plugin)
  if not dir then
    return
  end

  vim.cmd('packadd ' .. plugin)
end

_M.install = function()
  vim.fn.system {
    'git',
    '-C',
    plugins_dir,
    'rev-parse'
  }

  if vim.v.shell_error ~= 0 then
    print('Initialing ' .. plugins_dir .. ' to git directory')
    vim.fn.system {'mkdir', '-p', plugins_dir}
    local output = vim.fn.system {
      'git',
      '-C',
      plugins_dir,
      'init'
    }
    print(output)
  end

  print 'Installing packages...'

  for _, pkg in pairs(plugins) do
    local plugin, uri = pkg.plugin, pkg.uri
    local dir = vim.loop.fs_stat(plugins_dir .. plugin)

    if not dir then
      print('Installing ' .. uri .. '...')

      local git_uri = 'https://github.com/' .. uri

      local output = vim.fn.system {
        'git',
        '-C',
        plugins_dir,
        'submodule',
        'add',
        '-f',
        '--depth',
        1,
        git_uri,
        string.format('./%s', plugin),
      }

      print(output)
    end
  end

  vim.fn.system {
    'git',
    '-C',
    plugins_dir,
    'submodule',
    'update',
    '--init',
    '--depth',
    1,
    '--recursive',
  }

  vim.cmd [[so ~/.config/nvim/lua/init-pkg.lua]]

  vim.cmd 'helptags ALL'

  print 'Installing finished.'
end

_M.update = function()
  print 'Updating packages...'

  local output = vim.fn.system {
    'git',
    '-C',
    plugins_dir,
    'submodule',
    'update',
    '-f',
    '--remote',
    '--init',
    '--depth',
    1,
    '--recursive',
  }

  print(output)

  vim.cmd [[so ~/.config/nvim/lua/init-pkg.lua]]

  print 'Updating finished.'
end

_M.clean = function()
  local handle = vim.loop.fs_scandir(plugins_dir)
  local function iter()
    return vim.loop.fs_scandir_next(handle)
  end

  for name, _ in iter do
    local exist = #vim.tbl_filter(function(pkg)
      return pkg.plugin == name
    end, plugins) == 1

    if not exist then
      local module_name = name
      print('Cleaning ' .. name .. ' package...')

      vim.fn.system {
        'git',
        '-C',
        plugins_dir,
        'submodule',
        'deinit',
        '-f',
        module_name,
      }

      vim.fn.system {
        'git',
        '-C',
        plugins_dir,
        'rm',
        '--cached',
        module_name,
      }

      vim.fn.system {
        'git',
        '-C',
        plugins_dir,
        'config',
        '-f',
        '.gitmodules',
        '--remove-section',
        string.format('submodule.%s', module_name),
      }

      vim.fn.system {
        'rm',
        '-rf',
        string.format('%s/%s', plugins_dir, module_name),
      }

      vim.fn.system {
        'rm',
        '-r',
        string.format('%s/.git/modules/%s', plugins_dir, module_name),
      }

      package.loaded[name] = nil

      print('Cleaning ' .. name .. ' package done!')
    end
  end

  vim.cmd [[so ~/.config/nvim/lua/init-pkg.lua]]
end

command("PkgInstall", _M.install, copt)
command("PkgUpdate", _M.update, copt)
command("PkgClean", _M.clean, copt)

local setup = function()
  use "kyazdani42/nvim-web-devicons"
  use "nvim-lua/plenary.nvim"

  use "neovim/nvim-lspconfig"

  use "nvim-treesitter/nvim-treesitter"

  use "nvim-telescope/telescope.nvim"

  use "tpope/vim-surround"
  use "tpope/vim-repeat"

  use "godlygeek/tabular"

  use "toppair/peek.nvim"
end

setup()
