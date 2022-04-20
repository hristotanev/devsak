#!/bin/bash

if [[ -e $HOME/.config/devsak ]]; then
  echo "'devsak' has already been installed. skipping."
  exit
fi

git clone https://github.com/hristotanev/devsak.git $HOME/.config/devsak
sudo ln -s $HOME/.config/devsak/scripts/devsak.sh /usr/local/bin/devsak
sudo ln -s $HOME/.config/devsak/scripts/uninstall.sh /usr/local/bin/uninstall_devsak

echo "'devsak' installed successfully. don't forget to restart your terminal."
