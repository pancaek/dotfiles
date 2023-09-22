#!/bin/bash
max_volume_pc=$1


volume_percent=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\/ (\d+)%' | cut -d' ' -f2 | head -n 1 )
vol=${volume_percent}
echo $vol
