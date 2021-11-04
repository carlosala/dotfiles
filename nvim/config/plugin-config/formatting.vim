" black
autocmd BufWritePre *.py execute ':Black'

" vim-clang-format
autocmd FileType c,cpp ClangFormatAutoEnable

" vim-prettier
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
let g:prettier#quickfix_enabled = 0
