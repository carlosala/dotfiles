return {
  {
    "sbdchd/neoformat",
    cmd = "Neoformat",
  },
  {
    "jalvesaq/nvim-r",
    ft = "r",
  },
  {
    "f3fora/nvim-texlabconfig",
    build = "go build -o ~/.local/bin/nvim-texlabconfig",
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
