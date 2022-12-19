-- fidget.nvim
require("fidget").setup({ window = { blend = 0 } })

-- gitsigns.nvim
require("gitsigns").setup({
  current_line_blame = true,
  current_line_blame_formatter = "<author>, <author_time:%R> - <summary> (<abbrev_sha>)",
  current_line_blame_opts = { delay = 500 },
})

-- gruvbox-material
vim.g.gruvbox_material_background = "soft"
vim.g.gruvbox_material_diagnostic_text_highlight = 1
vim.g.gruvbox_material_enable_italic = 1
vim.g.gruvbox_material_transparent_background = 1

vim.cmd("colorscheme gruvbox-material")

-- indent-blankline
require("indent_blankline").setup({
  filetype_exclude = {
    "checkhealth",
    "gitcommit",
    "help",
    "lspinfo",
    "man",
    "NvimTree",
    "packer",
  },
  use_treesitter = true,
})

-- lualine.nvim
require("lualine").setup({
  extensions = { "fugitive", "nvim-tree" },
  sections = {
    lualine_x = { "progress" },
    lualine_y = { "filetype" },
  },
})
