#!/usr/bin/env bash

alias dc=dc_docker_env_func
alias dcb='dc build'
alias dcd='dc down --remove-orphans'
alias dcdbue=down_build_up_exec
alias dcdbul=down_build_up_log
alias dcdr='dcd && dcr'
alias dcdrr='dcd && dcrr'
alias dcdu='dcd && dcu'
alias dcdue='dcd && dcu && dce'
alias dcdul='dcd && dcu && dcl'
alias dce=compose_exec_func
alias dcfu=compose_up_f_d_func
alias dcl='dc logs -f'
alias dcr=compose_run_func
alias dcrr='dc run --rm --service-ports'
alias dcs='dc ps --services'
alias dcsu=restart_func
alias dcu='dc up -d'
alias dcue='dcu && dce'
alias dcul='dcu && dcl'
alias de=docker_exec_func
alias dk='docker kill'
alias dnr='docker rmi -f $(docker images -f dangling=true -q)'
alias dps='docker ps --format "{{.ID}}\t{{.Names}}"'

dc_docker_env_func() {
  if [ $DOCKER_ENV ]; then
    docker compose -f docker-compose-$DOCKER_ENV.yml  $@
  else
    docker compose  $@
  fi
}

restart_func() {
  dc stop $1 && dc up -d $1
}

compose_exec_func() {
  if [ -z $2 ]; then
    dc exec $1 bash
  else
    dc exec $@
  fi
}

docker_exec_func() {
  if [ -z $2 ]; then
    docker exec -ti $1 bash
  else
    docker exec -ti $@
  fi
}

compose_run_func() {
  if [ -z $2 ]; then
    dc run --rm --service-ports $1 bash
  else
    dc run --rm --service-ports $@
  fi
}

compose_up_f_d_func() {
  if [ -z $1 ]; then
    echo 'No argument specified.'
  else
    dc -f $1 up -d
  fi
}

down_build_up_exec() {
  if [ -z $1 ]; then
    echo 'No argument specified.'
  else
    dcd && dcb $1 && dcu && dce $1
  fi
}

down_build_up_log() {
  if [ -z $1 ]; then
    echo 'No argument specified.'
  else
    dcd && dcb $1 && dcu && dcl $1
  fi
}

