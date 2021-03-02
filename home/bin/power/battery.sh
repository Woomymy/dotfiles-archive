#!/usr/bin/env bash
# XFCE-like battery status notifier
# Check requirements
if [[ ! "$(command -v notify-send)" ]] 
then
	echo -e "\e[91mPlease install notify-send!"
	exit 1
fi

BAT="BAT1" # Use ls /sys/class/power_supply/ to find you battery.
SYSFS_PATH="/sys/class/power_supply/${BAT}"
if [[ ! -d "${SYSFS_PATH}" ]]
then
	echo -e "\e[91mDirectory ${SYSFS_PATH} not found!"
	exit 1 
fi
PERCENT=""
CHARGING=""
NCHARGING=""
while :
do
	if [[ "$(cat "${SYSFS_PATH}/status")" == "Discharging" ]] 
	then
		NCHARGING="false"
	else 
		NCHARGING="true"
	fi
	if [[ "${NCHARGING}" != "${CHARGING}" ]];
	then
		if [[ "${NCHARGING}" == "false" ]]
		then
			notify-send -i battery "Batterie" "Chargeur débranché!"
		else 
			notify-send -i battery "Batterie" "Chargeur branché!"
		fi
		CHARGING=${NCHARGING}
	fi
	PERCENT="$(cat "${SYSFS_PATH}/capacity")"
	if [[ ${PERCENT} -le 20 ]];
	then
		if [[ "${ALWARNED}" != "true" ]] 
		then
		notify-send -i battery -u critical "Batterie" "20% de batterie restants!"
		fi
		ALWARNED="true"
	fi
	sleep 15
done
