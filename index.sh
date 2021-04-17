#!/bin/bash

#Jin
echo -e "\n\tDownload package. this may take a while base on your internet speed.\n"
dlink="raw.githubusercontent.com/JIN26/install/main"
folder=.Jin
mkdir -p ~/$folder

#lib network
sudo mkdir -p /usr/local/lib/$folder
sudo rm /usr/local/lib/$folder/network.lib
sudo wget "https://${dlink}/lib/network.lib?raw=true" -O /usr/local/lib/$folder/network.lib 

#lib aliases
sudo rm /usr/local/lib/$folder/aliases.lib
sudo wget "https://${dlink}/lib/alias.lib?raw=true" -O /usr/local/lib/$folder/aliases.lib  

#lib autor
sudo rm /usr/local/lib/$folder/autor.lib
sudo wget "https://${dlink}/lib/autor.lib?raw=true" -O /usr/local/lib/$folder/autor.lib  

#bin logo
sudo rm /usr/local/bin/logo
sudo wget "https://raw.githubusercontent.com/JIN26/Banner/master/src/bin/Banner.bin?raw=true" -O /usr/local/bin/logo
sudo chmod +x /usr/local/bin/logo

#bin jin
sudo rm /usr/local/bin/jin
sudo wget "https://${dlink}/bin/raw.bin?raw=true" -O /usr/local/bin/jin  
sudo chmod +x /usr/local/bin/jin

#Plugins neovim
sudo rm ~/.config/nvim/init.vim
sudo wget "https://${dlink}/plugins/init.vim?raw=true" -O ~/.config/nvim/init.vim  

sleep 0.5
#Rescribir el banner dependiendo del sistema
case "$OSTYPE" in
  linux-androideabi)
    if [ -e $PREFIX/etc/motd ]; then
      rm $PREFIX/etc/motd
    fi
    if [ -e $PREFIX/etc/bash.bashrc ]; then
      echo "
      if [ -x /data/data/com.termux/files/usr/libexec/termux/command-not-found ]; then
        command_not_found_handle() {
          /data/data/com.termux/files/usr/libexec/termux/command-not-found "$1"
        }
      fi

      PS1='Jin$ '

      #User default
      source /usr/local/lib/$folder/aliases.lib
      logo">$PREFIX/etc/bash.bashrc
    fi
    ;;
  linux-gnu)
    #alias de linux
    echo "#User default
    source /usr/local/lib/$folder/aliases.lib
    logo">~/.bash_aliases
    #echo "# Alias definitions.
    # You may want to put all your additions into a separate file like
    # ~/.bash_aliases, instead of adding them here directly.
    # See /usr/share/doc/bash-doc/examples in the bash-doc package.

    #if [ -f ~/.bash_aliases ]; then
    #  . ~/.bash_aliases
    #fi">>~/.bashrc
  ;;
esac