#!/bin/sh
#feh --bg-scale /usr/share/endeavouros/backgrounds/endeavouros-wallpaper.png
#nvidia-settings --load-config-only & disown
nitrogen --restore & disown
picom --vsync --experimental-backends & disown
#tint2 & disown
#xcompmgr & disown

#sudo system76-power daemon & disown
#dunst & disown
# Low battery notifier
~/.config/qtile/scripts/check_battery.sh & disown

# Start welcome
# eos-welcome & disown

/usr/bin/lxpolkit & disown # start polkit agent from LXDE/LXQT
/usr/lib/xfce4/notifyd/xfce4-notifyd & disown
#redshift-gtk & disown
#steam & disown
#discord & disown
#spotify  & disown

lxsession -s=Qtile -a & disown
#xfce4-session & disown

blueman-applet & disown
nm-applet & disown
#mullvad-vpn & disown
#cbatticon & disown
#volumeicon & disown
#prime-offload & disown
#optimus-manager-qt & disown
