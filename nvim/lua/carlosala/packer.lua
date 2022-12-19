local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local PackerBootstrap = nil
if fn.empty(fn.glob(install_path)) > 0 then
  PackerBootstrap = 1
  fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
  vim.cmd("packadd packer.nvim")
end

require("packer").startup(function(use)
  use("wbthomason/packer.nvim")

  -- cmp & lsp
  use("neovim/nvim-lspconfig")
  use("hrsh7th/nvim-cmp")
  use("onsails/lspkind.nvim")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-nvim-lsp-signature-help")
  use("hrsh7th/cmp-path")
  use("jose-elias-alvarez/typescript.nvim")
  use("jalvesaq/nvim-r")
  use("l3mon4d3/luasnip")
  use("saadparwaiz1/cmp_luasnip")
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")
  use("b0o/schemastore.nvim")

  -- formatting
  use("editorconfig/editorconfig-vim")
  use("sbdchd/neoformat")

  -- misc
  use("lewis6991/impatient.nvim")
  use("tpope/vim-fugitive")

  -- navigation
  use({ "nvim-telescope/telescope.nvim", requires = "nvim-lua/plenary.nvim" })
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
  use("nvim-tree/nvim-tree.lua")

  -- syntax
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
  use("neoclide/jsonc.vim")
  use("fladson/vim-kitty")

  -- typing
  use("numtostr/comment.nvim")
  use("windwp/nvim-autopairs")
  use("kylechui/nvim-surround")
  use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" })

  -- visual
  use("j-hui/fidget.nvim")
  use("lewis6991/gitsigns.nvim")
  use("sainnhe/gruvbox-material")
  use("lukas-reineke/indent-blankline.nvim")
  use("nvim-lualine/lualine.nvim")
  use({ "nvim-treesitter/nvim-treesitter-context", after = "nvim-treesitter" })
  use("nvim-tree/nvim-web-devicons")

  if PackerBootstrap then
    require("packer").sync()
  end
end)
