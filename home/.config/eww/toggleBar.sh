#!/usr/bin/env bash

WINDOW_NAME="bar"

is_open() {
    eww windows | grep -q "*${WINDOW_NAME}" # Check if the window is openned
}

echo "$(which eww)" >> /tmp/path

if is_open; then
    eww close "${WINDOW_NAME}"
else
    eww open "${WINDOW_NAME}"
    sleep 10
    eww close "${WINDOW_NAME}"
fi

