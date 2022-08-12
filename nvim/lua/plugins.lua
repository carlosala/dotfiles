vim.cmd("packadd packer.nvim")

require("packer").startup(function(use)
  use("wbthomason/packer.nvim")

  -- completion
  use({ "neoclide/coc.nvim", branch = "release" })
  use("sirver/ultisnips")

  -- formatting
  use("editorconfig/editorconfig-vim")
  use("rhysd/vim-clang-format")

  -- git
  use({
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  })
  use("tpope/vim-fugitive")

  -- navigation
  use({ "junegunn/fzf", run = "./install --bin" })
  use("junegunn/fzf.vim")
  use({
    "kyazdani42/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup({
        actions = { open_file = { quit_on_open = true } },
        git = { ignore = false },
      })
    end,
  })
  use("christoomey/vim-tmux-navigator")

  -- syntax
  use({
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = "all",
        highlight = { enable = true },
        incremental_selection = { enable = true },
        indent = { enable = true },
      })
      require("nvim-treesitter.parsers").filetype_to_parsername.json = "jsonc"
    end,
    run = ":TSUpdate",
  })
  use("neoclide/jsonc.vim")
  use("fladson/vim-kitty")
  use("jxnblk/vim-mdx-js")

  -- typing
  use({
    "numtostr/comment.nvim",
    config = function()
      require("Comment").setup({ ignore = "^$" })
    end,
  })
  use({
    "windwp/nvim-autopairs",
    config = function()
      Npairs = require("nvim-autopairs")
      Npairs.setup({ check_ts = true, map_cr = false })
    end,
  })
  use({
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup()
    end,
  })
  use({
    "windwp/nvim-ts-autotag",
    after = "nvim-treesitter",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  })

  -- visual
  use({
    "sainnhe/gruvbox-material",
    config = function()
      vim.cmd("colorscheme gruvbox-material")
    end,
  })
  use({
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup({
        filetype_exclude = {
          "checkhealth",
          "gitcommit",
          "help",
          "NvimTree",
          "vim-plug",
        },
        use_treesitter = true,
      })
    end,
  })
  use({
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({
        extensions = { "fzf", "nvim-tree" },
        sections = {
          lualine_x = { { "g:coc_status" }, "progress" },
          lualine_y = { "filetype" },
        },
      })
    end,
  })
  use("kyazdani42/nvim-web-devicons")

  if PackerBootstrap then
    require("packer").sync()
  end
end)
