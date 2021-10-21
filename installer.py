#!/usr/bin/env python3
import os
import subprocess
import utils.strings as strings


def checkPackage(package: str):
    print(strings.checkingPackage(package))
    try:
        subprocess.run([package, "--version"], capture_output=True)
        print("Done!\n")
        return 0
    except:
        print(f"{strings.notInstalled(package)}")
        return 1


def checkZshDefault():
    if os.environ["SHELL"].endswith("zsh") == False:
        print(strings.zshNoDefault)
    return 0


def installPackage(app: str, package: str, command: list[str]):
    i = input(strings.neededPackage(app, package))
    if i != "n" and i != "N":
        print("\n")
        try:
            subprocess.run(command)
            return 1
        except:
            print(strings.notRequiredFailed(i))
            return 0
    else:
        print(strings.notRequiredNotInstalled(package))
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
    installPackage("nvim", "pynvim (pip)", ["pip3", "install", "pynvim"])
    yarnResult = installPackage("nvim", "yarn", ["npm", "install", "-g", "yarn"])
    if yarnResult == 1:
        installPackage(
            "nvim", "neovim (node integration)", ["yarn", "global", "add", "neovim"]
        )
    else:
        installPackage(
            "nvim", "neovim (node integration)", ["npm", "install", "-g", "neovim"]
        )

    print(strings.rustNvimUtilities)
    installPackage("nvim", "bat", ["cargo", "install", "bat"])
    installPackage("nvim", "fd-find", ["cargo", "install", "fd-find"])
    installPackage("nvim", "ripgrep", ["cargo", "install", "ripgrep"])


def main():
    print(strings.welcome)
    checkingBasicRequirements()
    installingPackages()
    print(strings.theEnd)


if __name__ == "__main__":
    main()
