#!/bin/sh

set -abe

RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
NC=$(tput sgr0)

(
    cd "$(dirname $0)"

    rm -rf /tmp/gentem-test/
    mkdir /tmp/gentem-test/
    mkdir /tmp/gentem-test/from
    mkdir /tmp/gentem-test/to

    tar \
        --extract \
        --xz \
        --file current/.template.tar.xz \
        --directory "/tmp/gentem-test/from"

    rsync \
        --recursive \
        --dirs \
        --delete \
        "templates/$1/" \
        "/tmp/gentem-test/to"

    if diff \
        --show-c-function \
        --new-file \
        --recursive \
        /tmp/gentem-test/from \
        /tmp/gentem-test/to \
    | patch \
        --directory=current/ \
        --strip=4 \
        --merge \
        --forward \
        --force \
        --no-backup-if-mismatch \
    ; then
        echo "${GREEN}Success!${NC}"
    else
        echo "${RED}Error!${NC} Partially applied. Manually resolve issues in the output above."
    fi

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
