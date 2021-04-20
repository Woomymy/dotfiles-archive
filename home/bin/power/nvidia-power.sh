#!/usr/bin/env bash

# Check if my NVIDIA optimus GPU is on / off

# How it works:
# set $DEVID to NVIDIA GPU id (get it using LSPCI)
# Check /sys/bus/pci/devices/0000:$DEVID/power_state
# If set to D0, card is ON
# else it is OFF (D3cold)

GPU_ICON="閭"

DEVID="$(lspci | grep -i nvidia | awk '{print $1}')"
if [[ "$(cat "/sys/bus/pci/devices/0000:${DEVID}/power_state")" == "D0" ]]
then
	echo "${GPU_ICON} GPU: ON "
else
	echo "${GPU_ICON} GPU: OFF "
fi

