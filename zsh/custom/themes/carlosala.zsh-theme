PROMPT='%F{2}$(_pwd_short)%f %B%F{4}[%f%b '
RPROMPT='$(gitprompt) %B%F{4}]%f %(?:%F{6}:%F{1})%T%f%b'

ZSH_GIT_PROMPT_SHOW_STASH=1
ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_SEPARATOR=" "
ZSH_THEME_GIT_PROMPT_DETACHED="%F{5}:"
ZSH_THEME_GIT_PROMPT_BRANCH="%F{3}"
ZSH_THEME_GIT_PROMPT_STAGED="%F{4}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%F{1}✖"
ZSH_THEME_GIT_PROMPT_UNSTAGED="%F{1}✚"
ZSH_THEME_GIT_PROMPT_BEHIND="%F{3}|↓"
ZSH_THEME_GIT_PROMPT_AHEAD="%F{3}|↑"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%F{4}…"
ZSH_THEME_GIT_PROMPT_STASHED="%F{4}⚑"
ZSH_THEME_GIT_PROMPT_CLEAN="%F{2}✓"

function _pwd_short {
  if [[ $PWD == "$HOME" ]]; then
    echo -n "~"
  else
    echo -n ${${${:-/${(j:/:)${(M)${(s:/:)${(D)PWD:h}}#(|.)[^.]}}/${PWD:t}}//\/~/\~}/\/\//\/}
  fi
}

# vim: ft=zsh
