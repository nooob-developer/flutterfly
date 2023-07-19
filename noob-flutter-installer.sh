#!/bin/bash

read -p "Do you want to update system? (Y/N) " update_ans

if [ -z "$update_ans" ]; then
  update_ans="Y" 
fi
package_manager=""
if [[ "$update_ans" == "Y" || "$update_ans" == "y" ]]; then
    if [ -x "$(command -v pacman)" ]; then
    package_manager="pacman"
  echo "Using $package_manager"

else 
 echo "Not using pacman"
  package_manager="other"
fi

  fi 
    sudo pacman -Syu
  


if [[ "$package_manager" == *"pacman"* ]]; then

  echo "Installing packages on Arch:"

  if [[ -x "$(command -v yay)" ]]; then
    yay -S flutter
  elif [[ -x "$(command -v paru)" ]]; then
    paru -S flutter
  elif [[ -x "$(command -v trizen)" ]]; then
      trizen -S flutter
fi
fi

if yay -S flutter; then
  
  echo "Flutter download successfully"
  
else
  echo "Error download flutter"
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

flutter doctor

read -p "Do you want to see SDK file? (y/n)" see_file

if [ -z "$see_file" ]; then
see_file="Y"
fi
if [[ "$see_file" == "y" || "$see_file" == "Y" ]]; then
cd /opt/flutter/
fi

