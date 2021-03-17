call plug#begin('~/.config/nvim/plugged')

" Completion
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'sirver/ultisnips'
Plug 'lervag/vimtex', { 'for': 'tex' }

" Navigation
Plug 'easymotion/vim-easymotion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Syntax
Plug 'sheerun/vim-polyglot'
Plug 'yuezk/vim-js', { 'for': 'javascript' }

" Typing
Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'preservim/nerdcommenter'

" Visual
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

call plug#end()
