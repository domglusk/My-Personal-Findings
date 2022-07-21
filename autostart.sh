#!/bin/sh
#feh --bg-scale /usr/share/endeavouros/backgrounds/endeavouros-wallpaper.png
nitrogen --restore & disown
picom & disown # --experimental-backends --vsync should prevent screen tearing on most setups if needed

# Low battery notifier
~/.config/qtile/scripts/check_battery.sh & disown

# Start welcome
# eos-welcome & disown

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & disown # start polkit agent from LXDE/LXQT

redshift-gtk & disown
steam & disown
discord & disown
spotify & disown
spectacle -b & disown

# lxsession --noautostart -s Qtile -e Qtile & disown

blueman-applet & disown
nm-applet & disown
