#!/bin/zsh

trap "exit" INT

function check_req {
  command -v "$@" >/dev/null 2>&1
}

typeset -a needed_req=(
  curl
  git
  go
  nodejs-lts-jod
  npm
  python-pip
  rustup
  yarn
  zsh
)

typeset -a shell_req=(
  bat
  dust
  eza
  fd
  fzf
  git-delta
  hyperfine
  jq
  kitty
  lazydocker-bin
  lazygit
  nawk
  otf-cascadia-code
  python-pip
  ripgrep
  ttf-nerd-fonts-symbols
  xclip
  zathura
  zathura-pdf-mupdf
)

typeset -a nvim_req=(
  bat
  bibclean
  fd
  fswatch
  lua51
  luarocks
  neovim
  python-pynvim
  ripgrep
  tree-sitter
  tree-sitter-cli
  xclip
  xdotool
)

local pacman=yay

# needed stuff
if ! check_req zsh $pacman; then
  echo "Make sure you have zsh and $pacman installed!"
  return 1
fi

# change to zsh default shell
if [[ ! $SHELL =~ zsh$ ]]; then
  echo "Changing default shell"
  chsh -s /bin/zsh
fi

# setup yay and upgrade all packages
$pacman -Y --gendb
$pacman -Syyuu

# important stuff
$pacman -S --noconfirm --needed "${needed_req[@]}"

# shell requirements
$pacman -S --noconfirm --needed "${shell_req[@]}"

# neovim requirements
$pacman -S --noconfirm --needed "${nvim_req[@]}"
yarn global add neovim

# install ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc

echo "Installation completed!"
echo "You may want to reboot your computer!"
