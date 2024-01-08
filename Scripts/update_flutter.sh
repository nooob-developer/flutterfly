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

      if [ "$source" == "aur" ]; then

        paru -S flutter

      elif [ "$source" == "Chaotic-Aur" ]; then

        sudo pacman -S flutter

      fi

    fi

  fi

  # Flutter upgrade command
  if [[ "$method" == "$upgrade_method_flutter" ]]; then

    if [ -d "$FLUTTER_INSTALL_PATH" ]; then

      flutter upgrade

    else

      echo "Flutter is not installed" >&2
      exit 1

    fi

  fi

}

# Call upgrade function
flutter_upgrade
