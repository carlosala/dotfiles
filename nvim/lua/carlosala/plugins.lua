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
  use({
    "nvim-telescope/telescope.nvim",
    config = function()
      require("telescope").setup({
        pickers = {
          find_files = { find_command = { "fd", "-t=f", "-i", "-H", "-E", ".git", "-c=never", "--strip-cwd-prefix" } },
          grep_string = {
            additional_args = function()
              return { "-i", "--hidden", "-g", "!.git", "-g", "!.yarn", "-g", "!*lock" }
            end,
            disable_coordinates = true,
          },
        },
      })
    end,
    requires = "nvim-lua/plenary.nvim",
  })
  use({
    "nvim-telescope/telescope-fzf-native.nvim",
    after = "telescope.nvim",
    config = function()
      require("telescope").load_extension("fzf")
    end,
    run = "make",
  })
  use({
    "kyazdani42/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup({
        actions = { open_file = { quit_on_open = true } },
        git = { ignore = false },
      })
    end,
  })

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
    after = "nvim-treesitter",
    config = function()
      require("nvim-autopairs").setup({ check_ts = true, map_cr = false })
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
    after = "nvim-treesitter",
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
        extensions = { "fugitive", "nvim-tree" },
        sections = {
          lualine_x = { { "g:coc_status" }, "progress" },
          lualine_y = { "filetype" },
        },
      })
    end,
  })
  use({ "nvim-treesitter/nvim-treesitter-context", after = "nvim-treesitter" })
  use("kyazdani42/nvim-web-devicons")

  if PackerBootstrap then
    require("packer").sync()
  end
end)
