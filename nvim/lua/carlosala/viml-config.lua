-- coc.nvim
vim.g.coc_global_extensions = {
  "coc-clangd",
  "coc-css",
  "coc-deno",
  "coc-eslint",
  "coc-html",
  "coc-json",
  "coc-markdown-preview-enhanced",
  "coc-prettier",
  "coc-pyright",
  "coc-r-lsp",
  "coc-rust-analyzer",
  "coc-sh",
  "coc-sumneko-lua",
  "coc-texlab",
  "coc-tsserver",
  "coc-vimlsp",
  "coc-webview",
  "coc-yaml",
}

-- editorconfig-vim
vim.g.EditorConfig_exclude_patterns = { "fugitive://.*" }

-- nvim-r
vim.g.R_auto_start = 2
vim.g.R_objbr_auto_start = 2

-- ultisnips
vim.g.UltiSnipsSnippetDirectories = { vim.fn.stdpath("config") .. "/ultisnips" }
vim.g.UltiSnipsExpandTrigger = "<M-l>"
vim.g.UltiSnipsJumpForwardTrigger = "<M-l>"
vim.g.UltiSnipsJumpBackwardTrigger = "<M-h>"
