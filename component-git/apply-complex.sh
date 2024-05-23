#!/bin/sh

set -abe

RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
NC=$(tput sgr0)

(
    cd "$(dirname $0)"
    if git diff \
        --no-index \
        --patch \
        simple-component/ \
        complex-component/ \
    | git apply \
        --directory=current/ \
        --3way \
        -p2 \
        - \
    ; then
        echo "${GREEN}Success!${NC}"
    else
        echo "${RED}Error!${NC} Partially applied. Manually resolve issues in the output above."
    fi
)
