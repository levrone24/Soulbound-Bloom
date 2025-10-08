#!/bin/bash
if pgrep -x "kitty" > /dev/null; then
  pkill kitty
else
  kitty --class floating-info -e bash -c "echo 'Wifi'; echo 'Bluetooth'; read"
fi
