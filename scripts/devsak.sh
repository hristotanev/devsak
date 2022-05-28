#!/bin/bash

function usage {
  echo "Usage: devsak [options] [tool names,...]"
  echo "Command-line orchestrator for installing different tools."
  echo
  echo "Some of the available options include:"
  echo
  echo -e "  -l\t\t\t list the names of all available tools"
  echo -e "  -a\t\t\t install all available tools"
  echo -e "  -i tool names,... \t install tools specified by their comma separated names"
  echo -e "  -h\t\t\t display this help and exit"
  exit
}

function install_tool_if_missing {
  tool_name=$1
  if [[ $(ls /usr/bin/ | grep -o -w $tool_name) == "" ]]; then
    echo "Installing '$tool_name' tool..."
    sudo ln -s /opt/devsak-git/tools/$tool_name.sh /usr/bin/$tool_name
  else
    echo "'$tool_name' already installed. skipping."
  fi
  exit
}

function list_all_available_tools {
  echo "Available tools:"
  echo "=================="

  for tool_path in /opt/devsak-git/tools/*.sh; do
    tool_name=$(basename $tool_path | awk -F'.' '{ print $1 }')
    echo $tool_name
  done

  echo
  echo "For summary of each, please refer to the README."

  exit
}

function install_all_tools {
  for tool_path in /opt/devsak-git/tools/*.sh; do
    tool_name=$(basename $tool_path | awk -F'.' '{ print $1 }')
    install_tool_if_missing $tool_name
  done

  exit
}

function install_specific_tools {
  tools=$(echo "$OPTARG" | tr ',' ' ')
  for tool_name in $tools; do
    install_tool_if_missing $tool_name
  done

  exit
}

if [[ $# == 0 ]]; then
  usage
  exit
fi

while getopts "l,a,i:h" flag; do
  case $flag in
    l) list_all_available_tools; exit;;
    a) install_all_tools; exit;;
    i) install_specific_tools; exit;;
    h) usage; exit;;
    ?) echo "Run '-h' for more info."; exit;;
  esac
done
