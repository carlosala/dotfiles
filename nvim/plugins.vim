call plug#begin('~/.config/nvim/plugged')

" completion
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'sirver/ultisnips'
Plug 'lervag/vimtex', { 'for': 'tex' }

" navigation
Plug 'easymotion/vim-easymotion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" syntax
Plug 'sheerun/vim-polyglot'
Plug 'yuezk/vim-js', { 'for': 'javascript' }

" typing
Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'preservim/nerdcommenter'

" visual
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

call plug#end()
