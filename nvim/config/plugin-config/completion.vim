" coc.nvim
set hidden
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=number
let g:coc_global_extensions = ['coc-clangd', 'coc-css', 'coc-emoji',
  \ 'coc-eslint', 'coc-html', 'coc-json', 'coc-prettier', 'coc-pyright',
  \ 'coc-rust-analyzer', 'coc-sh', 'coc-texlab', 'coc-tsserver', 'coc-vimlsp',
  \ 'coc-yaml']
let g:coc_filetype_map = { 'yaml.docker-compose': 'yaml' }

" ultisnips
let g:UltiSnipsSnippetDirectories = ['config/ultisnips']
let g:UltiSnipsExpandTrigger = "<M-l>"
let g:UltiSnipsJumpForwardTrigger = "<M-l>"
let g:UltiSnipsJumpBackwardTrigger = "<M-h>"
