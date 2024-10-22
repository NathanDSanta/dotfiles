#!/bin/bash

xrandr --output eDP-1 --primary --mode 1920x1080 --rate 60.00

nitrogen --restore &

picom --daemon &

clipster -d &

nm-applet &

udiskie -t &

pamixer -m &
