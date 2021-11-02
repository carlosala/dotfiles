call plug#begin('~/.config/nvim/plugged')

" completion
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'sirver/ultisnips'

" formatting
Plug 'psf/black'
Plug 'prettier/vim-prettier', { 'do': 'yarn install -s' }
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
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

" visual
Plug 'sainnhe/gruvbox-material'
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

call plug#end()
