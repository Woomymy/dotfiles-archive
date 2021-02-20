#!/usr/bin/env bash
echo -e "\e[96m[POSTSAVE] Saving VScode extensions\e[m" # Follow kelpdot style for messages
[ "$(command -v code)" ] || {
    echo -e "\e[91mError: VSCode not found!\e[m"
    exit 1
}
code --list-extensions > ./home/.config/Code/extensions # Backup the extensions list
