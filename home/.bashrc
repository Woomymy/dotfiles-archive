if [[ "$(tty)" == "/dev/tty1" ]]
then
	echo "Starting X"
	startx
else
	echo "Not starting X server"
fi
. "$HOME/.cargo/env"
