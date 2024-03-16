---@type LazySpec
return {
  {
    "numtostr/comment.nvim",
    event = "VeryLazy",
    opts = { ignore = "^$" },
  },
  {
    "windwp/nvim-autopairs",
    event = "VeryLazy",
    config = true,
  },
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = true,
  },
  {
    "tpope/vim-sleuth",
    event = { "BufReadPre", "BufNewFile", "VeryLazy" },
  },
}
