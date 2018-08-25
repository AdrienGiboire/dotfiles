function extract
  echo Extracting $argv ...
  if test -f $argv
      switch $argv
      case *.tar.bz2
        tar xjf $argv
      case *.tar.gz
        tar xzf $argv
      case *.bz2
        bunzip2 $argv
      case *.rar
        unrar x $argv
      case *.gz
        gunzip $argv
      case *.tar
        tar xf $argv
      case *.tbz2
        tar xjf $argv
      case *.tgz
        tar xzf $argv
      case *.zip
        unzip $argv
      case *.Z
        uncompress $argv
      case *.7z
        7z x $argv
      case *
        echo "'$argv' cannot be extracted via extract()"
      end
  else
      echo "'$argv' is not a valid file"
  end
end

function c
  cd ~/code
  if test 1 -le (count $argv)
    cd $argv
  end
end

function octo-resume-copy-db
  filename=$argv
  set size (stat -f%z $filename)
  aws s3api get-object --bucket octoly-common --key octoly_production_semi_anonymised.sqlc --range "bytes=$size-" /dev/stdout | pv >> $filename
  echo "Download completed. Check $filename"
end
