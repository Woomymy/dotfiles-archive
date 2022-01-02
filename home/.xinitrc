source /etc/profile
source ~/.profile
xrdb -merge ~/.Xresources
gentoo-pipewire-launcher &
export XDG_SESSION_TYPE=x11
exec dbus-launch --exit-with-session i3

