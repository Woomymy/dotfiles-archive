#!/usr/bin/env bash

STATE="$(synclient -l | grep -i TouchpadOff | awk -F "= " '{print $2}')"
if [[ "${STATE}" == "0" ]];
then
	synclient TouchpadOff=1
else
	synclient TouchpadOff=0
fi
