#!/bin/zsh

trap "exit" INT

function check_req {
  command -v "$@" >/dev/null 2>&1
}

typeset -a needed_req=(
  curl
  git
  go
  nodejs-lts-iron
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

# needed stuff
if ! check_req zsh paru; then
  echo "Make sure you have zsh and paru installed!"
  return 1
fi

# change to zsh default shell
if [[ ! $SHELL =~ zsh$ ]]; then
  echo "Changing default shell"
  chsh -s /bin/zsh
fi

# setup paru and upgrade all packages
paru --gendb
paru -Syyuu

# important stuff
paru -S --noconfirm --needed "${needed_req[@]}"

# shell requirements
paru -S --noconfirm --needed "${shell_req[@]}"

# neovim requirements
paru -S --noconfirm --needed "${nvim_req[@]}"
yarn global add neovim

# install ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc

echo "Installation completed!"
echo "You may want to reboot your computer!"
