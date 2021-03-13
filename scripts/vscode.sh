#!/usr/bin/env bash
ROOT=$1
[[ -z "${ROOT}" ]] && ROOT="."
echo -e "\e[96m[POSTSAVE] Saving VScode extensions\e[m" # Follow kelpdot style for messages
[ "$(command -v code)" ] || {
    echo -e "\e[91mError: VSCode not found!\e[m"
    exit 1
}
code --list-extensions > "${ROOT}/home/.config/Code/User/extensions" # Backup the extensions list
