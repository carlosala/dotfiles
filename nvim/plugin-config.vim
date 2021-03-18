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
let g:NERDTreeShowHidden = 1
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

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

" vim-devicons & vim-nerdtree-syntax-highlight
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsDefaultFileSymbolColor = '689FB6'
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['html'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['css'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.gitignore'] = ''

" vim-nerdtree-syntax-highlight
let g:NERDTreeHighlightFolders = 1
let g:NERDTreeHighlightFoldersFullName = 1
let g:NERDTreeExactMatchHighlightColor = {}
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = 'F54D27'
let g:NERDTreeExactMatchHighlightColor['LICENSE'] = 'F09F17'

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
      \     'cocstatus': 'coc#status',
      \     'filetype': 'MyFiletype'
      \ },
      \ 'colorscheme': 'gruvbox',
      \ 'subseparator': {
      \     'left': '',
      \     'right': ''
      \ }
      \}

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction
