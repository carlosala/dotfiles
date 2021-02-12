let mapleader=' '

nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>h <C-w>s
nmap <Leader>v <C-w>v
nmap <Leader>t :tabe<Space>.<CR>
nmap , 10<C-e>
nmap . 10<C-y>
nmap ; A;<Esc>
nmap <Leader>o :noh<CR>

nmap <Leader>s <Plug>(easymotion-s2)
nmap <Leader>n :NERDTreeFind<CR>
" nmap <Leader>ff :Files<CR>
nmap <Leader>c <Plug>NERDCommenterToggle
vmap <Leader>c <Plug>NERDCommenterToggle

nmap gd <Plug>(coc-definition)
nmap gy <Plug>(coc-type-definition)
nmap gi <Plug>(coc-implementation)
nmap gr <Plug>(coc-references)

autocmd FileType tex nmap <Leader>lp <Plug>(vimtex-compile)
autocmd FileType tex nmap <Leader>lc <Plug>(vimtex-clean-full)

autocmd FileType dart nmap <Leader>fr :CocCommand flutter.run<CR>
autocmd FileType dart nmap <Leader>fs :CocCommand flutter.dev.quit<CR>
