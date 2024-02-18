#!/usr/bin/env bash

ALIASES=$1

echo $ALIASES

cd $ALIASES/enabled

ln -s $ALIASES/border.sh
ln -s $ALIASES/docker.sh
ln -s $ALIASES/git.sh
ln -s $ALIASES/grep.sh
ln -s $ALIASES/ls.sh
ln -s $ALIASES/sudo.sh
