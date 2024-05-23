#!/bin/sh

set -abe

(
    cd "$(dirname $0)"
    rsync \
        --recursive \
        --dirs \
        --delete \
        complex-component/ \
        current/
)
