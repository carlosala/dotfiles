return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = { "windwp/nvim-ts-autotag" },
    priority = 90,
    config = function()
      require("nvim-treesitter.configs").setup({
        autotag = { enable = true },
        ensure_installed = "all",
        highlight = { enable = true },
        incremental_selection = { enable = true },
        indent = { enable = true },
      })
      vim.treesitter.language.register("jsonc", "json")
    end,
  },
}
