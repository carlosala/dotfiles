call plug#begin('~/.config/nvim/plugged')

" completion
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'sirver/ultisnips'
Plug 'lervag/vimtex', { 'for': 'tex' }

" navigation
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'easymotion/vim-easymotion'
Plug 'christoomey/vim-tmux-navigator'

" syntax
Plug 'yuezk/vim-js', { 'for': 'javascript' }
Plug 'sheerun/vim-polyglot'

" typing
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'

" visual
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

call plug#end()
