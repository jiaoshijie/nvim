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

  -- {{{ basic configs
  require("init-basic")
  require("init-config")
  require("init-tabsize")
  require("init-style")
  require("init-keymaps")
  require("init-mdSnippets")
  -- }}}

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
    config = function()
      require("jsj-telescope")
    end,
    requires = {
      {
        "nvim-lua/plenary.nvim",
        config = function()
          vim.keymap.set("n", "<leader>T", "<Plug>PlenaryTestFile", { noremap = true, silent = true })
        end,
      },
      { "kyazdani42/nvim-web-devicons" },
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
    },
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
    requires = {
      { "nvim-lua/plenary.nvim" },
    },
  })
  -- }}}

  use({
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "!*" })
    end,
  })

  use({
    "folke/tokyonight.nvim",
  })

  use({
    "nvim-pack/nvim-spectre",
    requires = {
      { "nvim-lua/plenary.nvim" },
    },
    config = function()
      local opt = { silent = true, noremap = true }
      vim.keymap.set("n", "<leader>rr", require("spectre").open, opt)
      vim.keymap.set("n", "<leader>rl", require("spectre").open_file_search, opt)
      vim.keymap.set("n", "<leader>rw", function()
        require("spectre").open_visual({ select_word = true })
      end, opt)
      vim.keymap.set("v", "<leader>rw", require("spectre").open_visual, opt)
    end,
  })

  use({
    "tpope/vim-surround",
    requires = { "tpope/vim-repeat" },
  })

  use({
    "godlygeek/tabular",
  })
end)
