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
  use("sirver/ultisnips")
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")

  -- formatting
  use("editorconfig/editorconfig-vim")
  use("sbdchd/neoformat")

  -- misc
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
  use("lewis6991/gitsigns.nvim")
  use("sainnhe/gruvbox-material")
  use("lukas-reineke/indent-blankline.nvim")
  use("arkav/lualine-lsp-progress")
  use("nvim-lualine/lualine.nvim")
  use({ "nvim-treesitter/nvim-treesitter-context", after = "nvim-treesitter" })
  use("nvim-tree/nvim-web-devicons")

  if PackerBootstrap then
    require("packer").sync()
  end
end)
