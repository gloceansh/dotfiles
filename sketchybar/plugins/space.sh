#!/bin/sh

if [ "$SELECTED" = true ]; then
  sketchybar --set "$NAME" \
    background.drawing=on \
    background.color=0xffA7C080 \
    label.color=0xaa343F44 \
    icon.color=0xaa343F44
else
  sketchybar --set "$NAME" \
    background.drawing=on \
    background.color=0xaa343F44 \
    label.color=0xffA7C080 \
    icon.color=0xffA7C080
fi
