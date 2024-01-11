#!/bin/bash
export XDG_RUNTIME_DIR="/tmp/xdg/$(id -u)"
mkdir -p $XDG_RUNTIME_DIR

export $(dbus-launch)
export LANG="en_US.UTF-8"

mon_num=$(xrandr | grep connected | grep -v dis | wc -l);

if [ "$mon_num" -eq "2" ]; then
	xrandr --output HDMI-A-0 --left-of eDP
fi

xrandr --dpi 96

xcompmgr &
# picom --vsync --window-shader-fg ~/.config/picom/shader.fs --backend glx &

xwallpaper --zoom $HOME/wallpapers/wallpaper.png

mixerctl outputs.master=0 &

exec dwm
