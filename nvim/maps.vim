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

" nerdtree
nmap <Leader>n :NERDTreeFind<CR>
nmap <Leader>c <Plug>NERDCommenterToggle

" vimtex
nmap <Leader>lc <Plug>(vimtex-compile)

" other
nmap <Leader>s <Plug>(easymotion-s2)
" nmap <Leader>f :Files<CR>
