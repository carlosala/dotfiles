require("nvim-treesitter.configs").setup({
  ensure_installed = "all",
  highlight = { enable = true },
  incremental_selection = { enable = true },
  indent = { enable = true },
})
vim.treesitter.language.register("jsonc", "json")
