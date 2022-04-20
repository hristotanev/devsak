#!/bin/bash

function usage {
  echo "Usage: devsak [OPTIONS]"
  echo "Command-line orchestrator for installing different scripts on devsak."
  echo
  echo "Some of the available options include:"
  echo
  echo -e "  -a\t install all available scripts"
  echo -e "  -h\t display this help and exit"
  exit
}

function install_all {
  for script_path in $HOME/.config/devsak/scripts/*.sh; do
    script_name=$(basename $script_path | awk -F'.' '{ print $1 }')
    if [[ $(ls /usr/local/bin/ | grep -o -w $script_name) == "" ]]; then
      echo "Installing '$script_name' script..."
      sudo ln -s $script_path /usr/local/bin/$script_name
    else
      echo "'$script_name' already installed. skipping."
    fi
  done

  exit
}

while getopts "a,h" flag; do
  case $flag in
    a) install_all; exit;;
    h) usage; exit;;
    ?) echo "Run '-h' for more info."; exit;;
  esac
done
