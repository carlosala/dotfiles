set title
set number
set relativenumber
set numberwidth=1
set mouse=a
set clipboard=unnamedplus
set showmatch
set expandtab
set tabstop=2
set shiftwidth=2
set noshowmode
set ignorecase

let g:python3_host_prog = '/usr/bin/python3'

so ~/.config/nvim/plugin-config.vim
so ~/.config/nvim/plugins.vim
so ~/.config/nvim/maps.vim

let g:gruvbox_contrast_dark = 'soft'
colorscheme gruvbox
