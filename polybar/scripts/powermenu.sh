#!/usr/bin/env bash

chosen=$(printf "Lock\nSleep\nReboot\nPower Off" | dmenu -i -p "Power")

case "$chosen" in
  "Lock")
    betterlockscreen -l blur
    ;;
  "Sleep")
    systemctl suspend
    ;;
  "Reboot")
    systemctl reboot
    ;;
  "Power Off")
    systemctl poweroff
    ;;
  *)
    exit 0
    ;;
esac
