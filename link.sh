yes() {
  [[ "$REPLY" =~ ^[Yy]$ ]] &&
    return 0 ||
    return 1
}

ask() {
  print_question "$1"
  read
}

confirm() {
  print_question "$1 (y/n) "
  read -n 1
  printf "\n"
}

execute() {
  $1 &>/dev/null
  print_result $? "${2:-$1}"
}

print_error() {
  printf "[\e[0;31m FAIL \e[0m] $1 $2\n"
}

print_info() {
  printf "[\n\e[0;35m INFO \e[0m] $1\n\n"
}

print_question() {
  printf "[\e[0;33m ? \e[0m] $1\n"
}

print_result() {
  [ $1 -eq 0 ] &&
    print_success "$2" ||
    print_error "$2"

  [ "$3" == "true" ] && [ $1 -ne 0 ] &&
    exit
}

print_success() {
  printf "[\e[0;32m OK \e[0m] $1\n"
}

declare -a DOTFILES=$(find . -type f -maxdepth 1 -name ".*" -not -name .DS_Store -not -name .git | sed -e 's|//|/|' | sed -e 's|./.|.|')

main() {
  local i=""
  local sourceFile=""
  local targetFile=""

  for i in ${DOTFILES[@]}; do
    sourceFile="$(pwd)/$i"
    targetFile="$HOME/$(printf "%s" "$i" | sed "s/.*\/\(.*\)/\1/g")"
    if [ -e "$targetFile" ]; then
      if [ "$(readlink "$targetFile")" != "$sourceFile" ]; then
        confirm "'$targetFile' already exists, do you want to overwrite it?"
        if yes; then
          rm -rf "$targetFile"
          execute "ln -fs $sourceFile $targetFile" "$targetFile → $sourceFile"
        else
          print_error "$targetFile → $sourceFile"
        fi
      else
        print_success "$targetFile → $sourceFile"
      fi
    else
      execute "ln -fs $sourceFile $targetFile" "$targetFile → $sourceFile"
    fi
  done
}

main
