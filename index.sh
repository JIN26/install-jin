#!/bin/bash

sudo apt install wget && curil proot tar 
dlink="raw.githubusercontent.com/JIN26/install/main"
folder=.Jin

mkdir -p ~/$folder

#Jin
echo -e "\n\tDownload package. this may take a while base on your internet speed.\n"

#lib network
sudo mkdir -p /usr/local/lib/$folder
sudo rm /usr/local/lib/$folder/network.lib
sudo wget "https://${dlink}/lib/network.lib?raw=true" -O /usr/local/lib/$folder/network.lib  
#lib aliases
sudo rm /usr/local/lib/$folder/aliases.lib
sudo wget "https://${dlink}/lib/alias.lib?raw=true" -O /usr/local/lib/$folder/aliases.lib  
sudo chmod +x ~/usr/local/lib/$folder/aliases.lib

#bin logo
sudo mkdir -p /usr/local/bin/$folder
sudo rm /usr/local/bin/$folder/logo
sudo wget "https://https://raw.githubusercontent.com/JIN26/Banner/master/src/bin/Banner.bin?raw=true" -O /usr/local/bin/$folder/logo
sudo chmod +x /usr/local/bin/$folder/logo
#sudo cp logo $PREFIX/bin
#sudo cp logo $PREFIX/bin/applets

#bin jin
sudo rm /usr/local/bin/$folder/jin
sudo wget "https://${dlink}/bin/raw.bin?raw=true" -O /usr/local/bin/$folder/jin  
sudo chmod +x ~/usr/local/bin/$folder/jin

#Plugins neovim
sudo rm ~/.config/nvim/init.vim
sudo wget "https://${dlink}/plugins/init.vim?raw=true" -O ~/.config/nvim/init.vim  

#alias de linux
echo "#User default
sources ~/usr/local/lib/$folder/aliases.lib
logo">~/.bash_aliases

echo "skipping dowloading"
