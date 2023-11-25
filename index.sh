o#!/bin/bash

echo -e "\n\tDownload package. this may take a while base on your internet speed.\n"

#.Jin	
    dlink="raw.githubusercontent.com/JIN26/install-jin/main"
    folder=.Jin
    
    if [ -e ~/$folder ]; then                             
	rm -r ~/$folder 
    fi
    mkdir -p ~/$folder

#
#			LET'S TO START
#

#Cleaning up

    case "$OSTYPE" in
	linux-android)
	    usr="$PREFIX" 
	;;
	linux-gnu)
        usr="/usr/local"			
	;;
    esac
echo usr
#main
    
    printf "        $R [W] You will exit $W \n"
    printf "$Y [!]$W Everything will be restored \n\n"
    sleep 1
    
    #.Jin	
    if [ -e ${usr}/lib/$folder ]; then                      
	rm -r ${usr}/lib/$folder                             
    fi
    
    #lib network
    if [ -e ${usr}/lib/$folder/network.lib ]; then                      
	rm ${usr}/lib/$folder/network.lib                             
    fi

    #lib aliases
    if [ -e ${usr}/lib/$folder/aliases.lib ]; then                      
	rm ${usr}/lib/$folder/aliases.lib 
    fi

    #lib autor
    if [ -e ${usr}/lib/$folder/autor.lib ]; then                      
	rm ${usr}/lib/$folder/autor.lib
    fi

    #bin logo
    if [ -e ${usr}/bin/logo ]; then                      
	rm ${usr}/bin/logo	
    fi
    
    #bin jin
    if [ -e ${usr}/bin/jin ]; then                      
	rm ${usr}/bin/jin
    fi 
    
    #Plugins neovim
    if [ -e ~/.config/nvim/init.vim ]; then
	rm ~/.config/nvim/init.vim
    fi

# fin main

#Rescribir el banner dependiendo del sistema

case "$OSTYPE" in
  linux-android)
    echo hola
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
      source ${usr}/lib/$folder/aliases.lib
      logo">$PREFIX/etc/bash.bashrc
    fi
    
    #.Jin
    mkdir -p /${usr}/lib/$folder 

    #netword.lib
	wget "https://${dlink}/lib/network.lib?raw=true" -O ${usr}/lib/$folder/network.lib 
	chmod +xr ${usr}/lib/$folder/network.lib

    #aliases.lib
	wget "https://${dlink}/lib/alias.lib?raw=true" -O ${usr}/lib/$folder/aliases.lib  
	chmod +xr ${usr}/lib/$folder/aliases.lib

    #autor.lib
	wget "https://${dlink}/lib/autor.lib?raw=true" -O ${usr}/lib/$folder/autor.lib  
	chmod +xr ${usr}/lib/$folder/autor.lib

    #bin logo
	wget "https://raw.githubusercontent.com/JIN26/Banner/master/src/bin/Banner.bin?raw=true" -O ${usr}/bin/logo
	chmod +xr ${usr}/bin/logo

    #bin jin
	wget "https://${dlink}/bin/raw.bin?raw=true" -O ${usr}/bin/jin  
	chmod +x ${usr}/bin/jin

    #Plugins neovim
	wget "https://${dlink}/plugins/init.vim?raw=true" -O ~/.config/nvim/init.vim  
	
    echo $(exit)

    ;;
    linux-gnu)
    
    #alias de linux
    
    echo "#User default
    source ${usr}/lib/$folder/aliases.lib
    logo">~/.bash_aliases
    
    #echo "# Alias definitions.
    # You may want to put all your additions into a separate file like
    # ~/.bash_aliases, instead of adding them here directly.
    # See /usr/share/doc/bash-doc/examples in the bash-doc package.

    #if [ -f ~/.bash_aliases ]; then
    #  . ~/.bash_aliases
    #fi">>~/.bashrc
    
    #.Jin
    sudo mkdir -p /${usr}/lib/$folder 

    #netword.lib
	sudo wget "https://${dlink}/lib/network.lib?raw=true" -O ${usr}/lib/$folder/network.lib 
	sudo chmod +xr ${usr}/lib/$folder/network.lib

    #aliases.lib
	sudo wget "https://${dlink}/lib/alias.lib?raw=true" -O ${usr}/lib/$folder/aliases.lib  
	sudo chmod +xr ${usr}/lib/$folder/aliases.lib

    #autor.lib
	sudo wget "https://${dlink}/lib/autor.lib?raw=true" -O ${usr}/lib/$folder/autor.lib  
	sudo chmod +xr ${usr}/lib/$folder/autor.lib

    #bin logo
	sudo wget "https://raw.githubusercontent.com/JIN26/Banner/master/src/bin/Banner.bin?raw=true" -O ${usr}/bin/logo
	sudo chmod +xr ${usr}/bin/logo

    #bin jin
	sudo wget "https://${dlink}/bin/raw.bin?raw=true" -O ${usr}/bin/jin  
	sudo chmod +x ${usr}/bin/jin

    #Plugins neovim
	sudo wget "https://${dlink}/plugins/init.vim?raw=true" -O ~/.config/nvim/init.vim  
	
    echo $(exit)

    ;;
esac
