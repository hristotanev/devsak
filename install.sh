#!/bin/bash

if [[ -e $HOME/.config/devsak ]]; then
  echo "'devsak' has already been installed. skipping."
  exit
fi

git clone https://github.com/hristotanev/devsak.git $HOME/.config/devsak
sudo ln -s $HOME/.config/devsak/uninstall.sh /usr/local/bin/uninstall_devsak

for script_path in $HOME/.config/devsak/scripts/*.sh; do
  script_name=$(basename $script_path | awk -F'.' '{ print $1 }')
  if [[ $(ls /usr/local/bin/ | grep -o -w $script_name) == "" ]]; then
    sudo ln -s $script_path /usr/local/bin/$script_name
  else
    echo "'$script_name' already installed. skipping."
  fi
done

echo "'devsak' installed successfully."
