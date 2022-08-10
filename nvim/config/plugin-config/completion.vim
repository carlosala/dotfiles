" coc.nvim
set hidden
set nowritebackup
set updatetime=300
set shortmess+=c
set signcolumn=number
let g:coc_filetype_map = { "yaml.docker-compose": "yaml" }
let g:coc_global_extensions = ["coc-clangd", "coc-css", "coc-deno",
  \ "coc-eslint", "coc-html", "coc-json", "coc-prettier", "coc-pyright",
  \ "coc-rust-analyzer", "coc-sumneko-lua", "coc-sh", "coc-texlab",
  \ "coc-tsserver", "coc-vimlsp", "coc-yaml"]

" ultisnips
let g:UltiSnipsSnippetDirectories = [stdpath('config')."/ultisnips"]
let g:UltiSnipsExpandTrigger = "<M-l>"
let g:UltiSnipsJumpForwardTrigger = "<M-l>"
let g:UltiSnipsJumpBackwardTrigger = "<M-h>"
