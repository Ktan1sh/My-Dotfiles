#!/usr/bin/env bash
set -euo pipefail

STEP="${STEP:-5%}"
ICON_OFF="󰃝"
ICON_LOW="󰃞"
ICON_MED="󰃟"
ICON_HIGH="󰃠"

COLOR_ICON="${COLOR_ICON:-#A6ADC8}"
COLOR_LOW="${COLOR_LOW:-#FFB5B5}"
COLOR_MED="${COLOR_MED:-#FEF0C7}"
COLOR_HIGH="${COLOR_HIGH:-#A6E3A1}"
COLOR_TEXT="${COLOR_TEXT:-#CDD6F4}"

get_pct() {
  local cur max
  cur=$(brightnessctl get)
  max=$(brightnessctl max)
  printf '%s\n' $(( (cur * 100 + max / 2) / max ))
}

pick_icon() {
  local pct="$1"
  if (( pct <= 0 )); then
    printf '%s' "$ICON_OFF"
  elif (( pct < 35 )); then
    printf '%s' "$ICON_LOW"
  elif (( pct < 70 )); then
    printf '%s' "$ICON_MED"
  else
    printf '%s' "$ICON_HIGH"
  fi
}

pick_text_color() {
  local pct="$1"
  if (( pct < 25 )); then
    printf '%s' "$COLOR_LOW"
  elif (( pct < 60 )); then
    printf '%s' "$COLOR_MED"
  else
    printf '%s' "$COLOR_HIGH"
  fi
}

notify_change() {
  command -v notify-send >/dev/null 2>&1 || return 0
  local pct="$1"
  notify-send -h int:value:"$pct" -a "brightness" "Brightness" "${pct}%"
}

print_output() {
  local pct icon text_color
  pct=$(get_pct)
  icon=$(pick_icon "$pct")
  text_color=$(pick_text_color "$pct")
  printf '%%{F%s}%s%%{F-} %%{F%s}%s%%%%{F-}\n' "$COLOR_ICON" "$icon" "$text_color" "$pct"
}

case "${1:-print}" in
  print)
    print_output
    ;;
  up)
    brightnessctl set "+${STEP}"
    pct=$(get_pct)
    notify_change "$pct"
    ;;
  down)
    brightnessctl set "${STEP}-"
    pct=$(get_pct)
    notify_change "$pct"
    ;;
  set)
    target="${2:?usage: $0 set <value%>}"
    brightnessctl set "$target"
    pct=$(get_pct)
    notify_change "$pct"
    ;;
  watch)
    last=""
    while :; do
      now=$(print_output)
      if [[ "$now" != "$last" ]]; then
        printf '%s\n' "$now"
        last="$now"
      fi
      sleep 0.2
    done
    ;;
  *)
    echo "usage: $0 [print|up|down|set <value%>|watch]" >&2
    exit 1
    ;;
esac
EOF

