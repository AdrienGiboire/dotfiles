function migrate
  # if we have a name for the migration AND some `field:type` property
  if test 2 -le (count $argv)
    drails g migration $argv
    drake db:migrate

  # if we just have a migration name
  else if test 1 -le (count $argv)
    drails g migration $argv

  # if we have nothing we just migrate the DB
  else if test 0 -le (count $argv)
    drake db:migrate
  end
end
