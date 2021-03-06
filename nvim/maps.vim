let mapleader=' '

" Basic keymaps
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>h <C-w>s
nmap <Leader>v <C-w>v
nmap <Leader>t :tabe<Space>.<CR>
nmap , 10<C-e>
nmap . 10<C-y>
nmap ; A;<Esc>
nmap <Leader>o :noh<CR>

" coc.nvim
nmap gd <Plug>(coc-definition)
nmap gy <Plug>(coc-type-definition)
nmap gi <Plug>(coc-implementation)
nmap gr <Plug>(coc-references)
inoremap <silent><expr> <C-Space> coc#refresh()
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" nerdtree
nmap <Leader>n :NERDTreeFind<CR>
nmap <Leader>c <Plug>NERDCommenterToggle

" vimtex
nmap <Leader>lc <Plug>(vimtex-compile)

" other
nmap <Leader>s <Plug>(easymotion-s2)
nmap <Leader>f :Files<CR>
