#!/usr/bin/env bash

status=$(playerctl --player=spotify status 2>/dev/null)

[ -z "$status" ] && echo ""

artist=$(playerctl --player=spotify metadata artist 2>/dev/null)
title=$(playerctl --player=spotify metadata title 2>/dev/null)

[ -z "$artist" ] && artist="Unknown"
[ -z "$title" ] && title="Unknown"

echo "%{F#A6E3A1}󰓇%{F-} %{F#FFC5D3}${artist}%{F-} - %{F#89B4F4}${title}%{F-}"
