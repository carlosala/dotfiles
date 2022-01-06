#!/usr/bin/env python3
import os
import sys
import subprocess


def neededPackage(app: str, package: str):
    if app != "":
        return f"{package} is needed for {app}. Do you want to install it now? [Y/n] "
    return (
        f"{package} is not needed, but I use it. Do you want to install it now? [Y/n] "
    )


def checkPackage(package: str):
    print(f"Checking if {package} is installed...")
    try:
        subprocess.run([package, "--version"], capture_output=True)
        print("Done!\n")
        return 0
    except:
        print(f"{package} is not installed!")
        return 1


def checkZshDefault():
    if os.environ["SHELL"].endswith("zsh") == False:
        print(
            "Zsh is not your default shell. This dotfiles are intended to be used with zsh, if you want to use it, please execute $chsh -s /bin/zsh."
        )
    return 0


def installPackage(app: str, package: str, command: list[str]):
    i = input(neededPackage(app, package))
    if i != "n" and i != "N":
        print("\n")
        try:
            subprocess.run(command)
            return True
        except:
            print(f"{package} installation failed. Skipping...")
            return False
    else:
        print(f"{package} installation skipped.")
        return False


def checkingBasicRequirements():
    notInstalled = 0
    notInstalled += checkPackage("git")
    notInstalled += checkPackage("zsh")
    notInstalled += checkZshDefault()
    notInstalled += checkPackage("pip3")
    notInstalled += checkPackage("nvim")
    notInstalled += checkPackage("yarn")
    notInstalled += checkPackage("cargo")
    if notInstalled > 0:
        print("Please, install it/them!")
        quit(1)


def installingPackages():
    installPackage("nvim", "pynvim (pip)", ["pip3", "install", "--user", "pynvim"])
    installPackage(
        "nvim", "neovim-remote (pip)", ["pip3", "install", "--user", "neovim-remote"]
    )
    "nvim", "neovim (node integration)", ["yarn", "global", "add", "neovim"]
    if "arch" in sys.argv:
        installPackage("nvim", "bat", ["sudo", "pacman", "-S", "--noconfirm", "bat"])
        installPackage("nvim", "fd", ["sudo", "pacman", "-S", "--noconfirm", "fd"])
        installPackage(
            "nvim", "ripgrep", ["sudo", "pacman", "-S", "--noconfirm", "ripgrep"]
        )
        installPackage(
            "nvim", "xclip", ["sudo", "pacman", "-S", "--noconfirm", "xclip"]
        )
        installPackage("zsh", "exa", ["sudo", "pacman", "-S", "--noconfirm", "exa"])
        installPackage("", "dust", ["sudo", "pacman", "-S", "--noconfirm", "dust"])
        installPackage(
            "", "hyperfine", ["sudo", "pacman", "-S", "--noconfirm", "hyperfine"]
        )
    else:
        installPackage("nvim", "bat", ["cargo", "install", "bat"])
        installPackage("nvim", "fd", ["cargo", "install", "fd-find"])
        installPackage("nvim", "ripgrep", ["cargo", "install", "ripgrep"])
        installPackage("zsh", "exa", ["cargo", "install", "exa"])
        installPackage("", "dust", ["cargo", "install", "du-dust"])
        installPackage("", "hyperfine", ["cargo", "install", "hyperfine"])


def main():
    print(
        "Hi! You are in Carlo's dotfiles installer :)\nYou are going to be asked for some things so, let's do it!\n"
    )
    checkingBasicRequirements()
    installingPackages()
    print(
        "\nYou are ready to go!\nHave a nice day, and thank you for using my dotfiles ;)"
    )


if __name__ == "__main__":
    main()
