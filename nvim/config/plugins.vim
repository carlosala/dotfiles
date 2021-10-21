call plug#begin('~/.config/nvim/plugged')

" completion
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'sirver/ultisnips'

" formatting
Plug 'psf/black'
Plug 'rhysd/vim-clang-format'

" navigation
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'christoomey/vim-tmux-navigator'

" syntax
Plug 'neoclide/jsonc.vim'
Plug 'sheerun/vim-polyglot'
Plug 'lervag/vimtex'

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
