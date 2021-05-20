if [[ "$(tty)" == "/dev/tty1" ]]
then
	echo "Starting X"
	exec nohup startx &> /dev/null &
	clear
	exit
else
	echo "Not starting X server"
fi
