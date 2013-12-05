#!/usr/env sh

INSTALLDIR=$PWD/dotfiles

create_symlinks () {
  if [ ! -f ~/.vim ]; then
    ln -sfn $INSTALLDIR/ ~/.vim
  fi

  if [ ! -f ~/.vimrc ]; then
    ln -sfn $INSTALLDIR/vimrc ~/.vimrc
  fi
}

which git > /dev/null
if [ "$?" != "0" ]; then
  echo "git is missing."
  exit 1
fi

which vim > /dev/null
if [ "$?" != "0" ]; then
  echo "vim is missing."
  exit 1
fi

if [ ! -d "$INSTALLDIR" ]; then
  echo "cloning repository."
  git clone git://github.com/AdrienGiboire/dotfiles.git
  create_symlinks
  cd $INSTALLDIR

else
  echo "updating repository."
  cd $INSTALLDIR
  git pull origin master
  create_symlinks
fi

if [ -d "bundle" ]; then
  echo "creating bundle and backup directories"
  mkdir bundle
  mkdir -p tmp/backup tmp/swap tmp/undo
fi

if [ ! -d "bundle/vundle" ]; then
  echo "installing Vundle (https://github.com/gmarik/vundle)."
  git clone https://github.com/gmarik/vundle.git bundle/vundle
fi

vim +BundleInstall +qall 2> /dev/null
