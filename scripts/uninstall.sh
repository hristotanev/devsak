#!/bin/bash

for tool_path in /opt/devsak-git/tools/*.sh; do
  tool_name=$(basename $tool_path | awk -F'.' '{ print $1 }')
  if [[ $(ls /usr/bin | grep -o -w "$tool_name") != "" ]]; then
    sudo rm /usr/bin/$tool_name
  fi
done

sudo rm /usr/bin/devsak
sudo rm /usr/bin/uninstall_devsak
sudo rm -rf /opt/devsak-git
