#!/bin/bash

JAVA_PATH="
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
# added by flutterfly
export JAVA_HOME=/usr/lib/jvm/java-20-openjdk-amd64
export PATH=$JAVA_HOME/bin
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
"

	read -p "Do you want to install OpenJDK? (y/n)" choice

	if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
        if [ -x "$(command -v pacman)" ]; then 
	    	 pkexec pacman -S jdk-openjdk
        fi

    elif [[ "$choice" == "n" || "$choice" == "N" ]]; then
        echo "ok skip install..."
    else
       echo "Error invalid character" 
    fi

  PS3="Please select shell to add java-PATH: "
    select user_shell in bash zsh; do
      	if [ "$user_shell" == "bash" ]; then
			echo "Add JAVA PATH"
			echo "$JAVA_PATH" >> $HOME/.bashrc
		elif [ "$user_shell" == "zsh" ]; then
			echo "$JAVA_PATH" >> $HOME/.zshrc
		else
			echo "Error installing Open-Jdk"
		fi
        break 

    done





