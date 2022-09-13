#!/usr/bin/env bash

dc_docker_env_func() {
  if [ $DOCKER_ENV ]; then
    docker compose -f docker-compose-$DOCKER_ENV.yml  $@
  else
    docker compose  $@
  fi
}

alias dc=dc_docker_env_func

alias dps='docker ps --format "{{.ID}}\t{{.Names}}"'
alias dcs='dc ps --services'
alias dcu='dc up -d'
alias dcd='dc down --remove-orphans'
alias dcb='dc build'
alias dcl='dc logs -f'
alias dk='docker kill'

alias dnr='docker rmi -f $(docker images -f dangling=true -q)'

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

alias restart=restart_func
alias dce=compose_exec_func
alias dcr=compose_run_func
alias dcrr='dc run --rm --service-ports'
alias de=docker_exec_func
alias dcfu=compose_up_f_d_func
alias dcdu='dcd && dcu'
alias dcue='dcu && dce'
alias dcdue='dcd && dcu && dce'
alias dcdr='dcd && dcr'
alias dcdrr='dcd && dcrr'
