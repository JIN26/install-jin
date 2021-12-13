#!/bin/bash

#
#			LET'S TO START Server-php
#
case "$OSTYPE" in
    linux-androideabi) #phone
        source $PREFIX/lib/.Jin/network.lib
        echo
        setterm -foreground green;
        figlet -cf slant "$ipp" ||cowsay sorry
        figlet -cf slant "$ip:8081" ||cowsay sorry
        echo "$PWD"
        termux-open "$ipp"
        php -S "$ip:8081" -t  ~/storage/shared/Download/ &
        php -S "$ipp" -t $PWD/ &
        ;;
    linux-gnu*) #laptop and phone internal kali			
        source /usr/local/lib/.Jin/network.lib
        echo
        setterm -foreground green;
        figlet -cf slant "$ipp" ||cowsay sorry
        echo "$PWD"
        google-chrome "$ipp"
        php -S "$ipp" -t $PWD/ &
        ;;
esac
#sshfs localhost:/path/to/folder /path/to/mount/point
#ssh -R 80:192.168.200.2:8080 serveo.net;
