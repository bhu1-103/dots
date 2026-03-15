#!/usr/bin/zsh

if pacman -Q bspwm &>/dev/null; then
    echo "bspwm found"
    cp -r dotfiles/bspwm/bspwmrc ~/.config/bspwm
    cp -r dotfiles/bspwm/sxhkdrc ~/.config/sxhkd
fi

if pacman -Q hyprland-git &>/dev/null; then
    echo "hyprland-git found"
    cp -r dotfiles/hypr ~/.config/hypr
fi

if pacman -Q i3-wm &>/dev/null; then
    echo "i3-wm found"
    cp -r dotfiles/i3 ~/.config/i3
fi

if pacman -Q polybar &>/dev/null; then
    echo "polybar found"
    cp -r dotfiles/polybar ~/.config/polybar
fi

echo "alias guitarix='PIPEWIRE_LATENCY=64/48000 pw-jack guitarix'" >> ~/.zshrc

echo "rice done"
