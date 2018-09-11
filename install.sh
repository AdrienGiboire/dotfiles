git clone --bare https://github.com/adriengiboire/dotfiles.git $HOME/.dotfiles
function config
   /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $argv
end
mkdir -p .config-backup
config checkout
if test 0 -le (count $argv)
  echo "Checked out config."
else
    echo "Backing up pre-existing dot files."
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
end
config checkout
config config status.showUntrackedFiles no

curl -L https://raw.githubusercontent.com/postmodern/chruby/master/scripts/setup.sh | bash
