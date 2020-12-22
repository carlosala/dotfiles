let mapleader=' '

nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>h <C-w>s
nmap <Leader>v <C-w>v
nmap <Leader>t :tabe<space>.<CR>
nmap , 10<C-e>
nmap . 10<C-y>
nmap ; $a;<Esc>
nmap <Leader>o :noh<CR>

nmap <Leader>s <Plug>(easymotion-s2)
nmap <Leader>n :NERDTreeFind<CR>
nmap <Leader>f :Files<CR>
nmap <Leader>c <Plug>NERDCommenterToggle
vmap <Leader>c <Plug>NERDCommenterToggle

nmap gd <Plug>(coc-definition)
nmap gy <Plug>(coc-type-definition)
nmap gi <Plug>(coc-implementation)
nmap gr <Plug>(coc-references)
