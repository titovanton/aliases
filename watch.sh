#!/usr/bin/env bash

watchpy() {
    folder="${2:-./}"
    patterns='*.py'
    command="
        [ \"\$watch_event_type\" = \"modified\" ]\
        && clear\
        && $1;
    "
    echo -e "\nStarting \033[1;33mwatchmedo\033[0m for:\n"
    echo -e "\tPatterns: $patterns\n"
    echo -e "\tFolder: $folder\n"
    echo -e "\tCommand: $1\n"
    uv run watchmedo shell-command \
    --patterns=$patterns \
    -W \
    --recursive \
    --ignore-directories \
    --command=$command \
    $folder
}

run_dmypy() {
    # dmypy  is unstable yet

    echo -e "Starting \033[1;33mmypy\033[0m daemon..."
    uv run dmypy start

    watchpy "dmypy check \${watch_src_path}" $1

    echo -e "\nStopping \033[1;33mmypy\033[0m daemon..."
    uv run dmypy stop
}

run_mypy() {
    watchpy "mypy \${watch_src_path}" $1
}

run_ruff() {
    watchpy "ruff check \${watch_src_path}" $1
}

alias wmp=run_mypy
# alias wrf='uv run ruff check -w'
alias wrf=run_ruff
