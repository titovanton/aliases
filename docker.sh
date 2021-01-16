#!/usr/bin/env bash

alias dnr='docker rmi -f $(docker images -f dangling=true -q)'

alias lazydocker='docker run --rm -it --name=lazydocker -v /var/run/docker.sock:/var/run/docker.sock:ro lazyteam/lazydocker'
alias flake='docker run --rm -ti -v $PWD:/app:ro --name=flake titovanton/flake:1.1'
alias ctop="docker run --rm -ti --name=ctop --volume /var/run/docker.sock:/var/run/docker.sock:ro quay.io/vektorlab/ctop:latest"

alias dc='docker-compose'
alias dps='docker ps --format "{{.ID}}\t{{.Names}}"'

restart_func() {
  dc stop $1 && dc up -d $1
}

alias restart=restart_func
