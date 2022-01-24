set title
set number
set relativenumber
set numberwidth=1
set mouse=a
set clipboard=unnamedplus
set shortmess+=A
set expandtab
set tabstop=2
set shiftwidth=2
set noshowmode
set ignorecase
set termguicolors

if empty(glob("$HOME/.local/share/nvim/site/autoload/plug.vim"))
  silent !curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

let g:python3_host_prog = "/usr/bin/python3"
let g:tex_flavor = "latex"

runtime! config/plugin-config/*.vim config/*.vim config/lua/*.lua

colorscheme gruvbox-material
