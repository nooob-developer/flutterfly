#!/bin/bash
source=$(cat install-source.txt)
flutter-upgrade(){
PS3="select upgrade method: 
" 
select method in upgrade_flutter_in_repo[only_Arch-base] flutter_upgrade; do
    break 
done


if [ -x "$(command -v pacman)" ]; then
package_manager="pacman"
if [[ "$method" == "$upgrade_flutter_in_repo" ]]; then
if [ "$source" == "aur" ]; then
  paru -S flutter
elif [ "$source" == "Chaotic-Aur" ]; then
 pkexec pacman -S flutter 
fi
fi
fi
if [[ "$method" == "$flutter_upgrade" ]]; then
if [ "$source" == "direct_download" ]; then
  flutter upgrade
fi
fi
}
flutter-upgrade
