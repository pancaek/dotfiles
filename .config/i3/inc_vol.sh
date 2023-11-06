#!/bin/bash
max_volume_pc=$1
interval=$2


current_volume_pc=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+(?=%)' | head -n 1 )

if (($current_volume_pc < $max_volume_pc-$interval)) ; then
    pactl set-sink-volume @DEFAULT_SINK@ +$interval%
else
    a=$(($max_volume_pc - $current_volume_pc))
    pactl set-sink-volume @DEFAULT_SINK@ +$a%
fi

