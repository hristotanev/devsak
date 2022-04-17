#!/bin/bash

for script_path in $(pwd)/tools/*.sh; do
  script_name=$(basename $script_path | awk -F'.' '{ print $1 }')
  sudo ln -s $script_path /usr/bin/$script_name
done
