ruby_version=2.5.1
chruby_version=0.3.9
chruby_fish_version=0.8.1
ruby_install_version=0.7.0

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

cd /tmp
wget -O ruby-install-$ruby_install_version.tar.gz https://github.com/postmodern/ruby-install/archive/v$ruby_install_version.tar.gz
tar -xzvf ruby-install-$ruby_install_version.tar.gz
cd ruby-install-$ruby_install_version/
sudo make install

mkdir ~/.rubies
ruby-install ruby-$ruby_version

cd /tmp
wget -O chruby-$chruby_version.tar.gz https://github.com/postmodern/chruby/archive/v$chruby_version.tar.gz
tar -xzvf chruby-$chruby_version.tar.gz
cd chruby-$chruby_version/
sudo make install

echo "ruby-$ruby_version" > ~/.ruby-version

cd /tmp
wget -O chruby-fish-$chruby_fish_version.tar.gz https://github.com/JeanMertz/chruby-fish/archive/v$chruby_fish_version.tar.gz
tar -xzvf chruby-fish-$chruby_fish_version.tar.gz
cd chruby-fish-$chruby_fish_version/
sudo make install

git clone https://github.com/k-takata/minpac.git \
  ~/.config/nvim/pack/minpac/opt/minpac
nvim --headless +PackUpdate +q
