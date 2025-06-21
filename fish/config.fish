fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/sbin
fish_add_path /Users/glocean/.cargo/bin
fish_add_path /Users/glocean/.spicetify

fish_config theme choose "Rosé Pine"

alias neofetch='fastfetch -c neofetch'

neofetch

set -U fish_greeting

starship init fish | source

