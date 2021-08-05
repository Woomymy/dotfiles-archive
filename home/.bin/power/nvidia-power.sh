#!/usr/bin/env bash

# Check if my NVIDIA optimus GPU is on / off

# How it works:
# set $DEVID to NVIDIA GPU id (get it using LSPCI)
# Check /sys/bus/pci/devices/0000:$DEVID/power_state
# If set to D0, card is ON
# else it is OFF (D3cold)

GPU_ICON="閭"

DEVID="$(lspci | grep -i nvidia | awk '{print $1}')"
SYSFS_STATE_FILE="/sys/bus/pci/devices/0000:${DEVID}/power_state"
[[ -f "${SYSFS_STATE_FILE}" ]] || {
	# May also append on older kernels (< 5.10 iirc, to check)
	notify-send -u "critical" "Nvidia power module" "${SYSFS_STATE_FILE} not found, are you sure you have an NVIDIA device ? You may also need to update your kernel."
	exit
}
if [[ "$(cat "${SYSFS_STATE_FILE}")" == "D0" ]]
then
	echo "${GPU_ICON} GPU: ON "
else
	echo "${GPU_ICON} GPU: OFF "
fi

