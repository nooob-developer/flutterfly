#!/bin/bash

PS3="ٰ$(echo -e 'Did you use the download method from the site && repo select it \n \b')"

select method_flutter in site aur...; do
  

 if [[ "$method_flutter" == "site" ]]; then   
    loc_sdk=$(zenity --file-selection --directory --title="please insert location file")
fi


    break 
 done

flutter_PATH_site="
#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
# added by flutterfly
export PATH="$loc_sdk"
#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
"
	flutter_PATH="
 #======================================================
 # added by flutterfly
  export PATH="/opt/flutter/bin"
#=======================================================
"
PS3="Please select shell to add flutter-PATH: "

    if [[ "$method_flutter" == "site" ]]; then
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
      if [[ "$method_flutter" == "aur..." ]]; then
      	if [ "$user_shell" == "bash" ]; then
            echo "$flutter_PATH" >> $HOME/.bashrc
		elif [ "$user_shell" == "zsh" ]; then
			echo "flutter_PATH" >> $HOME/.zshrc
		else

			echo "Error add flutter-PATH"

		fi
        break 
fi
    done


	if [ "$user_shell" == "bash" ]; then
		source $HOME/.bashrc
	elif [ "$user_shell" == "zsh" ]; then
		source $HOME/.zshrc
	fi
 echo "cammand flutter doctor"
    flutter doctor

flutter --version
    
