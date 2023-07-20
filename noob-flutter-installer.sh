#!/bin/bash

read -p "Do you want to update system? (Y/N) " update_ans

if [ -z "$update_ans" ]; then
  update_ans="Y" 
fi
package_manager=""
if [[ "$update_ans" == "Y" || "$update_ans" == "y" ]]; then
    if [ -x "$(command -v pacman)" ]; then
    package_manager="pacman"
    pkexec pacman -Syu
  echo "Using $package_manager"

else 
 echo "Not using pacman"

  package_manager="other"
fi

  fi
  
install_flutter() {
   echo "Which AUR helper do you use? (yay/paru/etc):"

read helper

if [[ $helper =~ ^[a-zA-Z0-9]+$ ]]; then

helper=$(echo "$helper" | trim)

if ! command -v flutter &> /dev/null; then

"$helper" -S flutter

fi
else
echo "Invalid input. Only alphanumeric characters allowed."
fi
}
if [[ "$package_manager" == *"pacman"* ]]; then

  echo "Installing packages on Arch:"
fi

if [ -d "/opt/flutter" ]; then

  echo "Flutter installed successfully"
  read -p "Do you want to install OpenJDK? (y/n)" choice

  if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
      
      sudo pacman -S jdk-openjdk

  echo "Add PATH to shell"

  export PATH="$PATH:/opt/flutter/bin"
  export ANDROID_SDK_ROOT=/opt/android-sdk
  export PATH="$PATH:$ANDROID_SDK_ROOT/emulator"
  export PATH="$PATH:$ANDROID_SDK_ROOT/tools"
  export PATH="$PATH:$ANDROID_SDK_ROOT/tools/bin"
  export PATH="$PATH:$ANDROID_SDK_ROOT/platform-tools"

  echo "Add JAVA PATH"

  export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
  export PATH=$PATH:$JAVA_HOME/bin

else

  echo "Error installing Flutter"

fi
fi
source ~/.bashrc
flutter doctor

read -p "Do you want to see SDK file? (y/n)" see_file

if [ -z "$see_file" ]; then
see_file="Y"
fi
if [[ "$see_file" == "y" || "$see_file" == "Y" ]]; then
cd /opt/flutter/
fi
