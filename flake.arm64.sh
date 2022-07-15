#!/usr/bin/env bash

alias flake='id=$(docker ps --filter name=flake --format "{{.ID}}") && \
             if [ ! -z "$id" ]; then docker kill "$id"; fi && \
             docker run --rm -ti -v $PWD:/app:ro --name=flake titovanton/flake:arm64'
