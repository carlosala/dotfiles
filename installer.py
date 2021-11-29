#!/usr/bin/env python3
import os
import subprocess


def checkingPackage(package: str):
    return f"Checking if {package} is installed..."


def notInstalled(package: str):
    return f"{package} is not installed!"


def neededPackage(app: str, package: str):
    return f"{package} is needed for {app}. Do you want to install it now? [Y/n] "


def notRequiredNotInstalled(package: str):
    return f"{package} installation skipped."


def notRequiredFailed(package: str):
    return f"{package} installation failed. Skipping..."


welcome = "Hi! You are in Carlo's dotfiles installer :)\nYou are going to be asked for some things so, let's do it!\n"

zshNoDefault = "Zsh is not your default shell. This dotfiles are intended to be used with zsh. If you want to use it, please execute $chsh -s /bin/zsh."

rustNvimUtilities = "You will need some rust utilities necessary for nvim usage. Them are bat, fd-find and ripgrep. You will be asked for each one."

theEnd = (
    "\nYou are ready to go!\nHave a nice day, and thank you for using my dotfiles ;)"
)


def checkPackage(package: str):
    print(checkingPackage(package))
    try:
        subprocess.run([package, "--version"], capture_output=True)
        print("Done!\n")
        return 0
    except:
        print(f"{notInstalled(package)}")
        return 1


def checkZshDefault():
    if os.environ["SHELL"].endswith("zsh") == False:
        print(zshNoDefault)
    return 0


def installPackage(app: str, package: str, command: list[str]):
    i = input(neededPackage(app, package))
    if i != "n" and i != "N":
        print("\n")
        try:
            subprocess.run(command)
            return 1
        except:
            print(notRequiredFailed(i))
            return 0
    else:
        print(notRequiredNotInstalled(package))
        return 0


def checkingBasicRequirements():
    notInstalled = 0
    notInstalled += checkPackage("git")
    notInstalled += checkPackage("zsh")
    notInstalled += checkZshDefault()
    notInstalled += checkPackage("pip3")
    notInstalled += checkPackage("nvim")
    notInstalled += checkPackage("npm")
    notInstalled += checkPackage("cargo")
    if notInstalled > 0:
        print("Please, install it/them!")
        quit(1)


def installingPackages():
    installPackage("nvim", "pynvim (pip)", ["pip3", "install", "--user", "pynvim"])
    installPackage(
        "nvim", "neovim-remote (pip)", ["pip3", "install", "--user", "neovim-remote"]
    )
    yarnResult = installPackage("nvim", "yarn", ["npm", "install", "-g", "yarn"])
    if yarnResult == 1:
        installPackage(
            "nvim", "neovim (node integration)", ["yarn", "global", "add", "neovim"]
        )
    else:
        installPackage(
            "nvim", "neovim (node integration)", ["npm", "install", "-g", "neovim"]
        )

    print(rustNvimUtilities)
    installPackage("nvim", "bat", ["cargo", "install", "bat"])
    installPackage("nvim", "fd-find", ["cargo", "install", "fd-find"])
    installPackage("nvim", "ripgrep", ["cargo", "install", "ripgrep"])
    installPackage("zsh", "exa", ["cargo", "install", "exa"])


def main():
    print(welcome)
    checkingBasicRequirements()
    installingPackages()
    print(theEnd)


if __name__ == "__main__":
    main()
