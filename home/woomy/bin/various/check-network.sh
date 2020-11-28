#!/usr/bin/env bash

# Thanks to https://github.com/busybox11/spotify-polybar/blob/master/scripts/check-network
count=0
disconnected=""
wireless_connected=""
ethernet_connected=""

ID="$(ip link | awk '/state UP/ {print $2}')"
while true
do 
if (ping -c 1 gentoo.org || ping -c 1 github.com) &>/dev/null; then
        if [[ $ID == e* ]]; then
            echo "$ethernet_connected" ; sleep 25
        else
            echo "$wireless_connected" ; sleep 25
        fi
    else
        echo "$disconnected" ; sleep 1
    fi

done
