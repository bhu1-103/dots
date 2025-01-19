#!/usr/bin/zsh

if pacman -Q bspwm &>/dev/null; then
    echo "bspwm found"
    cp -r dotfiles/bspwm ~/.config/bspwm
    cp -r dotfiles/sxhkd ~/.config/sxhkd
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

echo "rice done"
