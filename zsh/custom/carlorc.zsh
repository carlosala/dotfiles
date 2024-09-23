function _carlorc_hook {
  [[ -f .carlorc ]] || builtin return 0
  local _script=".carlorc"

  # ensure config file exists and is valid
  local _dir="${XDG_CONFIG_HOME:-${HOME}/.config}/carlorc"
  [[ -d "$_dir" ]] || command mkdir -p "$_dir"
  local _file="$_dir/whitelist.json"
  if [[ ! -f "$_file" ]] || ! command jq -e '.' "$_file" >/dev/null 2>&1; then
    builtin echo "{}" > "$_file"
  fi

  local _entry=$(command jq -r ".\"$PWD\"" "$_file")
  local _sum=$(command sha1sum "$_script" | awk '{ print $1 }')
  if [[ $_sum != $_entry ]]; then
    if ! builtin read -q "?Do you want to execute .carlorc and whitelist its content? [y/N] "; then
      builtin echo
      builtin return 0
    else
      builtin echo
    fi
  fi
  builtin echo $(command jq ". += { \"$PWD\": \"$_sum\" }" "$_file") > "$_file"
  builtin source $_script
}

autoload -U add-zsh-hook
add-zsh-hook chpwd _carlorc_hook
_carlorc_hook
