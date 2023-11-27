#!/bin/bash
Choice_shell(){
PS3="Please select shell to add Android-PATH: "
    select user_shell in bash zsh; do 
        if [[ "$user_shell" == "bash" ]]; then
            user_shell=".bashrc"
        fi

        if [[ "$user_shell" == "zsh" ]]; then
            user_shell=".zshrc"
        fi
        break 
    done
}

PS3="Please select method download: 
"
  select method_install in repository site_source; do
break 
done


Methods_PATH(){
rpo_method_PATH="
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# added by flutterfly
export PATH=/opt/android-sdk/tools
export PATH=/opt/android-sdk/platform-tools
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"

source_method_PATH="
# ------------------------------------------------ #
# added by flutterfly
export PATH=$loc_sdk
export PATH=$loc_sdk
# ------------------------------------------------ #
"

}

Repo_method(){
 ## for install with package manager 
if [ -d "/opt/android-sdk" ]; then
		echo "Android-sdk installed successfully"
        read -p "do you want add PATH android-sdk this loction(y/n)" Path_default
        if [[ "$Path_default" == "y" || "$Path_default" == "Y" ]]; then
            Methods_PATH
            echo "$rpo_method_PATH" >> $HOME/$user_shell 
        fi
	fi

}

Source_method(){
 ## for install from sites 
  loc_sdk=$(zenity --file-selection --directory --title="Select Download Path")
  Methods_PATH

 echo "$source_method_PATH" >> $HOME/$user_shell 
}

if [[ "$method_install" == "repository" ]]; then
    Choice_shell
    Repo_method

elif [[ "$method_install" == "site_source" ]]; then
   Choice_shell
   Source_method
fi

