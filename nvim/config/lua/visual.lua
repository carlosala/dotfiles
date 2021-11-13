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
