# Quickstart

    hugo new site mysite
    cp post.sh serve.sh mysite
    cd mysite
    git init
    git add .
    ./post.sh firstpost
    echo "something here" >> content/post/firstpost.md
    cd themes && git submodule add https://github.com/pdevty/polymer.git && git submodule update --init && cd -
    ./serve.sh -t polymer


