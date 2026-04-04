#!/bin/bash

# CachyOS setup script - Install yay, flatpak, and apps

set -e  # Exit on error

echo "=== CachyOS Setup Script ==="
echo ""

# Update system
echo "Updating system packages..."
sudo pacman -Syu --noconfirm

# Install yay (already in CachyOS repos)
echo "Installing yay..."
sudo pacman -S --noconfirm yay

# Install flatpak (already in CachyOS repos)
echo "Installing flatpak..."
sudo pacman -S --noconfirm flatpak

# Add Flathub repository
echo "Adding Flathub repository..."
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

PACMAN_APPS=(
    "awww"
    "zen-browser-bin"
    "gvfs"
    "gwenview"
    "hyprlock"
    "hypridle"
    "hyprpicker"
    "kio-admin"
    "neovim"
    "npm"
    "rofi"
    "spotify-launcher"
    "swaync"
    "ttf-jetbrains-mono-nerd"
    "ts-node" #? also installs typescript
    "waybar"

    "kvantum"
    "kvantum-qt5"
    "qt5ct"
    "qt6ct"
    "otf-font-awesome"
    "archlinux-xdg-menu"
)

# Install pacman apps
echo "Installing pacman applications..."
for app in "${PACMAN_APPS[@]}"; do
    echo "Installing $app..."
    sudo pacman -S --noconfirm "$app"
done


YAY_APPS=(
    "blueberry"
    "github-desktop-bin"
    "nmgui"
    "snappy-switcher"
    "vicinae-bin"
    "visual-studio-code-bin"
    "waybar-module-pacman-updates-git"
)

# Install yay apps
echo ""
echo "Installing AUR applications via yay..."
for app in "${YAY_APPS[@]}"; do
    echo "Installing $app..."
    yay -S --noconfirm "$app"
done

