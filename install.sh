#!/bin/sh
cd `dirname $0`

for xname in tmux.conf xinitrc xmonad zshrc vim vimrc gitconfig Xdefaults; do
  if [ ! -e ~/.$xname ]; then
    echo "Linking '~/.$xname'."
    ln -s `pwd`/$xname ~/.$xname
  else
    echo "'~/.$xname' already exists."
  fi
done

for dirname in lilyterm powerline; do
  if [ ! -e ~/.config/$dirname ]; then
    ln -s `pwd`/$dirname ~/.config/$dirname
    echo "Linking '~/.config/$dirname'."
  else
    echo "'~/.config/$dirname' already exists."
  fi
done

