#!/bin/sh

set -abe

(
    cd "$(dirname $0)"
    rsync \
        --recursive \
        --dirs \
        --delete \
        original/ \
        current/
)
