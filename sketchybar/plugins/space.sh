#!/bin/sh

source "$CONFIG_DIR/colors.sh"

if [ "$SELECTED" = true ]; then
  sketchybar --animate tanh 10 --set "$NAME" \
    background.drawing=on \
    background.color="$COLOR_SPACE_SEL_BG" \
    label.color="$COLOR_SPACE_SEL_FG" \
    icon.color="$COLOR_SPACE_SEL_FG"
else
  sketchybar --animate tanh 10 --set "$NAME" \
    background.drawing=on \
    background.color="$COLOR_SPACE_UNSEL_BG" \
    label.color="$COLOR_SPACE_UNSEL_FG" \
    icon.color="$COLOR_SPACE_UNSEL_FG"
fi
