return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    cmd = "TSUpdate",
    event = { "BufReadPre", "BufNewFile", "VeryLazy" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter-context",
      "windwp/nvim-ts-autotag",
    },
    config = function()
      require("nvim-treesitter.configs").setup({
        autotag = { enable = true },
        ensure_installed = "all",
        highlight = { enable = true },
        incremental_selection = { enable = true },
        indent = { enable = true },
      })
      vim.treesitter.language.register("jsonc", "json")
      require("treesitter-context").setup({ max_lines = 10, multiline_threshold = 4 })

      vim.opt.foldmethod = "expr"
      vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
      vim.opt.foldenable = false
    end,
  },
}
