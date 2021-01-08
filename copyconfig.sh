#!/bin/bash

cp alacritty/alacritty.yml ~/.config/alacritty/

cp git/.gitconfig ~/

cp neofetch/config.conf ~/.config/neofetch/

cp nvim/init.vim nvim/maps.vim ~/.config/nvim/
cp nvim/plugins.vim nvim/plugin-config.vim ~/.config/nvim/
cp -r nvim/ultisnips/ ~/.config/nvim/

cp zsh/.zshrc ~/
cp zsh/nt-modif.zsh-theme zsh/nanotech-24h.zsh-theme ~/.oh-my-zsh/custom/themes/

echo 'Copiado!'
