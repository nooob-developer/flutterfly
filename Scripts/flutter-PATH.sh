#!/bin/bash

PS3="ٰDid you use the download method from the site ?"

select method_flutter in yes no; do
 if [[ "$method_flutter" == "yes" ]]; then   
   read -p "please insert location file" loc_sdk
 fi
break 
 done
flutter_PATH_site="
#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
export PATH="$PATH:/$loc_sdk"
#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
"
	flutter_PATH="
 #======================================================
 # added by noob-flutter-script
  export PATH="$PATH:/opt/flutter/bin"
#=======================================================
"
PS3="Please select shell to add flutter-PATH: "

    if [[ "$method_flutter" == "yes" ]]; then
        echo "add 'export' for site method"
      	if [ "$user_shell" == "bash" ]; then
            echo "$flutter_PATH_site" >> $HOME/.bashrc
		elif [ "$user_shell" == "zsh" ]; then
			echo "flutter_PATH_site" >> $HOME/.zshrc
		else

			echo "Error add flutter-PATH"

		fi
    fi
    select user_shell in bash zsh; do
      	if [ "$user_shell" == "bash" ]; then
            echo "$flutter_PATH" >> $HOME/.bashrc
		elif [ "$user_shell" == "zsh" ]; then
			echo "flutter_PATH" >> $HOME/.zshrc
		else

			echo "Error add flutter-PATH"

		fi
        break 

    done


	if [ "$user_shell" == "bash" ]; then
		source $HOME/.bashrc
	elif [ "$user_shell" == "zsh" ]; then
		source $HOME/.zshrc
	fi

    flutter doctor

flutter --version
    
