#!/bin/bash

if [[ ! -e $HOME/.config/devsak ]]; then
  echo "'devsak' has already been uninstalled. skipping."
  exit
fi

for script_path in $HOME/.config/devsak/scripts/*.sh; do
  script_name=$(basename $script_path | awk -F'.' '{ print $1 }')
  if [[ $(ls /usr/local/bin | grep -o -w "$script_name") != "" ]]; then
    rm /usr/local/bin/$script_name
  fi
done

rm /usr/local/bin/uninstall_devsak
rm -rf $HOME/.config/devsak

echo "'devsak' uninstalled successfully."
