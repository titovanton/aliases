#!/usr/bin/env bash

alias dnr='docker rmi -f $(docker images -f dangling=true -q)'

alias lazydocker='docker run --rm -it --name=lazydocker -v /var/run/docker.sock:/var/run/docker.sock:ro lazyteam/lazydocker'
alias flake='docker run --rm -ti -v $PWD:/app:ro --name=flake titovanton/flake:1.1'
alias ctop="docker run --rm -ti --name=ctop --volume /var/run/docker.sock:/var/run/docker.sock:ro quay.io/vektorlab/ctop:latest"

alias dc='docker-compose'
alias dps='docker ps --format "{{.ID}}\t{{.Names}}"'
alias dcs='docker-compose ps --services'
alias dcu='docker-compose up -d'
alias dcd='docker-compose down'
alias dcb='docker-compose build'
alias dcl='docker-compose logs -f'

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

alias restart=restart_func
alias dce=compose_exec_func
alias dcr=compose_run_func
alias de=docker_exec_func
