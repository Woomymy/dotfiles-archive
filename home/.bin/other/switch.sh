#!/usr/bin/env bash

# Fusee launcher path
FL_PATH="${HOME}/Switch/fusee-launcher.py"
# Payload path (hekate is recommanded)
PL_PATH="${HOME}/Switch/hekate.bin"

# Ensure fusee-launcher and hekate payloads exist
if [ ! -f "${FL_PATH}" ]
then
    notify-send -u "critical" "Switch.sh" "fusee-launcher not found!"
fi

if [ ! -f "${PL_PATH}" ]
then
    notify-send -u "critical" "Switch.sh" "Payload $(basename "${PL_PATH}") not found!"
fi

while :
do

    # Try to inject payload (automatically done if switch is in RCM mode)
    "${FL_PATH}" "${PL_PATH}"
    SEND_CODE="${?}"
    case "${SEND_CODE}" in
        "0")
            notify-send -i joystick "Switch.sh" "Successfully sent $(basename "${PL_PATH}") payload to switch"
        ;;
        "255")
            echo "Device not found!"
        ;;
        "1")
            notify-send -i joystick "Switch.sh" "Failed to send ${PL_PATH} to switch!"
        ;;
        *)
            echo "${FL_PATH} return code ${SEND_CODE}"
        ;;
    esac
    # Sleep
    sleep 5
done

