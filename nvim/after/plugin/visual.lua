-- gitsigns.nvim
require("gitsigns").setup()

-- indent-blankline
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

-- lualine.nvim
require("lualine").setup({
  extensions = { "fugitive", "nvim-tree" },
  sections = {
    lualine_x = { "lsp_progress", "progress" },
    lualine_y = { "filetype" },
  },
})

-- gruvbox-material
vim.cmd("colorscheme gruvbox-material")
