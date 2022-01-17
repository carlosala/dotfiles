#!/bin/zsh
DIR=${0:h}

cp -r $DIR/alacritty ~/.config
cp -r $DIR/bat ~/.config
cp -r $DIR/git ~/.config
cp -r $DIR/fonts/fonts ~/.local/share
cp -r $DIR/fonts/fontconfig ~/.config
cp -r $DIR/kitty ~/.config
cp -r $DIR/latexmk ~/.config
cp -r $DIR/nvim ~/.config
cp -r $DIR/zathura ~/.config
cp $DIR/zsh/zshrc ~/.zshrc
cp -r $DIR/zsh/custom $ZSH

echo 'Done!'
