#!/bin/sh

set -abe

(
    cd "$(dirname $0)"
    rsync \
        --recursive \
        --dirs \
        --delete \
        "templates/$1/" \
        current/
    (
        cd "templates/$1"
        tar \
            --create \
            --xz \
            --file ../../current/.template.tar.xz \
            --transform "s:^$1/?::" \
            -- *
    )
)
