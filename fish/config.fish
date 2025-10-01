fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/sbin

# make sure to install the theme first, which can be done done with fisher: fisher install Arpitpandey992/fish-everforest
fish_config theme choose "Everforest"

alias neofetch='fastfetch -c neofetch'

neofetch

set -U fish_greeting

starship init fish | source
