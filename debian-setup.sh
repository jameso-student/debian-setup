#!/bin/bash
sudo pacman -Syu
sudo pacman -S \
	i3 \
	neovim \
	lightdm \
	lightdm-gtk-greeter \
	rxvt-unicode \
	git \
	wget \
	curl \
	zsh \
	rofi \
	unzip

# Create .Xresources
cat xresources_setup > ~/.Xresources

# Install DejaVu Nerd Font
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/DejaVuSansMono.zip
mkdir -p ~/.local/share/fonts/
unzip DejaVuSansMono.zip -d ~/.local/share/fonts/
rm DejaVuSansMono.zip
fc-cache -fv

# Set up urxvt extensions
mkdir -p ~/.config/urxvt/ext/
git clone https://github.com/simmel/urxvt-resize-font.git resize-font
cp resize-font/resize-font ~/.config/urxvt/ext/

# Get neovim stuff
cp ./nvim -R ~/.config/

# Enable X, i3, and ligthdm
echo "exex i3" > ~/.xinitrc
sudo systemctl enable lightdm
startx

# Reboot
sudo reboot now
