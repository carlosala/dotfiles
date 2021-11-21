" black
autocmd BufWritePre *.py execute ':Black'

" vim-clang-format
let g:clang_format#auto_filetypes = ["c", "cpp"]
let g:clang_format#auto_format = 1
