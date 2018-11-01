#!/bin/sh -e
DIR="$( cd "$( dirname $(realpath "${BASH_SOURCE[0]}") )" && pwd )"
cd $DIR
hugo server --buildDrafts -w --forceSyncStatic $@
cd -
