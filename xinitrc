setxkbmap dvorak,us -option grp:shifts_toggle
light -S 50
xinput disable 12
xinput disable 13 
unclutter -idle 0 &
#xautolock -time 10 -locker slock &
~/software/repos/dwm-bar/dwm_bar.sh &
exec dbus-launch --exit-with-session dwm
