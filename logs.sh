#!/usr/bin/env bash

get_tail_pid() {
  ps ax | grep tail | grep -v grep | awk '{print $1}'
}

alias logs='id=$(get_tail_pid) && \
            if [ ! -z "$id" ]; then kill "$id"; fi && \
            tail -f ./logs.txt'
