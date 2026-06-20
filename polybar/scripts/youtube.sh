#!/usr/bin/env bash

status=$(playerctl status 2>/dev/null)

# Hide only if no MPRIS player is available
[ -z "$status" ] && echo ""

artist=$(playerctl metadata artist 2>/dev/null)

[ -z "$artist" ] && artist="YouTube"


if [ "$status" = "Paused" ]; then
  echo "%{F#FFB5B5}󰗃%{F-} %{F#6C7086}${artist}%{F-}"
else
  echo "%{F#FFB5B5}󰗃%{F-} %{F#89B4F4}${artist}%{F-}"
fi
