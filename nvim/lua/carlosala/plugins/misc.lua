return {
  {
    "sbdchd/neoformat",
    cmd = "Neoformat",
    init = function()
      vim.g.latexindent_opt = "-m -rv"
    end,
  },
  {
    "jalvesaq/nvim-r",
    ft = "r",
    init = function()
      vim.g.R_auto_start = 2
    end,
  },
  {
    "f3fora/nvim-texlabconfig",
    build = "go build",
    ft = "tex",
    config = true,
  },
  {
    "toppair/peek.nvim",
    build = "deno task --quiet build:fast",
    cmd = { "PeekOpen", "PeekClose" },
    opts = { app = "chromium" },
  },
}
