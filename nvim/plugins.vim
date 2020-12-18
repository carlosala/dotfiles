call plug#begin('~/.config/nvim/plugged')

" Visual
Plug 'itchyny/lightline.vim'
Plug 'Yggdroot/indentline'
Plug 'morhetz/gruvbox'
Plug 'shinchu/lightline-gruvbox.vim'

" Syntax
Plug 'sheerun/vim-polyglot'
Plug 'yuezk/vim-js'

" Autocompletion
Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Navigation
Plug 'easymotion/vim-easymotion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Others
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'turbio/bracey.vim', { 'do': 'npm install --prefix server' }

call plug#end()
