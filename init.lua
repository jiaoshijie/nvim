--             _                                  __ _
--  _ ____   _(_)_ __ ___         ___ ___  _ __  / _(_) __ _
-- | '_ \ \ / / | '_ ` _ \ _____ / __/ _ \| '_ \| |_| |/ _` |
-- | | | \ V /| | | | | | |_____| (_| (_) | | | |  _| | (_| |
-- |_| |_|\_/ |_|_| |_| |_|      \___\___/|_| |_|_| |_|\__, |
--                                                     |___/

local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
  vim.cmd("packadd packer.nvim")
end

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})


require("init-basic")
require("init-tabsize")
require("init-keymaps")
require("init-style")
require("init-neovide")

packer.startup(function(use)
  -- {{{ Installer
  use({ "wbthomason/packer.nvim" })
  -- }}}

  use({
    "nvim-lua/plenary.nvim",
    config = function()
      vim.keymap.set("n", "<leader>T", "<Plug>PlenaryTestFile", { noremap = true, silent = true })
    end,
  })
  use({
    "kyazdani42/nvim-web-devicons",
  })

  -- {{{ Lsp
  use({
    "neovim/nvim-lspconfig",
    config = function()
      require("lsp")
    end,
  })
  -- }}}

  -- {{{ Telescope
  use({
    "nvim-telescope/telescope.nvim",
    branch = '0.1.x',
    config = function()
      require("jsj-telescope")
    end,
  })
  -- }}}

  -- {{{ Treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("jsj-treesitter")
    end,
    run = ":TSUpdate",
    requires = {
      { "nvim-treesitter/playground" },
    },
  })
  -- }}}

  use({
    "toppair/peek.nvim",  -- pacman -S webkit2gtk
    run = "deno task --quiet build:fast",
    config = function()
      require('peek').setup({
        auto_load = false,
        close_on_bdelete = false,
        syntax = true,
        theme = 'light', -- 'dark' or 'light'
        update_on_change = false,
      })
      vim.api.nvim_create_user_command('PeekToggle', function()
        if require('peek').is_open() then
          require('peek').close()
        else
          require('peek').open()
        end
      end, {})
    end,
  })

  -- using `column` to align text
  -- https://stackoverflow.com/questions/8964953/align-text-on-an-equals-sign-in-vim
  -- markdown table: `!column -t -s "|" -o "|"` `!column -t -s \| -o \|`
  use({
    "tpope/vim-surround",
    requires = {
      "tpope/vim-repeat",
    },
  })

  use({
    "godlygeek/tabular"
  })

  require('init-undotree')
end)
