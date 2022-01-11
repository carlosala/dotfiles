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
  if [[ $(pwd) == ~ ]]; then
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

function rbwg {
  if ! (( $+commands[kitty] && $+commands[rbw] )); then
    echo "You don't have kitty and rbw installed!"
    return 1
  fi
  if [[ ! $# -eq 1 ]]; then
    echo "Just one argument!"
    return 1
  fi
  local rbwpw=$(rbw get $1)
  if [[ $rbwpw == "" ]]; then; return 1; fi
  kitty +kitten clipboard <<< $rbwpw
}
