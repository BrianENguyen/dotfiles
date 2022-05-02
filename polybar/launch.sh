#!/usr/bin/env sh

# More info : https://github.com/jaagr/polybar/wiki

# Install the following applications for polybar and icons in polybar if you are on ArcoLinuxD
# awesome-terminal-fonts
# Tip : There are other interesting fonts that provide icons like nerd-fonts-complete
# --log=error
# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

desktop=$(echo $DESKTOP_SESSION)
count=$(xrandr --query | grep " connected" | cut -d" " -f1 | wc -l)


case $desktop in

    i3|/usr/share/xsessions/i3)
    if type "xrandr" > /dev/null; then
      for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar --reload mainbar-i3 -c ~/.config/polybar/config &
      done
    else
    polybar --reload mainbar-i3 -c ~/.config/polybar/config &
    fi
    # second polybar at bottom
    # if type "xrandr" > /dev/null; then
    #   for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    #     MONITOR=$m polybar --reload mainbar-i3-extra -c ~/.config/polybar/config &
    #   done
    # else
    # polybar --reload mainbar-i3-extra -c ~/.config/polybar/config &
    # fi
    ;;

    openbox|/usr/share/xsessions/openbox)
    if type "xrandr" > /dev/null; then
      for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar --reload mainbar-openbox -c ~/.config/polybar/config &
      done
    else
    polybar --reload mainbar-openbox -c ~/.config/polybar/config &
    fi
    # second polybar at bottom
    # if type "xrandr" > /dev/null; then
    #   for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    #     MONITOR=$m polybar --reload mainbar-openbox-extra -c ~/.config/polybar/config &
    #   done
    # else
    # polybar --reload mainbar-openbox-extra -c ~/.config/polybar/config &
    # fi
    ;;

    bspwm|/usr/share/xsessions/bspwm)
    screens=$(xrandr --listactivemonitors | grep -v "Monitors" | cut -d" " -f6)

    if [[ $(xrandr --listactivemonitors | grep -v "Monitors" | cut -d" " -f4 | cut -d"+" -f2- | uniq | wc -l) == 1 ]]; then
      MONITOR=$(polybar --list-monitors | cut -d":" -f1) TRAY_POS=right polybar main &
    else
      primary=$(xrandr --query | grep primary | cut -d" " -f1)
      right=$(xrandr --query | grep DP-1 | cut -d" " -f1)
      for m in $screens; do
        if [[ $primary == $m ]]; then
            MONITOR=$m TRAY_POS=right polybar mainbar-bspwm &
        elif [[ $right == $m ]]; then
            MONITOR=$m TRAY_POS=none polybar mainbar-bspwm-right &
        else
            MONITOR=$m TRAY_POS=none polybar mainbar-bspwm-left &
        fi
      done
    fi
    # if type "xrandr" > /dev/null; then
    #   for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    #     MONITOR=$m polybar --reload mainbar-bspwm -c ~/.config/polybar/config_main &
    #   done
    # else
    # polybar --reload mainbar-bspwm-extra -c ~/.config/polybar/config &
    # fi
    # second polybar at bottom
    # if type "xrandr" > /dev/null; then
    #   for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    #     MONITOR=$m polybar --reload mainbar-bspwm-extra -c ~/.config/polybar/config &
    #   done
    # else
    # polybar --reload mainbar-bspwm-extra -c ~/.config/polybar/config &
    # fi
    ;;

    herbstluftwm|/usr/share/xsessions/herbstluftwm)
    if type "xrandr" > /dev/null; then
      for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar --reload mainbar-herbstluftwm -c ~/.config/polybar/config &
      done
    else
    polybar --reload mainbar-herbstluftwm -c ~/.config/polybar/config &
    fi
    # second polybar at bottom
    # if type "xrandr" > /dev/null; then
    #   for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    #     MONITOR=$m polybar --reload mainbar-herbstluftwm-extra -c ~/.config/polybar/config &
    #   done
    # else
    # polybar --reload mainbar-herbstluftwm-extra -c ~/.config/polybar/config &
    # fi
    ;;

    xmonad|/usr/share/xsessions/xmonad)
    if [ $count = 1 ]; then
      m=$(xrandr --query | grep " connected" | cut -d" " -f1)
      MONITOR=$m polybar --reload mainbar-xmonad -c ~/.config/polybar/config &
    else
      for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar --reload mainbar-xmonad -c ~/.config/polybar/config &
      done
    fi
    # second polybar at bottom
    # if [ $count = 1 ]; then
    #   m=$(xrandr --query | grep " connected" | cut -d" " -f1)
    #   MONITOR=$m polybar --reload mainbar-xmonad-extra -c ~/.config/polybar/config &
    # else
    #   for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    #     MONITOR=$m polybar --reload mainbar-xmonad-extra -c ~/.config/polybar/config &
    #   done
    # fi
    ;;

    spectrwm|/usr/share/xsessions/spectrwm)
    if type "xrandr" > /dev/null; then
      for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar --reload mainbar-spectrwm -c ~/.config/polybar/config &
      done
    else
    polybar --reload mainbar-spectrwm -c ~/.config/polybar/config &
    fi
    ;;

    cwm|/usr/share/xsessions/cwm)
    if type "xrandr" > /dev/null; then
      for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar --reload mainbar-cwm -c ~/.config/polybar/config &
      done
    else
    polybar --reload mainbar-cwm -c ~/.config/polybar/config &
    fi

     # second polybar at bottom
     # if type "xrandr" > /dev/null; then
     #  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
     #    MONITOR=$m polybar --reload mainbar-cwm-extra -c ~/.config/polybar/config &
     #  done
     # else
     # polybar --reload mainbar-cwm-extra -c ~/.config/polybar/config &
     # fi

    ;;

    fvwm3|/usr/share/xsessions/fvwm3)
    if type "xrandr" > /dev/null; then
      for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar --reload mainbar-fvwm3 -c ~/.config/polybar/config &
      done
    else
    polybar --reload mainbar-fvwm3 -c ~/.config/polybar/config &
    fi

     # second polybar at bottom
     # if type "xrandr" > /dev/null; then
     #  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
     #    MONITOR=$m polybar --reload mainbar-fvwm3-extra -c ~/.config/polybar/config &
     #  done
     # else
     # polybar --reload mainbar-fvwm3-extra -c ~/.config/polybar/config &
     # fi

    ;;
esac
