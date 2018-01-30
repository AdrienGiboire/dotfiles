function extract {
  echo Extracting $1 ...
  if [ -f $1 ] ; then
      case $1 in
          *.tar.bz2) tar xjf $1    ;;
          *.tar.gz)  tar xzf $1    ;;
          *.bz2)     bunzip2 $1    ;;
          *.rar)     unrar x $1    ;;
          *.gz)      gunzip $1     ;;
          *.tar)     tar xf $1     ;;
          *.tbz2)    tar xjf $1    ;;
          *.tgz)     tar xzf $1    ;;
          *.zip)     unzip $1      ;;
          *.Z)       uncompress $1 ;;
          *.7z)      7z x $1       ;;
          *)         echo "'$1' cannot be extracted via extract()" ;;
      esac
  else
      echo "'$1' is not a valid file"
  fi
}

function deploy {
  local current_branch=`git rev-parse --abbrev-ref HEAD`
  local target_branch=$1
  local force_mode=$2

  git stash save --include-untracked "before deploying '$current_branch' to '$target_branch'" &&
  git pullr &&
  git push &&
  git co $target_branch &&
  git pullr &&
  git merge $current_branch &&
  git push &&
  sh .travis/deploy.sh $target_branch &&
  git co $current_branch &&
  git stash pop
}

function update_current_branch {
  local current_branch=`git rev-parse --abbrev-ref HEAD`
  local source_branch='master'

  # if we have a branch as argument
  if [ 1 -le $# ]; then
    source_branch=$1
  fi

  git stash save "before updating '$current_branch' from '$source_branch'"
  git co $source_branch
  git pullr
  git co $current_branch
  git merge $source_branch
  git stash pop
}

function todo {
  vim ~/code/todo.todo;
}
