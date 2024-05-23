#!/bin/sh

set -abe

RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
NC=$(tput sgr0)

(
    cd "$(dirname $0)"
    if diff \
        --show-c-function \
        --new-file \
        --recursive \
        simple-component/ \
        complex-component/ \
    | patch \
        --directory=current/ \
        --strip=1 \
        --merge \
        --forward \
        --force \
        --no-backup-if-mismatch \
    ; then
        echo "${GREEN}Success!${NC}"
    else
        echo "${RED}Error!${NC} Partially applied. Manually resolve issues in the output above."
    fi
)
