#!/bin/bash

if [[ ! -e /opt/devsak-git ]]; then
  sudo git clone https://github.com/hristotanev/devsak.git /opt/devsak-git
fi

sudo ln -s /opt/devsak-git/scripts/devsak.sh /usr/bin/devsak
sudo ln -s /opt/devsak-git/scripts/uninstall.sh /usr/bin/uninstall_devsak
