function gccom {
  if [[ $# -eq 0 ]]; then
    for i in $(fd -t f -d 2 -e c -HI); do
      gcc -o ${i/.c} -g -Wall $i -lm && [[ $? -eq 0 ]] && echo "$i compiled!"
    done
  else
    for j in $@; do
      if [[ ${j: -2} == ".c" ]] && [[ -f $j ]]; then
        gcc -o ${j/.c} -g -Wall $j -lm && [[ $? -eq 0 ]] && echo "$j compiled!"
      else
        echo "$j is not a C file!"
      fi
    done
  fi
  unset i j
}

function ltc {
  if [[ $PWD == ~ ]]; then
    echo "Don't use this function in your root folder!"
    return 1
  fi
  [[ $1 == "p" ]] && local pdfpurge="true"
  for i in $(fd -t f -d 2 -HI); do
    if [[ $i =~ "latexmk" ]] || [[ $i =~ "synctex" ]] ||
      [[ $i =~ ".aux" ]] || [[ $i =~ ".bbl" ]] ||
      [[ $i =~ ".bcf" ]] || [[ $i =~ ".blg" ]] ||
      [[ $i =~ ".fls" ]] || [[ $i =~ ".log" ]] ||
      [[ $i =~ ".nav" ]] || [[ $i =~ ".out" ]] ||
      [[ $i =~ ".snm" ]] || [[ $i =~ ".toc" ]] ||
      [[ $i =~ ".xml" ]]; then
      rm -f $i
      [[ $? -eq 0 ]] && echo "$i removed!"
    elif [[ -n $pdfpurge ]] && [[ $i =~ ".pdf" ]]; then
      rm -f $i && [[ $? -eq 0 ]] && echo "$i purged!"
    fi
  done
  unset i
}

function openNvim {
  if [[ $# -eq 0 ]]; then
    nvim .
  else
    nvim -O $@
  fi
}

function rbwg {
  if ! (( $+commands[kitty] && $+commands[rbw] )); then
    echo "Install kitty and rbw!"
    return 1
  fi
  [[ ! $# -eq 1 ]] && echo "Just one argument!" && return 1
  local rbwpw=$(rbw get $1)
  [[ -z $rbwpw ]] && return 1
  echo -n $rbwpw | kitty +kitten clipboard
}
