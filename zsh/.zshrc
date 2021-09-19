### ADDING PATHS
export PATH="$PATH:/home/carlo/.cargo/bin"
export PATH="$PATH:/home/carlo/.deno/bin"
export PATH="$PATH:/home/carlo/.go/bin"
export PATH="$PATH:/home/carlo/.local/bin"
export PATH="$PATH:/home/carlo/.node/bin"
export PATH="$PATH:/home/carlo/.yarn/bin"

### ANDROID STUDIO SETUP
export ANDROID_HOME="/home/carlo/.android/sdk"
export ANDROID_SDK_ROOT=$ANDROID_HOME
export PATH="$PATH:$ANDROID_HOME/cmdline-tools/latest/bin"
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/platform-tools"
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/tools/bin"
# export JAVA_HOME="/home/carlo/.android-studio/jre"

### SOME VARIABLES
export XZ_DEFAULTS="-9 -T0"

### OMZ
export ZSH="/home/carlo/.oh-my-zsh";
ZSH_THEME="nt-modif"
plugins=( git )
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
alias s="sudo"
alias au="sudo apt update && apt list --upgradable"
alias cdd="cd ~/Documentos/dev/"
alias py=python3
alias ssh="TERM=xterm-256color ssh"
alias v=openNvim
