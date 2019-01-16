#!/bin/bash

echo "=== GIT STATUS ==="
git status
echo

read -p "Do you want to publish these changes (Y/n)? " -n 1 -r
echo

if [[ $REPLY ]] && [[ ! $REPLY =~ ^[Yy]$ ]]
then
    [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1 # handle exits from shell or function but don't exit interactive shell
fi

message="not"

if [[ $# -gt 0 ]]
then
		message="$1"
else
		message="auto update"
fi

hugo
git add --all
git commit -a -m "auto update"
git push

