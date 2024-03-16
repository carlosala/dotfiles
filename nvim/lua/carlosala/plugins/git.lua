---@type LazySpec
return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile", "VeryLazy" },
    opts = {
      current_line_blame = true,
      current_line_blame_formatter = "<author>, <author_time:%R> - <summary> (<abbrev_sha>)",
      current_line_blame_opts = { delay = 500 },
    },
  },
  {
    "tpope/vim-fugitive",
    event = "VeryLazy",
  },
}
