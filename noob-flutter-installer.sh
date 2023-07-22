#!/bin/bash
read -p "Which shell do you use? (bash/zsh/etc)" user_shell
read -p "Do you want to update system? (y/n) " update_ans

aur_source="" 
if [ -x "$(command -v pacman)" ]; then

    package_manager="pacman"

 

  read -p "Do you already have Chaotic-AUR installed? (y/n)" has_chaotic

  if [[ "$has_chaotic" == "n" ]]; then
      echo "installing chaotic-aur"
   	pkexec pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
		sudo pacman-key --lsign-key 3056513887B78AEB
		sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
        sudo echo "
        [chaotic-aur]
        Include = /etc/pacman.d/chaotic-mirrorlist >> /etc/pacman.conf" 
    else 
    echo "Skip install"
  fi 



  echo "Using $package_manager"

	if [ -z "$update_ans" ]; then
		update_ans="Y"
	fi
	
	if [[ "$update_ans" == "Y" || "$update_ans" == "y" ]]; then
		pkexec pacman -Syu
	fi
	echo "installing flutter"
	install_flutter() {
		if [[ "$has_chaotic" == "y" || "$has_chaotic" == "Y" ]]; then

    PS3="Please select to install Flutter from AUR or Chaotic-AUR: "
    select aur_chaotic in Chaotic-AUR AUR; do
      aur_source="$aur_chaotic"
      break  
    done
       if [[ "$aur_chaotic" == "AUR" ]]; then

	   read -p "Which AUR helper do you use? (yay/paru/etc):" helper
	helper=$(echo "$helper" | sed 's/ *$//')

          $helper -S flutter
 
       fi

                if [[ "$aur_chaotic" == "Chaotic-AUR" ]]; then
              pkexec pacman -S flutter
          else
 	 echo "Invalid input. Only alphanumeric characters allowed."
 

  fi 

fi

 }
install_flutter

	JAVA_PATH="
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^    
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export PATH=$PATH:$JAVA_HOME/bin
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
"

	Flutter_list="
 #======================================================   
  export PATH="$PATH:/opt/flutter/bin"
  export ANDROID_SDK_ROOT=/opt/android-sdk
  export PATH="$PATH:$ANDROID_SDK_ROOT/emulator"
  export PATH="$PATH:$ANDROID_SDK_ROOT/tools"
  export PATH="$PATH:$ANDROID_SDK_ROOT/tools/bin"
  export PATH="$PATH:$ANDROID_SDK_ROOT/platform-tools"
#=======================================================
"
	if [ -d "/opt/flutter" ]; then
		echo "Flutter installed successfully"
	fi
	read -p "Do you want to install OpenJDK? (y/n)" choice

	if [[ "$choice" == "y" || "$choice" == "Y" ]]; then

		sudo pacman -S jdk-openjdk
		if [ "$user_shell" == "bash" ]; then
			echo "Add JAVA PATH"
			echo "$JAVA_PATH" >> $HOME/.bashrc
		elif [ "$user_shell" == "zsh" ]; then
			echo "JAVA_PATH" >> $HOME/.zshrc
		else

			echo "Error installing Open-Jdk"

		fi
	fi
	read -p "Do you want add flutter PATH? (y/n)" flutter_PATH
	if [[ "$flutter_PATH" == "y" || "$flutter_PATH" == "Y" ]]; then

		if [ "$user_shell" == "bash" ]; then
			echo "Add flutter PATH to shell"

			echo "$Flutter_list" >> $HOME/.bashrc
		elif [ "$user_shell" == "zsh" ]; then
			echo "$Flutter_list" >> $HOME/.zshrc

		else
			echo "Failed to add flutter PATH"
		fi
	fi

	if [ "$user_shell" == "bash" ]; then
		source $HOME/.bashrc
	elif [ "$user_shell" == "zsh" ]; then
		source $HOME/.zshrc
	fi
	flutter doctor

	read -p "Do you want to see SDK file? (y/n)" see_file

	if [ -z "$see_file" ]; then
		see_file="Y"
	fi
	if [[ "$see_file" == "y" || "$see_file" == "Y" ]]; then
		cd /opt/flutter/
	fi
else
	echo "Not using pacman"

	package_manager="other"
fi
