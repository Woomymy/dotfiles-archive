#!/usr/bin/env bash

PLAYER="tdesktop"

meta_get() {
    playerctl -p "${PLAYER}" metadata --format "{{ ${1} }}" 2>/dev/null
}

playerctl --follow -p "${PLAYER}" metadata --format "{{ title }}" 2>/dev/null | while read _; do
    ART="$(meta_get "mpris:artUrl")"
    TEMP_ART=""
    if [[ "${ART}" =~ ^data:image/.*\;base64,.*$ ]]; then
        TEMP_ART="$(mktemp)"
        # Get album base64 art
        # Remove "base64" suffix
        echo "${ART}" | cut -d "," -f "2-" | base64 -d >"${TEMP_ART}"
    fi

    TITLE="$(meta_get "title")"
    [[ -z "${TITLE}" ]] && continue # Skip if there is not title

    ARTIST="$(meta_get "artist")"
    DURATION="$(meta_get "duration(mpris:length)")"

    if [[ -f "${TEMP_ART}" ]]; then
        dunstify -u low -I "${TEMP_ART}" "Playing" "${ARTIST} - ${TITLE} (${DURATION})"
    else
        dunstify -u low "Playing" "${ARTIST} - ${TITLE} (${DURATION})"
    fi
    [[ -f "${TEMP_ART}" ]] && rm "${TEMP_ART}"

done
