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
      pkexec $helper -S "$aur_package"
      output=$($helper -Q | grep flutter)
      if [ -n "$output" ]; then
          echo "INSTALL_SOURCE=aur" > install-source.txt
      fi
  fi
   fi
   if [[ "$method" == "Chaotic-aur" ]]; then

   grep -q 'chaotic' /etc/pacman.conf
if [ $? -eq 0 ]; then
      pkexec pacman -S flutter
      source_chaotic=$(pacman -Q | grep flutter)
      if [ -n "$source_chaotic" ]; then
          echo "INSTALL_SOURCE=Chaotic-AUR" > install-source.txt

      fi
      echo "chaotic mirror found"
  else 
      echo "chaotic mirror NOT found"
      read -p "Do you want install and config Chaotic-aur ? " ans_install_chaotic
fi
      if [[ "$ans_install_chaotic" == "y" || "$ans_install_chaotic" == "Y" ]]; then
      
         source ~./Chaotic-aur.sh
         chmod +x ~./Chaotic-aur.sh
         ./Chaotic-aur.sh
         
         if [ $? -ne 0 ]; then 
            echo "test"
         fi
         
      else
         echo "You can't install from Chaotic-AUR"
      fi
   fi
fi
   if [[ "$method" == "Download-From-site" ]]; then
    echo "Download from Official Site"

       # Get save path from user
     save_path=$(zenity --file-selection --directory --title="Select Download Path")

 # Download and extract
        download_url="https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.13.3-stable.tar.xz"
      wget "$download_url" -O "$save_path/flutter.tar.xz"
      tar -xf "$save_path/flutter.tar.xz" -C "$save_path"
      if [ $? -ne 0 ]; then 
     echo "INSTALL_SOURCE=direct_download" > install-source.txt
      fi
      read -p "do you want update flutter to latest version? (y/n)" upgrade-flutter
     if [[ "$upgrade-flutter" == "y" || "$upgrade-flutter" == "Y" ]]; then
source ~./update_flutter.sh
./update_flutter.sh
    
     else
         exit 1 
   fi
   fi

