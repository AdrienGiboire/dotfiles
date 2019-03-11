## Prerequisites

* Unix based OS
* Git
```
sudo apt-get install git
```
* Various utils
```
sudo apt-get install exuberant-ctags silversearcher-ag
```
* NeoVim
```
sudo apt-get install neovim
```

## Install

To clean this:

```
rm -fr .bash_history .bash_logout  .bashrc .bundler-exec.sh .config/ .dotfiles/ .git_template/ .gitconfig .githelpers .gitignore .jshintrc .profile .pryrc .ssh/ README.md bin/ scripts/
```

```
git clone --bare https://github.com/AdrienGiboire/dotfiles.git $HOME/.dotfiles
alias config="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@"
config checkout
config config status.showUntrackedFiles no
```

## To Install Minpac for Neovim

```
git clone https://github.com/k-takata/minpac.git \
  ~/.config/nvim/pack/minpac/opt/minpac

nvim --headless +PackUpdate +q
```
