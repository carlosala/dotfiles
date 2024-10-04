function _carlorc_hook {
  local _pwd=$PWD
  typeset -ga _carlorc_visited
  while [[ $_pwd != "/" ]]; do
    (( ${_carlorc_visited[(Ie)$_pwd]} )) && return 0
    _carlorc_visited+=($_pwd)
    [[ -f "$_pwd/.carlorc" ]] && break
    _pwd=${_pwd:h}
  done
  local _script="$_pwd/.carlorc"
  [[ -f $_script ]] || builtin return 0

  # ensure config file exists and is valid
  local _dir="${XDG_CONFIG_HOME:-${HOME}/.config}/carlorc"
  [[ -d "$_dir" ]] || command mkdir -p "$_dir"
  local _file="$_dir/whitelist.json"
  if [[ ! -f "$_file" ]] || ! command jq -e '.' "$_file" >/dev/null 2>&1; then
    builtin echo "{}" > "$_file"
  fi

  local _entry=$(command jq -r ".\"$_pwd\"" "$_file")
  local _sum=$(command sha1sum "$_script" | awk '{ print $1 }')

  if [[ $_sum != $_entry ]]; then
    if builtin read -q "?Do you want to execute .carlorc and whitelist its content? [y/N] "; then
      builtin echo
      return 1
    fi
    builtin echo
  fi

  builtin echo $(command jq ". += { \"$_pwd\": \"$_sum\" }" "$_file") > "$_file"
  builtin source $_script
}

autoload -U add-zsh-hook
add-zsh-hook chpwd _carlorc_hook
_carlorc_hook
