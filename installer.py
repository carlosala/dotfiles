#!/usr/bin/env python3
import os
import subprocess
import sys


def neededPackage(app: str, package: str):
    if len(app):
        return f"{package} is needed for {app}. Do you want to install it now? [Y/n] "
    return (
        f"{package} is not needed, but I use it. Do you want to install it now? [Y/n] "
    )


def checkPackage(package: str):
    print(f"Checking if {package} is installed...")
    try:
        subprocess.run([package, "--version"], capture_output=True, check=True)
        print("Done!\n")
        return 0
    except subprocess.CalledProcessError:
        print(f"{package} is not installed!")
        return 1


def checkZshDefault():
    if not os.environ["SHELL"].endswith("zsh"):
        print(
            "Zsh is not your default shell. This dotfiles are intended to be used with zsh, if you want to use it, please execute $chsh -s /bin/zsh."
        )
        return 1
    return 0


def installPackage(app: str, package: str, command: list[str]):
    i = ""
    if "-y" not in sys.argv and "--yes" not in sys.argv:
        i = input(neededPackage(app, package))
    if i not in ("n", "N"):
        print("\n")
        try:
            subprocess.run(command, check=True)
            return True
        except subprocess.CalledProcessError:
            print(f"{package} installation failed. Skipping...")
            return False
    else:
        print(f"{package} installation skipped.")
        return False


def checkingBasicRequirements():
    notInstalled = 0
    notInstalled += checkPackage("git")
    notInstalled += checkPackage("zsh")
    notInstalled += checkPackage("pip3")
    notInstalled += checkPackage("nvim")
    notInstalled += checkPackage("yarn")
    notInstalled += checkPackage("cargo")
    notInstalled += checkZshDefault()
    if "-a" in sys.argv or "--arch" in sys.argv:
        notInstalled += checkPackage("paru")
    if notInstalled:
        print("Please, install it/them!")
        sys.exit(1)


def installingPackages():
    installPackage(
        "nvim", "neovim (node integration)", ["yarn", "global", "add", "neovim"]
    )
    if "-a" in sys.argv or "--arch" in sys.argv:
        installPackage(
            "git", "diff-so-fancy", ["paru", "-S", "--needed", "diff-so-fancy"]
        )
        installPackage("git", "delta", ["paru", "-S", "--needed", "git-delta"])
        installPackage(
            "kitty",
            "cascadia code",
            ["paru", "-S", "--needed", "otf-cascadia-code"],
        )
        installPackage(
            "kitty",
            "nerd fonts symbols",
            ["paru", "-S", "--needed", "ttf-nerd-fonts-symbols-2048-em"],
        )
        installPackage("nvim", "fd", ["paru", "-S", "--needed", "fd"])
        installPackage(
            "nvim",
            "pynvim",
            ["paru", "-S", "--needed", "python-pynvim"],
        )
        installPackage(
            "nvim",
            "ripgrep",
            ["paru", "-S", "--needed", "ripgrep"],
        )
        installPackage(
            "nvim",
            "wayland clipboard",
            ["paru", "-S", "--needed", "wl-clipboard"],
        )
        installPackage("zsh", "bat", ["paru", "-S", "--needed", "bat"])
        installPackage("zsh", "exa", ["paru", "-S", "--needed", "exa"])
        installPackage("zsh", "nawk", ["paru", "-S", "--needed", "nawk"])
        installPackage("", "dust", ["paru", "-S", "--needed", "dust"])
        installPackage(
            "",
            "hyperfine",
            ["paru", "-S", "--needed", "hyperfine"],
        )
        installPackage("", "kitty", ["paru", "-S", "--needed", "kitty"])
        installPackage("", "lazydocker", ["paru", "-S", "--needed", "lazydocker-bin"])
        installPackage("", "lazygit", ["paru", "-S", "--needed", "lazygit"])
        installPackage(
            "",
            "zathura",
            [
                "paru",
                "-S",
                "--needed",
                "zathura",
                "zathura-pdf-mupdf",
            ],
        )
    else:
        installPackage("nvim", "bat", ["cargo", "install", "bat"])
        installPackage("nvim", "fd", ["cargo", "install", "fd-find"])
        installPackage("nvim", "ripgrep", ["cargo", "install", "ripgrep"])
        installPackage("nvim", "pynvim (pip)", ["pip3", "install", "--user", "pynvim"])
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
