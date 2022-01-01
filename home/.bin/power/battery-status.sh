#!/usr/bin/env bash
# Get battery status

set -euo pipefail

BATTERY="$(jq -r .battery "${HOME}/.bin/config.json")"
BATTERY_CHARGE="$(cat /sys/class/power_supply/${BATTERY}/capacity)"

CAPACITY_ICON=""

case "$((( BATTERY_CHARGE / 25 )))" in
    0)
	    CAPACITY_ICON=" " # Battery will dead soon
	;;
    1)
	    CAPACITY_ICON=""
	;;
    2)
    	    CAPACITY_ICON=""
	;;
    3)
	    CAPACITY_ICON=""
	;;
    4)
    	    CAPACITY_ICON=""
	;;
    *)
	    CAPACITY_ICON="FFS" # I'm not even sure this can append    
	;;
esac

echo "${CAPACITY_ICON} : ${BATTERY_CHARGE}%"
