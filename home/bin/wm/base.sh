#!/usr/bin/env bash
## WM startup script, starts processes,...

STARTUP_TEMPDIR="/tmp/${USER}-i3-startup"

if [[ -d "${STARTUP_TEMPDIR}" ]]
then
	rm -rf "${STARTUP_TEMPDIR}"
fi
mkdir -p "${STARTUP_TEMPDIR}" || exit 1
ERRORS=() # Errors will be written in log file and be notified by dunst

### Start essential processes that doesn't need theming

# Polkit agent name isn't the same on other distros

UNTHEMED=("${HOME}/bin/power/battery.sh" "picom" "/usr/libexec/polkit-mate-authentication-agent-1")

for PROC in ${UNTHEMED[*]}
do
	if [[ "$(command -v "${PROC}")" ]]
	then
		# Using basename is needed for processes like polkit-mate... because it's a path and > will try to write in ${STARTUP_TEMPDIR}/usr/libexec instead of ${PROC}.log
		nohup "${PROC}" &> "${STARTUP_TEMPDIR}/$(basename "${PROC}").log" &  
	else
		ERRORS+=("${PROC} not found!")
	fi
done

for ERR in ${ERRORS[*]}
do
	echo "${ERR}" >> "${STARTUP_TEMPDIR}/errors.log"
done

# Essential setup is done, no we need to execute the "theming"

