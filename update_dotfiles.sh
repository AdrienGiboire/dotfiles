#!/bin/zsh

FILES=("gitconfig" "githelpers")

for file in $FILES
do
    if [[ -L $HOME/.$file ]]; then
        echo "Removing $HOME/.$file"
        rm $HOME/.$file
    elif [[ -f $HOME/.$file ]]; then
        echo "Backup $HOME/.$file in $HOME/.$file.orig"
        mv $HOME/.$file $HOME/.$file.orig
    fi

    print "Linking $PWD/zshrc $HOME/.$file"
    ln -s $PWD/$file $HOME/.$file
done

echo "Links created."

if [[ -L $HOME/.zshrc ]]; then
    . $HOME/.zshrc
    echo "$HOME/.zshrc sourced"
fi
