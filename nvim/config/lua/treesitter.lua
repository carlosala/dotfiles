require("nvim-treesitter.configs").setup({
  ensure_installed = "all",
  highlight = { enable = true },
  incremental_selection = { enable = true },
  indent = { enable = true },
  autotag = { enable = true },
})

require("nvim-treesitter.parsers").get_parser_configs().jsonc.used_by = "json"
