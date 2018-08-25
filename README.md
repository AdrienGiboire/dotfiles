## Install

```
git clone --bare https://github.com/AdrienGiboire/dotfiles.git $HOME/.dotfiles
function config
   /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
end
mkdir -p .config-backup
config checkout
if test (count argv) = 0
  echo "Checked out config."
else
    echo "Backing up pre-existing dot files."
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
end
config checkout
config config status.showUntrackedFiles no
```

## To Install Minpac for Neovim

```
git clone https://github.com/k-takata/minpac.git \
  ~/.config/nvim/pack/minpac/opt/minpac

nvim --headless +PackUpdate +q
```
