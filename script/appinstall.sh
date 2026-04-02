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

echo ""
echo "=== Installing Applications ==="
echo ""

# Apps to install via pacman
PACMAN_APPS=(
    "zen-browser-bin"
    "vesktop"
    "ryujinx"
    "helium-browser-bin"
    "bitwarden"
    "dbeaver"
    "discord"
    "github-cli"
    "gvfs"
    "godot"
    "hyprlock"
    "hypridle"
    "hyprpicker"
    "kdenlive"
    "kio-admin"
    "neovim"
    "nicotine+"
    "npm"
    "obs-studio"
    "qbittorrent"
    "rofi"
    "spotify-launcher"
    "swaync"
    "ttf-jetbrains-mono-nerd"
    "ts-node" #? also installs typescript
    "ttyper"
    "vlc"
    "waybar"
    
)

# Install pacman apps
echo "Installing pacman applications..."
for app in "${PACMAN_APPS[@]}"; do
    echo "Installing $app..."
    sudo pacman -S --noconfirm "$app"
done

# Apps to install via yay (AUR)
YAY_APPS=(
    "azaharplus-appimage"
    "blueberry"
    "eden-git"
    "epson-inkjet-printer-escpr"
    "github-desktop-bin"
    "nmgui"
    "osu-lazer-bin"
    "pear-desktop-bin"
    "snappy-switcher"
    "spicetify-cli"
    "vicinae-bin"
    "visual-studio-code-bin"
    "waybar-module-pacman-updates-git"
    "zoom"
)

# Install yay apps
echo ""
echo "Installing AUR applications via yay..."
for app in "${YAY_APPS[@]}"; do
    echo "Installing $app..."
    yay -S --noconfirm "$app"
done

# Apps to install via flatpak
FLATPAK_APPS=(
    "com.hypixel.HytaleLauncher"
    "dev.bragefuglseth.Keypunch"
    "io.mrarm.mcpelauncher"
    "net.shadps4.shadPS4"
    "org.vinegarhq.Sober"
)

# Install flatpak apps
echo ""
echo "Installing Flatpak applications..."
for app in "${FLATPAK_APPS[@]}"; do
    echo "Installing $app..."
    flatpak install --noninteractive flathub "$app"
done

echo ""
echo "=== Setup Complete ==="
echo "All applications have been installed successfully!"