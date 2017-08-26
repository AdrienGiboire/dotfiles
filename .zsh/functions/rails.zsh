function migrate {
  # if we have a name for the migration AND some `field:type` property
  if [ 2 -le $# ]; then
    drails g migration $@
    drake db:migrate

  # if we just have a migration name
  elif [ 1 -le $# ]; then
    drails g migration $@

  # if we have nothing we just migrate the DB
  elif [ 0 -le $# ]; then
    drake db:migrate
  fi
}

function up {
  local current_branch=`git rev-parse --abbrev-ref HEAD`
  git stash save "before updating the master branch" &&
  git co master &&
  git fa &&
  git pullr &&
  git co $current_branch &&
  git rebase master &&
  bundle install &&
  migrate &&
  git stash pop
}
