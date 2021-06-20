#!/usr/bin/env bash

fix_dir_permissions() {
  sudo chown -R titovanton:www-data $1 && sudo chmod -R 775 $1
}

alias fdp=fix_dir_permissions
