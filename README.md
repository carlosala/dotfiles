<h2 align="center">✨ CARLO'S DOTFILES ✨</h2>

### Requirements

- git
- zsh installed and set up
  1. Install zsh (e.g. `apt install zsh`)
  2. Use zsh as default shell (`chsh -s $(where zsh)`)
  3. Install [ohmyzsh](https://ohmyz.sh)
- python3 & pip3
- [neovim](https://neovim.io) (v0.8 minimum, v0.9+ recommended)
  - _Some configuration might not work with v0.8_
- npm / yarn
- cargo
  - To install it, use [rustup](https://rustup.rs)

_As you could have imagined, this are requirements only for `zsh` and `nvim`_

### Usage

1. Clone the repo and submodules:

```sh
git clone git@github.com:carlosala/dotfiles.git
cd dotfiles
git submodule update --init
```

2. The `installer.sh` is useful to install needed packages for Arch Linux. To run it:

```sh
./installer.sh
```

In the most likely case you don't use Arch Linux, install the packages declared in the installer in your system to make
everything work seamlessly.

3. Copy the config you want to your config directory. These are the standard paths:
   - nvim: `~/.config/nvim`
   - zsh: `~/.zshrc` & `~/.oh-my-zsh/custom`
4. You are ready to go!

### Other tools

As you can see, there are many other configuration files. I don't plan to document the requirements for them any time
soon. Even though, feel free to try them!

Thanks for giving my dotfiles a try!
