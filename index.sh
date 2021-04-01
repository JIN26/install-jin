#!/bin/bash

sudo apt install wget && curl proot tar 
dlink="raw.githubusercontent.com/JIN26/install/main"
folder=.Jin
mkdir -p ~/$folder

#Jin
    if [ ! -d "~/$folder" ];then
        echo -e "\n\tDownload package. this may take a while base on your internet speed.\n"
        #lib
            sudo mkdir -p /usr/local/lib/$folder
            sudo wget "https://${dlink}/lib/network.lib?raw=true" -O /usr/local/lib/$folder/network.lib  
        #package.sh
            curl https://${dlink}/package/install.pkg | bash
        #bin logo
            if [ ! -f ~/usr/local/bin/logo ];then
                sudo wget "https://https://raw.githubusercontent.com/JIN26/Banner/master/src/bin/Banner.bin?raw=true" -O /usr/local/bin/logo
                sudo chmod +x /usr/local/bin/logo
                sudo cp logo $PREFIX/bin
                sudo cp logo $PREFIX/bin/applets
            fi
        #bin aliases
            if [ ! -f ~/usr/local/bin/aliases ];then
                sudo wget "https://${dlink}/bin/alias.bin?raw=true" -O /usr/local/bin/aliases  
                sudo chmod +x /usr/local/bin/aliases
            fi
        #bin jin
            if [ ! -f ~/usr/local/bin/jin ];then
                sudo wget "https://${dlink}/bin/raw.bin?raw=true" -O /usr/local/bin/jin  
		sudo chmod +x /usr/local/bin/jin
	    fi
	#Plugins neovim
		echo "init"
	    if [ ! -f ~/.config/nvim/init.vim ];then
		echo "fin"
		    sudo wget "https://${dlink}/plugins/init.vim?raw=true" -O /.config/nvim/init.vim  
    fi

#alias de linux
    echo "#User default
    . aliases
    logo">~/.bash_aliases

echo "skipping dowloading"
