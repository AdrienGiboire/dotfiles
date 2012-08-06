#!/bin/sh

if [ -L $HOME/.gitconfig ]; then
  echo "Removing $HOME/.gitconfig"
  rm $HOME/.gitconfig
elif [ -f $HOME/.gitconfig ]; then
  echo "Backup $HOME/.gitconfig in $HOME/.gitconfig.orig"
  mv $HOME/.gitconfig $HOME/.gitconfig.orig
fi
echo "Linking $PWD/gitconfig $HOME/.gitconfig"
ln -s $PWD/gitconfig $HOME/.gitconfig

if [ -L $HOME/.githelpers ]; then
  echo "Removing $HOME/.githelpers"
  rm $HOME/.githelpers
elif [ -f $HOME/.githelpers ]; then
  echo "Backup $HOME/.githelpers in $HOME/.githelpers.orig"
  mv $HOME/.githelpers $HOME/.githelpers.orig
fi
echo "Linking $PWD/gitconfig $HOME/.githelpers"
ln -s $PWD/githelpers $HOME/.githelpers

if [ -L $HOME/.vimrc ]; then
  echo "Removing $HOME/.vimrc"
  rm $HOME/.vimrc
elif [ -f $HOME/.vimrc ]; then
  echo "Backup $HOME/.vimrc in $HOME/.vimrc.orig"
  mv $HOME/.vimrc $HOME/.vimrc.orig
fi
echo "Linking $PWD/gitconfig $HOME/.vimrc"
ln -s $PWD/vimrc $HOME/.vimrc

if [ -L $HOME/.zshrc ]; then
  echo "Removing $HOME/.zshrc"
  rm $HOME/.zshrc
elif [ -f $HOME/.zshrc ]; then
  echo "Backup $HOME/.zshrc in $HOME/.zshrc.orig"
  mv $HOME/.zshrc $HOME/.zshrc.orig
fi
echo "Linking $PWD/gitconfig $HOME/.zshrc"
ln -s $PWD/zshrc $HOME/.zshrc

echo "Links created."
