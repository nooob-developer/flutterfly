#!/bin/bash

Android_PATH="
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# added by noob-flutter-script
export PATH=$PATH:/opt/android-sdk/tools
export PATH=$PATH:/opt/android-sdk/platform-tools
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"

 PS3="Please select shell to add Android-PATH: "
    select user_shell in bash zsh; do
      	if [ "$user_shell" == "bash" ]; then
			echo "$Android_PATH" >> $HOME/.bashrc
		elif [ "$user_shell" == "zsh" ]; then
			echo "$Android_PATH" >> $HOME/.zshrc
		else
            echo "Error unsupported input"
        fi
break 
done
