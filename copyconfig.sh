DIR=$(dirname "$0")

cp -r $DIR/alacritty/ ~/.config/
cp $DIR/git/.gitconfig ~/
cp -r $DIR/fonts/ ~/.local/share/
cp -r $DIR/kitty/ ~/.config/
cp -r $DIR/nvim/ ~/.config/
cp -r $DIR/zathura/ ~/.config/
cp $DIR/zsh/.zshrc ~/
cp $DIR/zsh/nt-modif.zsh-theme ~/.oh-my-zsh/custom/themes/

echo 'Done!'
