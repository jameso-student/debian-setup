#!/bin/bash

# Use rofi
sed -i 's/dmenu_run/rofi -show run/' ~/.config/i3/config

# Remove background
sudo sed -i 's/#background=/background=/' /etc/lightdm/lightdm-gtk-greeter.conf

# Remove gnome  
sudo apt-get autoremove gdm3
sudo apt-get autoremove --purge gnome* xterm

# Apply Xresources
sudo xrdb ~/.Xresources

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Reboot 
sudo reboot now
