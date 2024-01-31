#!/bin/bash

# Define variables
source=""
upgrade_method_repo="upgrade_flutter_in_repo[only_Arch-base]" 
upgrade_method_flutter="flutter_upgrade"

# Read install source
source=$(cat install-source.txt)

# Flutter upgrade function
flutter_upgrade(){

  PS3="Select upgrade method:"

  select method in $upgrade_method_repo $upgrade_method_flutter; do
    break
  done

  # Check if pacman is available
  if [ -x "$(command -v pacman)" ]; then

    if [[ "$method" == "$upgrade_method_repo" ]]; then

      if [ "$source" == "INSTALL_SOURCE=aur" ]; then

        paru -S flutter

      elif [ "$source" == "INSTALL_SOURCE=Chaotic-Aur" ]; then

        sudo pacman -S flutter

      fi

    fi

  fi

  # Flutter upgrade command
  if [[ "$method" == "$upgrade_method_flutter" ]]; then

    if [ -d "$FLUTTER_INSTALL_PATH" ]; then

     sudo flutter upgrade

    else

      echo "Flutter is not installed manual method" >&2
      read -p "do you want update with flutter command ? (y/n)" answer
      if [[ "$answer" == "y" || "$answer" == "Y" || "$answer" == "yes" ]]; then
        sudo flutter upgrade
      fi

      exit 1
    fi
  fi
}

# Call upgrade function
flutter_upgrade
