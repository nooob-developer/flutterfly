#!/bin/bash

Choice_input(){
PS3="Please select shell to add flutter-PATH: "
 select user_shell in bash zsh; do
	if [ "$user_shell" == "bash" ]; then
		user_shell="$HOME/.bashrc"
	elif [ "$user_shell" == "zsh" ]; then
		user_shell="$HOME/.zshrc"
	fi
PS3="ٰ$(echo -e 'Did you use the download method from the site && repo select it \n \b')"
select method_flutter in site aur...; do
    break 
done
}

Main_process(){
if [[ "$method_flutter" == "site" ]]; then   
    loc_sdk=$(zenity --file-selection --directory --title="please insert location file")
    if [ "$user_shell" == "$HOME/.bashrc" ]; then
            echo "$flutter_PATH_site" >> $user_shell
	elif [ "$user_shell" == "$HOME/.zshrc" ]; then
			echo "$flutter_PATH_site" >> $user_shell
    else
			echo "Error add flutter-PATH"
	fi
fi
}

Flutter_PATH(){

flutter_PATH_site="
#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
# added by flutterfly
export PATH="$loc_sdk"
#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
"

flutter_PATH_rpo="
#======================================================
# added by flutterfly
export PATH="/opt/flutter/bin"
#=======================================================
"
}

Check_process(){
 echo "cammand flutter doctor"
    flutter doctor

flutter --version
}
