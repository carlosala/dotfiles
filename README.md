<h2 align="center">✨ CARLO'S DOTFILES ✨</h2>

### Requirements

- git
- zsh installed and set up
  1. Install zsh (e.g. `apt install zsh`)
  2. Use zsh as default shell (`chsh -s $(where zsh)`)
  3. Install [ohmyzsh](https://ohmyz.sh)
- python3 & pip3
- neovim
- npm
- cargo
  - To install it, use [rustup](https://rustup.rs)

_As you could have imagined, this are requirements only for `zsh` and `nvim`_

### Usage

1. Clone the repo:

```sh
git clone git@github.com:carlosala/dotfiles.git
```

2. Run installer script to check the requirements and install some small useful
   packages (just if you want, you are going to be asked for):

```sh
./installer.py
```

3. Copy the config you are interested to to your config directory. Config paths:

   - nvim: `~/.config/nvim`
   - zsh: `~/.zshrc`

4. You are ready to go!

### Other config

As you can see, there are many different tools that I use. I have not adapted
the README and installer to them, I may do it (or not). Anyway, you can try
them too.

Thanks for giving my dotfiles a try!
