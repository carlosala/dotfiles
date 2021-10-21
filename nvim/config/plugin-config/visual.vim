" gruvbox
let g:gruvbox_contrast_dark = 'soft'

" lightline.vim
let g:lightline = {
  \ 'active': {
  \   'left': [['mode', 'paste'], [], ['relativepath', 'modified']],
  \   'right': [['cocstatus'], ['filetype', 'percent', 'lineinfo'], ['readonly']]
  \ },
  \ 'inactive': {
  \   'left': [['relativepath']],
  \   'right': []
  \ },
  \ 'component_function': {
  \   'cocstatus': 'coc#status',
  \   'filetype': 'MyFiletype'
  \ },
  \ 'colorscheme': 'gruvbox',
  \ 'subseparator': {
  \   'left': '',
  \   'right': ''
  \ }
  \ }

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

" vim-devicons
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
