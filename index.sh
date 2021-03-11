#!/bin/bash
PWDL=$PWD

#package.sh
    chmod +x src/package/install.pkg
    . src/package/install.pkg
#logo
    if [ -f ~/.Jin/logo ];then
        echo
    else
        sudo ln -s $PWDL/img/logo.sh logo
        chmod +x logo
        sudo cp logo $PREFIX/bin
        sudo cp logo $PREFIX/bin/applets
    fi

#Servidor local $ipp
    cd $PWDL
    chmod +x src/cmd/vnc.sh
    . src/cmd/vnc.sh &
