#!/bin/bash

for tool_path in $HOME/.config/devsak/tools/*.sh; do
  tool_name=$(basename $tool_path | awk -F'.' '{ print $1 }')
  if [[ $(ls /usr/local/bin | grep -o -w "$tool_name") != "" ]]; then
    sudo rm /usr/local/bin/$tool_name
  fi
done

sudo rm /usr/local/bin/devsak
sudo rm /usr/local/bin/uninstall_devsak
rm -rf $HOME/.config/devsak

echo "'devsak' uninstalled successfully."
