#!/bin/sh


LRED='\033[1;31m'
LGREEN='\033[1;32m'
NC='\033[0m' # No Color

__border() {
  local COLOR=$1
  local title="║ ${@:2} ║"
  local edge=$(echo $title | sed -E "s/%%|##//g" | sed 's/./═/g' | sed 's/^./╔/' | sed 's/.$/╗/')
  printf '\n'
  echo $edge
  title=$(echo $title | sed "s/%%/\\${COLOR}/g" | sed "s/##/\\${NC}/g")
  echo -e $title
  edge=$(echo $edge | sed 's/^./╚/' | sed 's/.$/╝/')
  echo $edge
  printf '\n'
}

border() {
  __border $NC $@
}

success() {
  __border $LGREEN "%%SUCCESS:## $@"
}

error() {
  __border $LRED "%%ERROR:## $@"
}

