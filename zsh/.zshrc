# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# ADDING PATHS
export PATH="$PATH:/home/carlo/.cargo/bin"
export PATH="$PATH:/home/carlo/.deno/bin"
export PATH="$PATH:/home/carlo/.flutter/bin"
export PATH="$PATH:/home/carlo/.go/bin"
export PATH="$PATH:/home/carlo/.local/bin"
export PATH="$PATH:/home/carlo/.node/bin"
export PATH="$PATH:/home/carlo/.yarn/bin"

# ANDROID STUDIO SETUP
export ANDROID_HOME="/home/carlo/.android/sdk"
export ANDROID_SDK_ROOT=$ANDROID_HOME
export PATH="$PATH:$ANDROID_HOME/cmdline-tools/latest/bin"
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/platform-tools"
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/tools/bin"
# export JAVA_HOME="/home/carlo/.android-studio/jre"

# Path to your oh-my-zsh installation.
export ZSH="/home/carlo/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="nt-modif"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=( git npm yarn )

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

### CUSTOM FUNCTIONS
function gccom {
  if [ $# -eq 0 ]; then
    for i in *; do
      if [ ${i: -2} = '.c' ] && [ -f $i ]; then
        gcc -o ${i/.c} -g -Wall $i -lm
        echo "$i compiled! :)"
      fi
    done
  else
    for j in "$@"; do
      if [ ${j: -2} != '.c' ] || [ ! -f $j ]; then
        echo "$j is not a C file! :("
      else
        gcc -o ${j/.c} -g -Wall $j -lm
        echo "$j compiled! :)"
      fi
    done
  fi
}

function ltc {
  for i in *; do
    if [ -f $i ]; then
      j=${i: -4}
      if [ ${i: -8} = '_latexmk' ] || [ ${i: -11} = '.synctex.gz' ] ||
        [ $j = '.aux' ] ||
        [ $j = '.bbl' ] ||
        [ $j = '.bcf' ] ||
        [ $j = '.blg' ] ||
        [ $j = '.fls' ] ||
        [ $j = '.log' ] ||
        [ $j = '.nav' ] ||
        [ $j = '.out' ] ||
        [ $j = '.snm' ] ||
        [ $j = '.toc' ] ||
        [ $j = '.xml' ] ||
        then; rm -f $i
        echo "$i removed!"
      fi
    fi
  done
}

function openNvim {
  if [ $# -eq 0 ]; then
    nvim .
  else
    nvim $1
  fi
}

### ALIAS
alias v=openNvim
alias ssh="TERM=xterm-256color ssh"
alias cdd="cd ~/Documentos/dev/"
alias c="clear"
alias s="sudo"
alias e="exit"
alias au="sudo apt update && apt list --upgradable"

### NEOFETCH INIT
neofetch
