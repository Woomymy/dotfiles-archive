source /etc/profile
xrdb -merge ~/.Xresources
exec dbus-launch --exit-with-session i3
