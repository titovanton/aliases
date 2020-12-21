#! /bin/bash

# left side parameters
lgl() {
  if [ -z $@ ]; then
    PARAM=-10
  else
    PARAM=$@
  fi

  git log $PARAM --pretty='format:%Cred %h %Cgreen %an %Creset %cr %Cgreen %s%Creset'
}

# right side parameters
rgl() {
  git log --pretty='format:%Cred %h %Cgreen %an %Creset %cr %Cgreen %s%Creset' $@
}

gl() {
  lgl $@
}
