#!/bin/sh -e
DIR="$( cd "$( dirname $(realpath "${BASH_SOURCE[0]}") )" && pwd )"
cd $DIR
# POSTDIR=post/$(whoami)
# mkdir -p content/$(whoami)
POSTDIR=post
mkdir -p content/$POSTDIR
[[ "$EDITOR" ]] || EDITOR=vim
if [[ "$1" ]]; then
    filename=$POSTDIR/$1.md
    indexfilename=content/$POSTDIR/$1/index.md
    if [[ -e content/$filename ]]; then
        $EDITOR content/$filename
    elif [[ -e  $indexfilename ]]; then
        $EDITOR $indexfilename
    else
        hugo new $filename
        $EDITOR content/$filename
        git add content/$filename
        git status
    fi
    cd -
else
    cd content/$POSTDIR
    $EDITOR .
    cd -
fi
cd -
