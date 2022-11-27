#! /bin/bash

du_func() {
  if [ -z $1 ]; then
    PARAM=.
  else
    PARAM=$1
  fi

  for name in $PARAM/*; do du -sh "$name"; done
}

alias dush="du_func"
