# Welcome to my home!

<img src="https://github.com/gloceansh/dotfiles/blob/main/assets/desktop.png?raw=true" alt="Desktop" align="right" width="400px">

This is my personal collection of dotfiles for my macOS setup, which is focused on a minimal, elegant, keyboard-driven workflow.

Here’s an overview of my current setup:

- **Operating System**: [macOS Tahoe](https://www.apple.com/os/macos/)
- **Window Manager**: [yabai](https://github.com/koekeishiya/yabai)
- **App Borders**: [JankyBorders](https://github.com/FelixKratz/JankyBorders)
- **Hotkeys**: [skhd](https://github.com/koekeishiya/skhd)
- **Status Bar**: [Sketchybar](https://github.com/FelixKratz/SketchyBar)
- **Terminal**: [ghostty](https://github.com/mitchellh/ghostty)
- **Shell**: [fish](https://fishshell.com/)
- **Prompt**: [starship](https://starship.rs/)
- **Resource Monitor**: [btop](https://github.com/aristocratos/btop)

After using Linux for the past few years, I was surprised by how limited macOS felt out of the box, especially when it came to window management. This setup aims to address those shortcomings, by creating an environment similar to Sway or Hyprland. If you're coming from another tiling window manager, you'll feel right at home with these dotfiles.

## Details

### Color Scheme

The main color scheme of my setup is [Rosé Pine](https://rosepinetheme.com/), a minimal yet elegant theme that is easy on the eyes. I have included matching wallpapers in the `assets/` directory.

<img src="https://github.com/user-attachments/assets/72adc1ee-21c0-4102-afd8-c52f34ff54ba" alt="Rose Pine" width="600px">

### Sketchybar Weather

For the sketchybar weather plugin to work properly, you have to create an account and get an API key from [OpenWeather](https://openweathermap.org/api). After signing up, go grab your API key [here](https://home.openweathermap.org/api_keys) and paste it into `~/.config/sketchybar/sketchybar_env`.

> [!NOTE]
> After creating your account, your API key might not work right away. Wait about 20-30 minutes for it to activate.

### Fonts

- **System/Interface Font**: [SF Pro](https://developer.apple.com/fonts/)
- **Monospace Font**: [Jetbrains Mono Nerd](https://www.programmingfonts.org/#jetbrainsmono)

Additionally, my sketchybar config uses [sketchybar-app-font](https://github.com/kvndrsslr/sketchybar-app-font) for the app icons on the left of the bar, and [SF Symbols](https://developer.apple.com/sf-symbols/) for the icons on the right.

### Keyboard Shortcuts

I highly suggest binding `capslock` to `control + option + command` using [Karabiner-Elements](https://karabiner-elements.pqrs.org/), since that combination of keys is used as the modifier key for my yabai/skhd config. After installing, go to Complex Modifications -> Add Your Own rule -> And paste the following:
```
{
    "description": "Caps lock key -> hyper key without shift (⌘⌥⌃), Escape when tapped",
    "manipulators": [
        {
            "from": {
                "key_code": "caps_lock",
                "modifiers": { "optional": ["any"] }
            },
            "to": [
                {
                    "key_code": "left_command",
                    "modifiers": ["left_option", "left_control"]
                }
            ],
            "to_if_alone": [{ "key_code": "escape" }],
            "type": "basic"
        }
    ]
}
```

On top of that, pressing capslock normally will register it as the `esc` key, which is useful for vim users.

Below is an overview of the most important keyboard shortcuts.

- `capslock + h/j/k/l` - Move focus left/down/up/right
- `shift + capslock + h/j/k/l` - Move window left/down/up/right
- `capslock + 1, 2, 3, ...` - Focus space 1, 2, 3, ...
- `shift + capslock + 1, 2, 3, ...` - Move window to space 1, 2, 3, ... and focus it
- `capslock + q/w` - Focus monitor 1/2
- `shift + capslock + q/w` - Move window to monitor 1/2 and focus it
- `capslock + u/i/o/p` - Resize windows left/down/up/right

For a complete list, please check out the skhd config file.

## Installation

Clone this repository, and move all of the directories to `~/.config`. The wallpapers are in the assets directory.
