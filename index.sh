#!/bin/bash

PWDL=$PWD
#sudo apt install wget && curl proot tar 
dlink="raw.githubusercontent.com/JIN26/install/main"
folder=.Jin

#Jin
    if [ -d "~/$folder" ];then
        echo "skipping dowloading"
    else
        echo "Download package. this may take a while base on your internet speed."
        #repos ={[0]=Banner [1]=Git.sh}
        #for repo in $repos; do
        #    echo -e " ${color["Azul"]}[${color["Blanco1"]}$i${color["Azul"]}]${color["Blanco1"]} ${repo[$((++i))]}"
        #done
        #case
        mkdir -p ~/$folder
    fi
#lib
    sudo mkdir -p /usr/local/lib/$folder
    sudo wget "https://${dlink}/lib/network.lib?raw=true" -O /usr/local/lib/$folder/network.lib  

#package.sh
    #curl https://${dlink}/package/install.pkg | bash

#logo
    if [ -f ~/.Jin/logo ];then
        echo "neofetch"
    else
        sudo ln -s $PWDL/img/logo.sh logo
        chmod +x logo
        sudo cp logo $PREFIX/bin
        sudo cp logo $PREFIX/bin/applets
    fi

#Servidor local $ipp
    #cd $PWDL
    #chmod +x src/cmd/vnc.sh
    #. src/cmd/vnc.sh &
