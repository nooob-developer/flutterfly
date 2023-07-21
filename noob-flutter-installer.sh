#!/bin/bash
read -p "Which shell do you use? (bash/zsh/etc)" user_shell
read -p "Do you want to update system? (y/n) " update_ans

if [ -x "$(command -v pacman)" ]; then
	package_manager="pacman"

	echo "Using $package_manager"


if [ -z "$update_ans" ]; then
	update_ans="Y"
fi
package_manager=""
if [[ "$update_ans" == "Y" || "$update_ans" == "y" ]]; then
	pkexec pacman -Syu
fi
echo "installing flutter"
install_flutter() {
	echo "Which AUR helper do you use? (yay/paru/etc):"

	read helper

	if [[ $helper =~ ^[a-zA-Z0-9]+$ ]]; then

		helper=$(echo "$helper" | trim)

		if ! command -v flutter &>/dev/null; then

			"$helper" -S flutter

		fi
	else
		echo "Invalid input. Only alphanumeric characters allowed."
	fi
}

JAVA_PATH=" 
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export PATH=$PATH:$JAVA_HOME/bin
"

Flutter_list="
 export PATH="$PATH:/opt/flutter/bin"
  export ANDROID_SDK_ROOT=/opt/android-sdk
  export PATH="$PATH:$ANDROID_SDK_ROOT/emulator"
  export PATH="$PATH:$ANDROID_SDK_ROOT/tools"
  export PATH="$PATH:$ANDROID_SDK_ROOT/tools/bin"
  export PATH="$PATH:$ANDROID_SDK_ROOT/platform-tools"
"

if [ -d "/opt/flutter" ]; then
	echo "Flutter installed successfully"
fi
read -p "Do you want to install OpenJDK? (y/n)" choice

if [[ "$choice" == "y" || "$choice" == "Y" ]]; then

	sudo pacman -S jdk-openjdk
	if [ "$user_shell" == "bash" ]; then
		echo "Add JAVA PATH"
		echo "$JAVA_PATH" >>~./bashrc
	elif [ "$user_shell" == "zsh" ]; then
		echo "Flutter_list" >>~./zshrc
	else

		echo "Error installing Open-Jdk"

	fi
fi
read -p "Do you want add flutter PATH? (y/n)" flutter_PATH
if [[ "$flutter_PATH" == "y" || "$flutter_PATH" == "Y" ]]; then

	if [ "$user_shell" == "bash" ]; then
		echo "Add flutter PATH to shell"

		echo "$Flutter_list" >>~./bashrc
	elif [ "$user_shell" == "zsh" ]; then
		echo "$Flutter_list" >>~./zshrc

	else
		echo "Failed to add flutter PATH"
	fi
fi

if [ "$user_shell" == "bash" ]; then
	source ~/.bashrc
elif [ "$user_shell" == "zsh" ]; then
	source ~/.zshrc
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

