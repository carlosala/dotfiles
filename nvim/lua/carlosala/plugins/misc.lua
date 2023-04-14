return {
  "sbdchd/neoformat",
  "jalvesaq/nvim-r",
  {
    "f3fora/nvim-texlabconfig",
    build = "go build -o ~/.local/bin/nvim-texlabconfig",
    config = true,
  },
  {
    "toppair/peek.nvim",
    build = "deno task --quiet build:fast",
    opts = { app = "chromium" },
  },
}
