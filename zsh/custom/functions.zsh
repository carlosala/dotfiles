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

function openNvim {
  if (( $# )); then
    nvim -O $@
  else
    nvim .
  fi
}
