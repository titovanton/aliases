#! /bin/bash

gl() {
  if [ -z $1 ]; then
    num=-10
  else
    num=$1
  fi

  git --no-pager log $num \
    --date=format-local:"%Y.%m.%d %I:%M %p" \
    --pretty="format:%Cred %h %Cgreen %an %Creset %cd %Cgreen %s %Creset" \
    $2
}

_gls() {
  if [ -z $1 ]; then
    num=-10
  else
    num=$1
  fi

  git --no-pager log --stat \
    $num \
    --date=format-local:"%Y.%m.%d %I:%M %p" \
    --pretty="format:%Cred %h %Cgreen %an %Creset %cd %Cgreen %s %Creset" \
    $2
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
alias gls="_gls"
alias gpm="gp master"
alias gpp="gp production"
alias gpsf="gpf staging"
alias gppf="gpf production"
alias gpsf="gpf staging"
