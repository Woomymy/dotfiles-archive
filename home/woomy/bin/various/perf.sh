#!/usr/bin/env bash
POLY="$(pidof polybar)" # Kill polybar
if [[ ! -z "${POLY}" ]]
then
	pkill polybar*
fi
PIC="$(pidof picom)" # Kill compositor
if [[ ! -z "${PIC}" ]]
then
	pkill picom*
fi
FLAM="$(pidof flameshot)" # Flameshot will be slower to restart
if [[ ! -z "${FLAM}" ]]
then
	pkill flameshot*
fi
