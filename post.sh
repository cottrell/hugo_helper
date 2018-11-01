#!/bin/sh -e
DIR="$( cd "$( dirname $(realpath "${BASH_SOURCE[0]}") )" && pwd )"
cd $DIR
# POSTDIR=post/$(whoami)
POSTDIR=post
mkdir -p $POSTDIR
if [[ "$1" ]]; then
    filename=$POSTDIR/$1.md
    if [[ -e content/$filename ]]; then
        vi content/$filename
    else
        hugo new $filename
        git add content/$filename
        git status
    fi
    cd -
else
    cd content/$POSTDIR
    vi .
    cd -
fi
cd -
