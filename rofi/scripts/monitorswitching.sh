#!/bin/sh
 
case "$1" in
    DP) xrandr --output eDP1 --primary --mode 1920x1080 --rate 60.00 --output HDMI1 --off --output DP1-1 --off && nitrogen --restore;;
    HDMI) xrandr --output HDMI1 --primary --mode 1920x1080 --rate 180.00 --output eDP1 --off --output DP1-1 --off && nitrogen --restore;; 
    DUAL) xrandr --output eDP1 --mode 1920x1080 --rate 60.00 --output HDMI1 --primary --mode 1920x1080 --rate 180.00 --left-of eDP1 --output DP1-1 --off && nitrogen --restore;; 
    TRIPLE) xrandr --output eDP1 --mode 1920x1080 --rate 60.00 --output HDMI1 --primary --mode 1920x1080 --rate 165.00 --right-of eDP1 --output DP1-1 --mode 1920x1080 --rate 120.00 --right-of HDMI1 && nitrogen --restore;;
    *) printf '%s\n' "You must provide an argument: DP, HDMI, DUAL, TRIPLE..." ;;
esac
