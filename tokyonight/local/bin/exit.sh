#!/bin/sh
swaynag \
    -t custom \
    -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' \
    -b 'Yes, exit sway' 'swaymsg exit'
