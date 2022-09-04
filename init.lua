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

packer.startup(function(use)
  -- {{{ Installer
  use({ "wbthomason/packer.nvim" })
  -- }}}

  require("init-basic")
  require("init-tabsize")
  require("init-keymaps")
  require("init-style")

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

  -- {{{ Git
  use({
    "lewis6991/gitsigns.nvim",
    config = function()
      require("jsj-gitsigns")
    end,
  })
  use({
    "TimUntersberger/neogit",
    config = function()
      require("jsj-neogit")
    end,
  })
  use({
    "sindrets/diffview.nvim",
    config = function()
      require("diffview").setup()
    end,
  })
  -- }}}

  use({
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({
        filetypes = { "!*" },
      })
    end,
  })

  use({
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup()
    end,
  })

  -- using `column` to align text
  -- https://stackoverflow.com/questions/8964953/align-text-on-an-equals-sign-in-vim

  require("init-statusline")
  require('init-undotree')
  require("init-neovide")
end)
