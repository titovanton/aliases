#!/usr/bin/env bash

docker_compose() {
  if [ -f docker-compose.local.yml ]; then
    docker-compose -f docker-compose.local.yml $@
  else
    docker-compose $@
  fi
}

restart_func() {
  docker_compose stop $1 && docker_compose up -d $1
}

compose_exec_func() {
  if [ -z $2 ]; then
    docker_compose exec $1 bash
  else
    docker_compose exec $@
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
    docker_compose run --rm --service-ports $1 bash
  else
    docker_compose run --rm --service-ports $@
  fi
}


alias dnr='docker rmi -f $(docker images -f dangling=true -q)'
alias flake='docker run --rm -ti -v $PWD:/app:ro --name=flake titovanton/flake:1.1.1'

alias dc=docker_compose
alias restart=restart_func
alias dce=compose_exec_func
alias dcr=compose_run_func
alias de=docker_exec_func

alias dps='docker ps --format "{{.ID}}\t{{.Names}}"'
alias dcs='dc ps --services'
alias dcu='dc up -d'
alias dcd='dc down'
alias dcb='dc build'
alias dcl='dc logs -f'
