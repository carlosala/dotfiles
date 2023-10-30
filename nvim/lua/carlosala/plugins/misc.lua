return {
  {
    "jalvesaq/nvim-r",
    ft = "r",
    init = function()
      vim.g.R_assign = 2
    end,
  },
  {
    "f3fora/nvim-texlabconfig",
    build = "go build",
    ft = "tex",
    config = true,
  },
}
