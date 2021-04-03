#!/bin/bash

#Jin
dlink="raw.githubusercontent.com/JIN26/install/main"
folder=.Jin
mkdir -p ~/$folder
echo -e "\n\tDownload package. this may take a while base on your internet speed.\n"

#lib network
sudo mkdir -p /usr/local/lib/$folder
sudo rm /usr/local/lib/$folder/network.lib
sudo wget "https://${dlink}/lib/network.lib?raw=true" -O /usr/local/lib/$folder/network.lib  
#lib aliases
sudo rm /usr/local/lib/$folder/aliases.lib
sudo wget "https://${dlink}/lib/alias.lib?raw=true" -O /usr/local/lib/$folder/aliases.lib  

#bin logo
sudo rm /usr/local/bin/logo
sudo wget "https://https://raw.githubusercontent.com/JIN26/Banner/master/src/bin/Banner.bin?raw=true" -O /usr/local/bin/logo
sudo chmod +x /usr/local/bin/logo

#bin jin
sudo rm /usr/local/bin/jin
sudo wget "https://${dlink}/bin/raw.bin?raw=true" -O /usr/local/bin/jin  
sudo chmod +x /usr/local/bin/jin

#Plugins neovim
sudo rm ~/.config/nvim/init.vim
sudo wget "https://${dlink}/plugins/init.vim?raw=true" -O ~/.config/nvim/init.vim  

#alias de linux
echo "#User default
source /usr/local/lib/$folder/aliases.lib
logo">~/.bash_aliases
