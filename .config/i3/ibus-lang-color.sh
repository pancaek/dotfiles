#!/bin/bash
gsettings set org.freedesktop.ibus.panel xkb-icon-rgba "$(xrdb -query | grep -oP "(?<=${1}:)[\s\S]*" | head -n 1 | awk '{$1=$1};1')"
