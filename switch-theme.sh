#!/bin/bash
# switch-theme.sh — called by dark-notify on appearance change, or manually with "dark"/"light"

CONFIG="$HOME/.config"

export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"

MODE="${1:-}"
if [ -z "$MODE" ]; then
    if defaults read -g AppleInterfaceStyle 2>/dev/null | grep -qi dark; then
        MODE="dark"
    else
        MODE="light"
    fi
fi

case "$MODE" in
    dark)
        # Sketchybar
        cp "$CONFIG/sketchybar/colors-dark.sh" "$CONFIG/sketchybar/colors.sh"
        sketchybar --reload

        # Starship
        sed -i '' 's/^palette = .*/palette = "rose-pine"/' "$CONFIG/starship.toml"

        # Fish
        fish "$CONFIG/fish/set-dark-theme.fish" 2>/dev/null

        # JankyBorders
        sed -i '' 's/^borders active_color=.*/borders active_color=0xffc4a7e7 inactive_color=0xff6e6a86 width=5.0 hidpi=on/' "$CONFIG/yabai/yabairc"
        pkill -x borders 2>/dev/null; sleep 0.2
        nohup /opt/homebrew/bin/borders active_color=0xffc4a7e7 inactive_color=0xff6e6a86 width=5.0 hidpi=on >/dev/null 2>&1 &
        ;;

    light)
        # Sketchybar
        cp "$CONFIG/sketchybar/colors-dawn.sh" "$CONFIG/sketchybar/colors.sh"
        sketchybar --reload

        # Starship
        sed -i '' 's/^palette = .*/palette = "rose-pine-dawn"/' "$CONFIG/starship.toml"

        # Fish
        fish "$CONFIG/fish/set-light-theme.fish" 2>/dev/null

        # JankyBorders
        sed -i '' 's/^borders active_color=.*/borders active_color=0xff575279 inactive_color=0xff9893a5 width=5.0 hidpi=on/' "$CONFIG/yabai/yabairc"
        pkill -x borders 2>/dev/null; sleep 0.2
        nohup /opt/homebrew/bin/borders active_color=0xff575279 inactive_color=0xff9893a5 width=5.0 hidpi=on >/dev/null 2>&1 &
        ;;
esac
