#!/bin/sh

set -abe

(
    cd "$(dirname $0)"
    diff \
        --show-c-function \
        --new-file \
        --recursive \
        original/ \
        updated/ \
    | patch \
        --directory=current/ \
        --strip=1 \
        --merge \
        --no-backup-if-mismatch
)
