let mapleader=' '

" basic keymaps
nmap <Leader>w :w<CR>
nmap <Leader>W :noa w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>h <C-w>s
nmap <Leader>v <C-w>v
nmap <Leader>t :tabe<Space>.<CR>
nmap <M-j> 10<C-e>
nmap <M-k> 10<C-y>
nmap <Leader>; A;<Esc>
nmap <Leader>o :noh<CR>

" coc.nvim
nmap gd <Plug>(coc-definition)
nmap gy <Plug>(coc-type-definition)
nmap gi <Plug>(coc-implementation)
nmap gr <Plug>(coc-references)
nmap <Leader>rn <Plug>(coc-rename)
nmap <Leader>rf :CocCommand workspace.renameCurrentFile<CR>
inoremap <silent><expr> <C-Space> coc#refresh()
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" other
nmap <Leader>n :NERDTreeFind<CR>
nmap <Leader>c <Plug>NERDCommenterToggle
nmap <Leader>s <Plug>(easymotion-s2)
nmap <Leader>f :FilesCustom<CR>
nmap <Leader>g :RgCustom<CR>
nmap <Leader>lc :CocCommand latex.Build<CR>
