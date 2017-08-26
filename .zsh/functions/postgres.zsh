function usage {
  echo "Usage: restore_db [options] -o db_owner"
  echo "Options:"
  echo "  -s db_source (default: $source)"
  echo "  -t db_target (default: $target)"
  echo "  -o db_owner"
}

function restore_db {
  local source='backup'
  local target='development'
  local owner=''

  while getopts 's:t:o:h' opt
  do
    case $opt in
      s)
        source=$OPTARG
        ;;
      t)
        target=$OPTARG
        ;;
      o)
        owner=$OPTARG
        ;;
      h)
        usage
        return 1
        ;;
    esac
  done

  [ -z "$owner" ] && { echo 'Missing owner' && return 1 }

  psql -tc "SELECT pg_terminate_backend(pg_stat_activity.pid) FROM pg_stat_activity WHERE pg_stat_activity.datname = '$target' OR pg_stat_activity.datname = '$source' AND pid <> pg_backend_pid();" -d postgres
  psql -tc "DROP DATABASE $target;" -d postgres
  psql -tc "CREATE DATABASE $target WITH TEMPLATE $source OWNER $owner;" -d postgres
}
