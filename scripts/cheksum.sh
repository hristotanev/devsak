#!/bin/bash

HASH=$1
FILE=$2

function usage {
  echo "Usage: cheksum [HASH] [FILE]"
  echo "Verify SHA256 hash matches for downloaded FILE."
  echo
  echo -e "  -h\t display this help and exit"
  exit
}

while getopts "h" flag; do
  case $flag in
    h) usage; exit;;
    ?) echo "Run '-h' for more info."; exit;;
  esac
done

if [[ $HASH == "" || $FILE == "" ]]; then
  echo "Run '-h' for more information on required command options."
  exit
fi

sha256sum $FILE && sha256sum -c $HASH
