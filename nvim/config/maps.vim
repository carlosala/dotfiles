let mapleader=" "

" basic keymaps
nmap <silent> <Leader>w :w<CR>
nmap <silent> <Leader>W :noa w<CR>
nmap <silent> <Leader>q :q<CR>
nnoremap <silent> x "_x
nmap Q <Nop>
nmap <Leader>s <C-w>v
nmap <Leader>v <C-w>s
nmap <silent> <Leader>t :tabe<Space>.<CR>
nmap <M-j> 10<C-e>
nmap <M-k> 10<C-y>
nmap <Leader>; A;<Esc>
nmap <silent> <Leader>o :noh<CR>

" coc.nvim
nmap gd <Plug>(coc-definition)
nmap gy <Plug>(coc-type-definition)
nmap gi <Plug>(coc-implementation)
nmap gr <Plug>(coc-references)
inoremap <silent><expr> <C-Space> coc#refresh()
inoremap <silent><expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>" 
inoremap <silent><expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>"
nmap <Leader>rn <Plug>(coc-rename)
nmap <silent> <Leader>rf :CocCommand workspace.renameCurrentFile<CR>
nmap <silent> <Leader>lc :CocCommand latex.Build<CR>
nmap <silent> <Leader>lf :CocCommand latex.ForwardSearch<CR>

" other
nmap <silent> <Leader>n :NvimTreeFindFile<CR>
nmap <Leader>f :FilesCustom<CR>
nmap <Leader>g :RgCustom<CR>
nmap <Leader>h :Helptags<CR>
inoremap <expr> <M-CR> v:lua.Npairs.autopairs_cr()
