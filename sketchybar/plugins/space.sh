#!/bin/sh

if [ "$SELECTED" = true ]; then
  sketchybar --set "$NAME" \
    background.drawing=on \
    background.color=0xffebbcba \
    label.color=0xaa2a273f \
    icon.color=0xaa2a273f
else
  sketchybar --set "$NAME" \
    background.drawing=on \
    background.color=0xaa2a273f \
    label.color=0xffebbcba \
    icon.color=0xffebbcba
fi

