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
echo "Linking $PWD/githelpers $HOME/.githelpers"
ln -s $PWD/githelpers $HOME/.githelpers

if [ -L /etc/zsh/zlogin ]; then
  echo "Removing /etc/zsh/zlogin"
  rm /etc/zsh/zlogin
elif [ -f /etc/zsh/zlogin ]; then
  echo "Backup /etc/zsh/zlogin in /etc/zsh/zlogin.orig"
  mv /etc/zsh/zlogin /etc/zsh/zlogin.orig
fi
echo "Linking $PWD/zlogin /etc/zsh/zlogin"
ln -s $PWD/zlogin /etc/zsh/zlogin

if [ -L /etc/zsh/zlogout ]; then
  echo "Removing /etc/zsh/zlogout"
  rm /etc/zsh/zlogout
elif [ -f /etc/zsh/zlogout ]; then
  echo "Backup /etc/zsh/zlogout in /etc/zsh/zlogout.orig"
  mv /etc/zsh/zlogout /etc/zsh/zlogout.orig
fi
echo "Linking $PWD/zlogout /etc/zsh/zlogout"
ln -s $PWD/zlogout /etc/zsh/zlogout

if [ -L /etc/zsh/zshenv ]; then
  echo "Removing /etc/zsh/zshenv"
  rm /etc/zsh/zshenv
elif [ -f /etc/zsh/zshenv ]; then
  echo "Backup /etc/zsh/zshenv in /etc/zsh/zshenv.orig"
  mv /etc/zsh/zshenv /etc/zsh/zshenv.orig
fi
echo "Linking $PWD/zshenv /etc/zsh/zshenv"
ln -s $PWD/zshenv /etc/zsh/zshenv

if [ -L /etc/zsh/dir_colors ]; then
  echo "Removing /etc/zsh/dir_colors"
  rm /etc/zsh/dir_colors
elif [ -f /etc/zsh/dir_colors ]; then
  echo "Backup /etc/zsh/dir_colors in /etc/zsh/dir_colors.orig"
  mv /etc/zsh/dir_colors /etc/zsh/dir_colors.orig
fi
echo "Linking $PWD/dir_colors /etc/zsh/dir_colors"
ln -s $PWD/dir_colors /etc/zsh/dir_colors

if [ -L /etc/zsh/zshrc ]; then
  echo "Removing /etc/zsh/zshrc"
  rm /etc/zsh/zshrc
elif [ -f /etc/zsh/zshrc ]; then
  echo "Backup /etc/zsh/zshrc in /etc/zsh/zshrc.orig"
  mv /etc/zsh/zshrc /etc/zsh/zshrc.orig
fi
echo "Linking $PWD/zshrc /etc/zsh/zshrc"
ln -s $PWD/zshrc /etc/zsh/zshrc

echo "Links created."
