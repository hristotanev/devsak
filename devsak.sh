#!/bin/bash

function usage {
  echo "Usage: devsak [OPTIONS] <SCRIPT1,SCRIPT2,...>"
  echo "Command-line orchestrator for installing different scripts."
  echo
  echo "Some of the available options include:"
  echo
  echo -e "  -a\t\t\t install all available scripts"
  echo -e "  -s SCRIPT1,SCRIPT2,... install scripts specified by their name, comma separated (list all scripts for more info)"
  echo -e "  -h\t\t\t display this help and exit"
  exit
}

function install_script_if_missing {
  script_name=$1
  if [[ $(ls /usr/local/bin/ | grep -o -w $script_name) == "" ]]; then
    echo "Installing '$script_name' script..."
    sudo ln -s $HOME/.config/devsak/scripts/$script_name.sh /usr/local/bin/$script_name
  else
    echo "'$script_name' already installed. skipping."
  fi
  exit
}

function install_all {
  for script_path in $HOME/.config/devsak/scripts/*.sh; do
    script_name=$(basename $script_path | awk -F'.' '{ print $1 }')
    install_script_if_missing $script_name
  done

  exit
}

function install_scripts {
  scripts=$(echo "$OPTARG" | tr ',' ' ')
  for script_name in $scripts; do
    install_script_if_missing $script_name
  done

  exit
}

while getopts "a,s:h" flag; do
  case $flag in
    a) install_all; exit;;
    s) install_scripts; exit;;
    h) usage; exit;;
    ?) echo "Run '-h' for more info."; exit;;
  esac
done
