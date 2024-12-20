---@type LazySpec
return {
  "pteroctopus/faster.nvim",
  {
    "folke/lazydev.nvim",
    ft = "lua",
    dependencies = {
      "bilal2453/luvit-meta",
    },
    opts = {
      library = {
        "lazy.nvim",
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && yarn install",
    ft = "markdown",
  },
  {
    "jalvesaq/nvim-r",
    ft = "r",
    init = function()
      vim.g.R_assign = 2
    end,
  },
  {
    "joosepalviste/nvim-ts-context-commentstring",
    event = "VeryLazy",
    config = function()
      require("ts_context_commentstring").setup({ enable_autocmd = false })

      local original_get_option = vim.filetype.get_option
      --- @diagnostic disable-next-line: duplicate-set-field
      vim.filetype.get_option = function(filetype, option)
        if option == "commentstring" then
          return require("ts_context_commentstring.internal").calculate_commentstring()
        end
        return original_get_option(filetype, option)
      end
    end,
  },
  {
    "lervag/vimtex",
    init = function()
      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_quickfix_mode = 0
    end,
  },
}
