#!/bin/bash
<<<<<<< HEAD
=======
## Select user shell
Choice_shell(){
PS3="Please select shell to add Android-PATH: "
    select user_shell in bash zsh; do 
        if [[ "$user_shell" == "bash" ]]; then
            user_shell=".bashrc"
        fi
>>>>>>> 5ed0b7a (fix bugs)

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
<<<<<<< HEAD
=======

## Define PATH variables
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
        read -p "do you want add PATH android-sdk default loction(y/n)" Path_default
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

Check_PATH(){
    ## check PATH and reload SHELL
    Methods_PATH
if ! grep -Fxq  "$rpo_method_PATH" $HOME/$user_shell ; then
    echo "$rpo_method_PATH" >> $HOME/$user_shell
fi
if ! grep -Fxq  "$source_method_PATH" $HOME/$user_shell ; then
    echo "$source_method_PATH" >> $HOME/$user_shell
fi

source $HOME/$user_shell ## reload shell 
}

if [[ "$method_install" == "repository" ]]; then
    Choice_shell
    Repo_method
    Check_PATH
elif [[ "$method_install" == "site_source" ]]; then
   Choice_shell
   Source_method
   Check_PATH
fi
>>>>>>> 5ed0b7a (fix bugs)
