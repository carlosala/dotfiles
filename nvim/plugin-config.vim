" vim-polyglot
let g:polyglot_disabled = ['javascript']

" vim-closetag
let g:closetag_filenames = '*.html,*.js,*.jsx'

" vimtex
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_progname = 'nvr'

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

" ultisnips
let g:UltiSnipsSnippetDirectories = ['~/.config/nvim/ultisnips']
let g:UltiSnipsExpandTrigger = "<M-l>"
let g:UltiSnipsJumpForwardTrigger = "<M-l>"
let g:UltiSnipsJumpBackwardTrigger = "<M-h>"

" coc.nvim
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

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
