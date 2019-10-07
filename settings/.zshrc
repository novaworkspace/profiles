
alias reload="source ~/.zshrc"
alias zsha="code ~/.zshrc"
alias gita="code ~/.gitconfig"

function clone {
  local tmp=$(mktemp -t git)
  local url
  local repo_name

  if [ -z "$1" ]
  then
    url=$(pbpaste)
  else
    url="$1"
  fi

  command git clone "$url" --progress 2>&1 | tee $tmp
  repo_name=$(awk -F\' '/Cloning into/ {print $2}' $tmp)
  rm $tmp
  printf "Changing to directory %s\n" "$repo_name"
  cd "$repo_name"
}

function cim {
  git add . && git cim "$1"
}

function stash {
  # git stash store $(git stash create "$1")
  # git stash list

  # git stash store -m "$1"

  # git stash create "$1"
  # git stash store "$hash"
  # git stash list
}

function dev {
  cd ~/develop
}

function push {
  git push origin master
}


function stop-port {
  kill $(lsof -t -i:"$1")
}

function onport {
  lsof -t -i:"$1"
}

function modules {
  cd $(npm root -g)
}

function go {
  case $1 in
     back)
      cd -
      ;;
     dev|develop)
      cd ~/develop
      ;;
     npm|modules)
      cd $(npm root -g)
      ;;
     *)
      echo "- back
- dev
- npm
- stage"
      ;;
  esac
}
