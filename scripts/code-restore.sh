#!/usr/bin/env bash
echo -e "\e[96m[POSTINSTALL] Restoring VSCode extensions..."
[[ "$(command -v code)" ]] && {
    cat home/.config/Code/User/extensions | xargs -n 1 code --install-extension
}