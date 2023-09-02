#!/bin/bash

PS3="$(echo -e 'Please select method install-flutter: \n\b')"

select method in aur Chaotic-aur Download-From-site; do
   break
done


if [ -x "$(command -v pacman)" ]; then

   if [[ "$method" == "aur" ]]; then
    
    PS3="$(echo -e 'select flutter releases: \n\b')"

     select releases_flutter in flutter-stable flutter-beta flutter-git flutter-light\[Arch-Team\]; do
        break
     done

      read -p "Which AUR helper do you use? (yay/paru/etc):" helper
       helper=$(echo "$helper" | sed 's/ *$//')

      case "$releases_flutter" in
           
    "flutter-stable")
       aur_package="flutter"
        ;;

    "flutter-git")
       aur_package="flutter-git"
       ;;

    "flutter-light[Arch-Team]")  
       aur_package="flutter-light"
       ;;
       
    "flutter-beta")
       aur_package="flutter-beta"
       ;;
       
    *)
       echo "Invalid selection"
       ;;
       
  esac

     if [ -n "$aur_package" ]; then  
      $helper -S "$aur_package"
  fi
   fi
   if [[ "$method" == "Chaotic-aur" ]]; then
   
      if pacman -Sl chaotic-aur | grep -q chaotic; then
         pkexec pacman -S flutter
      else
         echo "Chaotic-aur not installed Please installed (y/n) :"
         read -p "Do you want install and config Chaotic-aur ? " ans_install_chaotic
      fi

      if [[ "$ans_install_chaotic" == "y" || "$ans_install_chaotic" == "Y" ]]; then
      
         source ~./Choatic-aur.sh
         chmod +x ~./Choatic-aur.sh
         ./Choatic-aur.sh
         
         if [ $? -ne 0 ]; then
            echo "Error sourcing Choatic-aur script. You may have an incomplete download."
            exit 1
         fi
         
      else
         echo "You can't install from Chaotic-aur"
      fi
   fi
fi
   if [[ "$method" == "Download-From-site" ]]; then
   
      echo "Enter path to save file:"
      read save_path
      wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.10.6-stable.tar.xz
      
      tar -xf flutter_linux_3.10.6-stable.tar.xz -C $save_path
      
   fi
