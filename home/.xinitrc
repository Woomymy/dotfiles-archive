source /etc/profile
source ~/.profile
xrdb -merge ~/.Xresources
export XDG_SESSION_TYPE=x11

if [[ "$(tty)" != "/dev/tty1" ]]
then
    # Start WIP I3 (testing atm)
    if [[ "${USE_EXP_I3WM}" == "1" ]]
    then
        export DISPLAY=:1
        exec dbus-launch --exit-with-session i3 -c "${HOME}/.config/i3/config.new"
    else
        exec dbus-launch --exit-with-session i3 -c "${HOME}/.config/i3/alacritty.conf"
    fi
else
    exec dbus-launch --exit-with-session i3
fi
