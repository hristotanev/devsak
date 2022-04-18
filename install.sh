#!/bin/bash

for script_path in $(pwd)/scripts/*.sh; do
  script_name=$(basename $script_path | awk -F'.' '{ print $1 }')
  if [[ $(ls /usr/bin/ | grep -o -w $script_name) == "" ]]; then
    sudo ln -s $script_path /usr/bin/$script_name
  else
    echo "'$script_name' already installed. Skipping..."
  fi
done
