#!/usr/bin/env bash

# Start wayland

for ENVFILE in ~/.profile /etc/profile
do
    source "${ENVFILE}"
done

export XDG_SESSION_TYPE="wayland"
export XDG_RUNTIME_DIR="/run/user/$(id -u)"

if ! test -d "${XDG_RUNTIME_DIR}"
then
    mkdir "${XDG_RUNTIME_DIR}"
    chmod 0700 "${XDG_RUNTIME_DIR}"
fi

exec dbus-launch --exit-with-session sway
