#!/usr/bin/env bash
if [[ ! -f "./lib/functions.sh" || ! -f "./lib/copy.sh" || ! -f "./lib/colors.sh" ]]; then
    echo -e "\e[91mError! The functions files aren't present"
    exit 1
fi
source "./lib/functions.sh"
main
