#!/bin/zsh
DIR=${0:h}

cp -r $DIR/alacritty ~/.config
cp -r $DIR/bat ~/.config
cp -r $DIR/git ~/.config
cp -r $DIR/kitty ~/.config
cp $DIR/latexindent/indentconfig.yaml ~/.indentconfig.yaml
cp $DIR/latexindent/latexindent.yaml ~/.latexindent.yaml
cp -r $DIR/latexmk ~/.config
cp -r $DIR/lazygit ~/.config
cp -r $DIR/nvim ~/.config
cp $DIR/pylint/pylintrc ~/.pylintrc
cp -r $DIR/vale/vale.ini ~/.vale.ini
cp -r $DIR/zathura ~/.config
cp $DIR/zsh/zshenv ~/.zshenv
cp $DIR/zsh/zshrc ~/.zshrc
cp -r $DIR/zsh/custom $ZSH

echo 'Done!'
