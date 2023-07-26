#!/bin/bash
 PS3="Please select method install-flutter: "
    select method in aur Chaotic-aur Download-From-site; do
      break  
    done

if [[ "$method" == "aur" ]]; then
  read -p "Which AUR helper do you use? (yay/paru/etc):" helper
	helper=$(echo "$helper" | sed 's/ *$//')
          $helper -S flutter

elif [[ "$method" == "Chaotic-aur" ]]; then
  if pacman -Sl chaotic-aur | grep -q chaotic; then
          pkexec pacman -S flutter 
  else
          echo "Chaotic-aur not installed Please installed (y/n) :"
          read -p "do you want install and config Chaotic-aur" ans_install_chaotic
  if [[ "$ans_install_chaotic" == "y" || "$ans_install_chaotic" == "Y" ]]; then
          source ~./Choatic-aur.sh
          chmod +x ~./Choatic-aur.sh
          ./Choatic-aur.sh
        if [ $? -ne 0 ]; then
               echo "Error sourcing Choatic-aur script. You may have an incomplete download."
               exit 1
        fi
        else 
        echo "you cant install from Chaotic-aur"
        
fi
    
fi

    elif [[ "$method" == "Download-From-site" ]]; then
        echo "Enter path to save file:"
        read save_path

        echo "Enter name file"
        read name_sdk

        wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.10.6-stable.tar.xz
        tar -xf flutter_linux_3.10.6-stable.tar.xz -C $save_path
   fi
