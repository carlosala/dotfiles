---@type LazySpec
return {
  "lunarvim/bigfile.nvim",
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
    "lervag/vimtex",
    init = function()
      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_quickfix_mode = 0
    end,
  },
}
