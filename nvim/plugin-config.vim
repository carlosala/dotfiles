" vim-polyglot
let g:polyglot_disabled = ['javascript']

" indentLine
autocmd FileType tex let g:indentLine_enabled = 0

" vim-closetag
let g:closetag_filenames = '*.html,*.js,*.jsx'

" nerdtree
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeAutoDeleteBuffer = 1

" nerdcommenter
let g:NERDCreateDefaultMappings = 0 
let g:NERDSpaceDelims = 1
let g:NERDToggleCheckAllLines = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1

" coc.nvim
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" lightline.vim
let g:lightline = {
      \ 'active': {
      \     'left': [['mode', 'paste'], [], ['relativepath', 'modified']],
      \     'right': [['cocstatus'], ['filetype', 'percent', 'lineinfo'], ['readonly']]
      \ },
      \ 'inactive': {
      \     'left': [['relativepath']],
      \     'right': []
      \ },
      \ 'component_function': {
      \     'cocstatus': 'coc#status'
      \ },
      \ 'colorscheme': 'gruvbox',
      \ 'subseparator': {
      \     'left': '',
      \     'right': ''
      \ }
      \}
