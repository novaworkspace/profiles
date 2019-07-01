
alias reload="source ~/.zshrc"
alias zsha="code ~/.zshrc"

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

function dev {
  cd ~/develop
}

function push {
  git push origin master
}


function modules {
  cd $(npm root -g)
}
