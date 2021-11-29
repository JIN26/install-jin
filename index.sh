#!/bin/bash

echo -e "\n\tDownload package. this may take a while base on your internet speed.\n"

folder=.Jin

#
#			LET'S TO START
#

#Cleaning up

	case "$OSTYPE" in
  		linux-androideabi)
			dlink="raw.githubusercontent.com/JIN26/install/termux"
			usr="$PREFIX"
			;;
		linux-gnu)
			dlink="raw.githubusercontent.com/JIN26/install/main"
                        usr="/usr/local"
			;;
	esac

#.Jin	
	if [ -e ~/$folder ]; then                      
                rm ~/$folder                             
        fi

	mkdir -p ~/$folder
        
	if [ -e ${usr}/var/lib/$folder ]; then                      
                rm ${usr}/var/lib/$folder                             
        fi

	mkdir -p /${usr}/lib/$folder 

#lib network
	if [ -e ${usr}/var/lib/$folder/network.lib ]; then                      
                rm ${usr}/var/lib/$folder/network.lib                             
        fi
              
	wget "https://${dlink}/lib/network.lib?raw=true" -O ${usr}/lib/$folder/network.lib 
	chmod +xr ${usr}/lib/$folder/network.lib

#lib aliases
	rm /usr/local/lib/$folder/aliases.lib
	wget "https://${dlink}/lib/alias.lib?raw=true" -O /usr/local/lib/$folder/aliases.lib  
	chmod +xr /usr/local/lib/$folder/aliases.lib

#lib autor
	rm /usr/local/lib/$folder/autor.lib
	wget "https://${dlink}/lib/autor.lib?raw=true" -O /usr/local/lib/$folder/autor.lib  
	chmod +xr /usr/local/lib/$folder/autor.lib

#bin logo
	rm /usr/local/bin/logo
	wget "https://raw.githubusercontent.com/JIN26/Banner/master/src/bin/Banner.bin?raw=true" -O /usr/local/bin/logo
	chmod +xr /usr/local/bin/logo

#bin jin
	rm /usr/local/bin/jin
	wget "https://${dlink}/bin/raw.bin?raw=true" -O /usr/local/bin/jin  
	chmod +x /usr/local/bin/jin

#Plugins neovim
	rm ~/.config/nvim/init.vim
	wget "https://${dlink}/plugins/init.vim?raw=true" -O ~/.config/nvim/init.vim  

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
