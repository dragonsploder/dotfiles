#!/bin/sh
eval `dbus-launch --sh-syntax --exit-with-session`
light -S 50
setxkbmap -layout us -variant dvorak
/home/dragonsploder/software/repos/dwm-bar/dwm_bar.sh &
pipewire & pipewire-pulse & wireplumber &
fcitx5 &
exec dbus-launch dwm
