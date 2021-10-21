" black
autocmd BufWritePre *.py execute ':Black'

" vim-clang-format
autocmd FileType c,cpp ClangFormatAutoEnable
