#!/bin/bash
# Title:        Ubuntu development machine setup
# Description:  Callum's development machine setup on Ubuntu!
# Author:       Callum Lamont

echo Updating apt-get
sudo apt-get update

# Copy keyboard settings for Ubuntu. Colemake ftw!
echo Copying over keyboard settings
mv ~/keyboard/gb /usr/share/X11/xkb/symbols/gb

# Installing neovim from source as 5.0 isn't available with apt-get yet
echo Installing neovim
chmod u+x install_neovim.sh
# ./install_neovim

# Installing the rest of the command line tools I use
echo Installing command line tools
cat tools.txt | xargs sudo apt install

# Change default shell to zsh
echo Updating default shell to zsh
chsh -s $(which zsh)
