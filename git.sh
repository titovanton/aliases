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
  git rebase -i HEAD~$1 --committer-date-is-author-date
}

alias gs="git status"
alias gc="git commit -am"
alias gcm="git commit -m"
alias gp="git push origin"
alias gpf="git push -f origin"
alias gr="git rebase --committer-date-is-author-date"
alias gri="git_rebase_i"
alias gd="git diff"
alias gdno="git diff --name-only"
alias gls="gl --stat"
alias glf="rgl"
alias gpm="gp master"
alias gpp="gp production"
alias gpsf="gpf staging"
alias gppf="gpf production"
alias gpsf="gpf staging"
