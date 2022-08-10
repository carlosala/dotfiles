vim.cmd([[
  call plug#begin()

  " completion
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }
  Plug 'sirver/ultisnips'

  " formatting
  Plug 'editorconfig/editorconfig-vim'
  Plug 'rhysd/vim-clang-format'

  " navigation
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'christoomey/vim-tmux-navigator'

  " syntax
  Plug 'nvim-treesitter/nvim-treesitter', { 'do':  ':TSUpdate' }
  Plug 'neoclide/jsonc.vim'
  Plug 'fladson/vim-kitty'
  Plug 'jxnblk/vim-mdx-js'

  " typing
  Plug 'numtostr/comment.nvim'
  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'windwp/nvim-autopairs'
  Plug 'kylechui/nvim-surround'
  Plug 'windwp/nvim-ts-autotag'

  " visual
  Plug 'sainnhe/gruvbox-material'
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'kyazdani42/nvim-web-devicons'

  call plug#end()
]])
