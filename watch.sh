#!/usr/bin/env bash

watchpy() {
    folder="${2:-./}"
    patterns='*.py'
    echo -e "\nStarting \033[1;33mwatchmedo\033[0m for:\n"
    echo -e "\tPatterns: $patterns\n"
    echo -e "\tFolder: $folder\n"
    echo -e "\tCommand: $1\n"
    uv run watchmedo shell-command \
    --patterns=$patterns -W --recursive \
    --command="clear && $1" $folder
}

run_dmypy() {
    echo -e "Starting \033[1;33mmypy\033[0m daemon..."
    uv run dmypy start

    watchpy "dmypy check \${watch_src_path}" $1

    echo -e "\nStopping \033[1;33mmypy\033[0m daemon..."
    uv run dmypy stop
}

alias wmp=run_dmypy
alias wrf='uv run ruff check -w'
