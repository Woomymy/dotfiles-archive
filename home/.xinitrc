source /etc/profile
source ~/.profile
xrdb -merge ~/.Xresources
pipewire &
sleep 0.2
wireplumber &
exec i3

