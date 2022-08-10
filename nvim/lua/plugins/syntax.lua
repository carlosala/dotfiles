require("nvim-treesitter.configs").setup({
  ensure_installed = "all",
  highlight = { enable = true },
  incremental_selection = { enable = true },
  indent = { enable = true },
  autotag = { enable = true },
})

require("nvim-treesitter.parsers").filetype_to_parsername.json = "jsonc"
