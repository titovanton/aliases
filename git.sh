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

git_rebase_i() {
  git rebase -i HEAD~$1
}

alias gs="git status"
alias gc="git commit -am"
alias gp="git push origin"
alias gpf="git push -f origin"
alias gr="git rebase"
alias gri="git_rebase_i"
