require'lualine'.setup {
  sections = {
    lualine_x = {'filetype'},
  },
  extensions = {
    'fzf',
    'nvim-tree'
  }
}
