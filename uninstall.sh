#!/bin/bash

for script_path in $(pwd)/scripts/*.sh; do
  script_name=$(basename $script_path | awk -F'.' '{ print $1 }')
  sudo rm /usr/bin/$script_name
done