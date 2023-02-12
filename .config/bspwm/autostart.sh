#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

#change your keyboard if you need it
#setxkbmap -layout be

dex $HOME/.config/autostart/arcolinux-welcome-app.desktop
xsetroot -cursor_name left_ptr &
run sxhkd -c ~/.config/bspwm/sxhkd/sxhkdrc &
run nm-applet &
run pamac-tray &
numlockx on &
blueberry-tray &
picom --experimental-backends --config $HOME/.config/picom/picom.conf &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
/usr/lib/xfce4/notifyd/xfce4-notifyd &
run volumeicon &

Hyprland
#emojione-picker
redshift -x
redshift -O 4000
#ckb-next
dunst &
emacsclient -e '(kill-emacs)'
/usr/bin/emacs --daemon

xrandr --output DVI-D-0 --mode 1920x1080 --pos 0x0 --rotate left --output HDMI-0 --primary --mode 1920x1080 --pos 1080x420 --rotate normal --output DP-0 --off --output DP-1 --mode 1920x1080 --pos 3000x420 --rotate normal

