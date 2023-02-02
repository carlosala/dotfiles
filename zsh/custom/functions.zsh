function $ {
  "$@" # useful when c&p commands
}

function gccom {
  if (( $# )); then
    for file in $@; do
      if [[ ${file:e} == "c" ]] && [[ -f $file ]]; then
        gcc -o ${file:r} -g -Wall $file -lm
        (( ! $? )) && echo "$file compiled!"
      else
        echo "$file is not a C file!"
      fi
    done
  else
    for file in $(fd -t f -d 2 -e c -HI); do
      gcc -o ${file:r} -g -Wall $file -lm
      (( ! $? )) && echo "$file compiled!"
    done
  fi
  unset file
}

function icat {
  kitten icat $@
}

function ltc {
  depth=1
  while getopts "d:p" opt; do
    case $opt in
      d) depth=$OPTARG ;;
      p) pdfp=1 ;;
    esac
  done
  regexes=("latexmk" ".synctex.gz" ".aux" ".bbl" ".bcf" ".bgl" ".fls" ".log"
    ".nav" ".out" ".snm" ".toc" ".xml")
  for file in $(fd -t f -d $depth -HI); do
    if (( $pdfp )) && [[ $file =~ ".pdf" ]] && [[ -f "${file:r}.tex" ]]; then
      rm -f $file
      (( ! $? )) && echo "$file purged!"
      continue
    fi
    for rgx in $regexes; do
      if [[ $file =~ $rgx ]] && {[[ -f "${file:r}.tex" ]] \
        || [[ -f "${file/$rgx}.tex" ]]}; then
        rm -f $file
        (( ! $? )) && echo "$file removed!"
        break
      fi
    done
  done
  unset file rgx regexes opt depth pdfp
}

function nau {
  if (( $# )); then
    nautilus $@ >/dev/null 2>&1 &|
  else
    nautilus . >/dev/null 2>&1 &|
  fi
}

function openNvim {
  if (( $# )); then
    nvim -O $@
  else
    nvim .
  fi
}

function zat {
  if (( ! $# )); then
    echo "You need to pass, at least, one argument!"
    return 1
  else
    zathura $@ >/dev/null 2>&1 &|
  fi
}

if (( ${+functions[compdef]} )); then
  compdef _nautilus nau
  compdef _zathura zat
fi
