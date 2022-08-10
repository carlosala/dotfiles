-- coc.nvim
vim.opt.writebackup = false

vim.g.coc_filetype_map = { ["yaml.docker-compose"] = "yaml" }
vim.g.coc_global_extensions = {
  "coc-clangd",
  "coc-css",
  "coc-deno",
  "coc-eslint",
  "coc-html",
  "coc-json",
  "coc-prettier",
  "coc-pyright",
  "coc-rust-analyzer",
  "coc-sumneko-lua",
  "coc-sh",
  "coc-texlab",
  "coc-tsserver",
  "coc-vimlsp",
  "coc-yaml",
}

-- ultisnips
vim.g.UltiSnipsSnippetDirectories = { vim.fn.stdpath("config") .. "/ultisnips" }
vim.g.UltiSnipsExpandTrigger = "<M-l>"
vim.g.UltiSnipsJumpForwardTrigger = "<M-l>"
vim.g.UltiSnipsJumpBackwardTrigger = "<M-h>"
