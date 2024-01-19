#!/bin/bash
Choice_input(){
 PS3="Please select shell to add flutter-PATH: "
  select user_shell in bash zsh; do
	if [ "$user_shell" == "bash" ]; then
		user_shell="$HOME/.bashrc"
	elif [ "$user_shell" == "zsh" ]; then
		user_shell="$HOME/.zshrc"
	fi
    break 
  done

 PS3="ٰ$(echo -e 'Did you use the download method from the site && repo select it \n \b')"
 select method_flutter in site aur...; do
    break 
 done
}

Main_process(){
   if [[ "$method_flutter" == "site" ]]; then  
       Flutter_PATH
       if [ "$user_shell" == "$HOME/.bashrc" ]; then
            echo "$flutter_PATH_site" >> $user_shell
            source $user_shell
	elif [ "$user_shell" == "$HOME/.zshrc" ]; then
			echo "$flutter_PATH_site" >> $user_shell
            source $user_shell
    else
			echo "Error add flutter-PATH"
	fi
fi

if [[ "$method_flutter" == "aur..." ]]; then
    Flutter_PATH
    if [ "$user_shell" == "$HOME/.bashrc" ]; then
            echo "$flutter_PATH_rpo" >> $user_shell
            source $user_shell
    elif [ "$user_shell" == "$HOME/.zshrc" ]; then
            echo "$flutter_PATH_rpo" >> $user_shell
            source $user_shell
        else
            echo "Error add flutter-PATH"
    fi
fi

}

Flutter_PATH(){
if [[ "$method_flutter" == "site" ]]; then
    
flutter_PATH_site="
#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
# added by flutterfly
export PATH"$loc_sdk=$(zenity --file-selection --title="Please select SDK location")"
#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
"

elif [[ "$method_flutter" == "aur..." ]]; then
flutter_PATH_rpo="
#======================================================
# added by flutterfly
export FLUTTER_HOME=/opt/flutter
export PATH=/opt/flutter/bin
#=======================================================
"
fi

}


Check_process(){
 echo "cammand flutter doctor"
    flutter doctor

flutter --version
}
Choice_input
Main_process
Check_process
