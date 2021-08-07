source /etc/profile
source ~/.profile
xrdb -merge ~/.Xresources
pipewire &
exec i3
