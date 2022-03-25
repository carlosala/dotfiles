require("lualine").setup({
  sections = {
    lualine_x = { { "g:coc_status" }, "progress" },
    lualine_y = { "filetype" },
  },
  extensions = {
    "fzf",
    "nvim-tree",
  },
})

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
