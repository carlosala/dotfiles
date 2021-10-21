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

theEnd = "\nYou are ready to go! Now you can use some of my config without (theorically) any issue. Just in the case (really, just in that case) you are SO enthusiastic, you can use the copyconfig.sh script. But it's going to DESTROY every single config in you computer that it's in conflict with mine! I encourage you not doing that, but it's your choice!\nHave a nice day, and thank you for using my dotfiles ;)"
