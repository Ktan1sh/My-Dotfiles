#!/usr/bin/env bash

# Check if Bluetooth is powered
powered=$(bluetoothctl show 2>/dev/null | grep -i "Powered:" | awk '{print $2}')

if [ "$powered" != "yes" ]; then
  echo "BT: Off"
  exit 0
fi

# Check if any device is connected
connected=$(bluetoothctl list-devices 2>/dev/null | grep -i "Connected:" | awk '{print $2}' | grep -i "yes")

if [ -n "$connected" ]; then
  echo "BT: Connected"
else
  echo "BT: On"
fi
