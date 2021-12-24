### ADDING PATHS
export PATH="$PATH:/home/carlo/.bin"
export PATH="$PATH:/home/carlo/.cargo/bin"
export PATH="$PATH:/home/carlo/.deno/bin"
export PATH="$PATH:/home/carlo/.local/bin"
export PATH="$PATH:/home/carlo/.node/bin"
export PATH="$PATH:/home/carlo/.yarn/bin"

### ANDROID STUDIO SETUP
export ANDROID_HOME="/home/carlo/.android/sdk"
export ANDROID_SDK_ROOT=$ANDROID_HOME
export PATH="$PATH:$ANDROID_HOME/cmdline-tools/latest/bin"
# export PATH="$PATH:$ANDROID_HOME/emulator"
# export PATH="$PATH:$ANDROID_HOME/platform-tools"
# export PATH="$PATH:$ANDROID_HOME/tools"
# export PATH="$PATH:$ANDROID_HOME/tools/bin"
# export JAVA_HOME="/home/carlo/.android-studio/jre"

### SOME VARIABLES
export XZ_DEFAULTS="-T0"
export EDITOR="nvim"

### OMZ
export ZSH="/home/carlo/.oh-my-zsh"
ZSH_THEME_GIT_PROMPT_CACHE="true"
ZSH_DISABLE_COMPFIX="true"
ZSH_THEME="nt-modif"
plugins=( deno gh git git-prompt rbw yarn z )
source $ZSH/oh-my-zsh.sh

### CUSTOM FUNCTIONS
function gccom {
  if [[ $# -eq 0 ]]; then
    for i in $(fd -t f -d 2 -e c -HI); do
      gcc -o ${i/.c} -g -Wall $i -lm
      if [[ $? -eq 0 ]]; then
        echo "$i compiled! :)"
      fi
    done
  else
    for j in $@; do
      if [[ ${j: -2} != '.c' ]] || [[ ! -f $j ]]; then
        echo "$j is not a C file! :("
      else
        gcc -o ${j/.c} -g -Wall $j -lm
        if [[ $? -eq 0 ]]; then
          echo "$j compiled! :)"
        fi
      fi
    done
  fi
}

function ltc {
  if [[ $(pwd) = ~ ]]; then
    echo "Don't use this function in your root folder!"
    return 1
  fi
  if [[ $1 == 'p' ]]; then; local p=1; fi
  for i in $(fd -t f -d 2 -HI); do
    if [[ $i == *'latexmk'* ]] || [[ $i == *'synctex'* ]] ||
      [[ $i == *'.aux' ]] || [[ $i == *'.bbl' ]] ||
      [[ $i == *'.bcf' ]] || [[ $i == *'.blg' ]] ||
      [[ $i == *'.fls' ]] || [[ $i == *'.log' ]] ||
      [[ $i == *'.nav' ]] || [[ $i == *'.out' ]] ||
      [[ $i == *'.snm' ]] || [[ $i == *'.toc' ]] ||
      [[ $i == *'.xml' ]]; then
      rm -f $i
      if [[ $? -eq 0 ]]; then
        echo "$i removed!"
      fi
    elif [[ $p -eq 1 ]] && [[ $i == *'.pdf' ]]; then
      rm -f $i
      if [[ $? -eq 0 ]]; then
        echo "$i purged!"
      fi
    fi
  done
}

function openNvim {
  if [[ $# -eq 0 ]]; then
    nvim .
  else
    nvim $@
  fi
}

### ALIASES
alias c="clear"
alias e="exit"
alias l="exa -la --group-directories-first --git --icons"
alias s="sudo"
alias au="sudo apt update && apt list --upgradable"
alias cdot="~/Documents/dev/dotfiles/copyconfig.sh"
alias mosh="mosh --ssh='kitty kitten ssh'"
alias sage="sage --notebook=jupyter"
alias ssh="kitty kitten ssh"
alias v="openNvim"
