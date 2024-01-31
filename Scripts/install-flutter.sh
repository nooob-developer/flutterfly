#!/bin/bash

#set default installation PATH 
FLUTTER_INSTALL_PATH="/opt/flutter" 

 AUR_method(){

read -p "Which AUR helper do you use? (yay/paru/etc): " helper
    helper=$(echo "$helper" | sed 's/ *$//')

    PS3="Please select Flutter release: "
    select release_flutter in "flutter-stable" "flutter-beta" "flutter-git" "flutter-light[Arch-Team]"; do
        break 
    done

    case "$release_flutter" in
        "flutter-stable")
            aur_package="flutter"
            ;;
        "flutter-beta")
            aur_package="flutter-beta"
            ;;
        "flutter-git")
            aur_package="flutter-git"
            ;;
        "flutter-light[Arch-Team]")
            aur_package="flutter-light"
            ;;
        *)
            echo "Invalid choice"
            exit 1
            ;;
    esac

    if [ -n "$aur_package" ]; then
        $helper -S "$aur_package"
        output=$($helper -Q | grep flutter)
        if [ -n "$output" ]; then
            echo "INSTALL_SOURCE=aur" > install-source.txt
        fi
    fi
}
Chaotic_method(){
    

    grep -q 'chaotic' /etc/pacman.conf
    if [ $? -eq 0 ]; then
        pkexec pacman -S flutter 
        source_chaotic=$(pacman -Q | grep flutter)
        if [ -n "$source_chaotic" ]; then
            echo "INSTALL_SOURCE=Chaotic-Aur" > install-source.txt
        fi
        echo "Chaotic mirror found"
    else 
        echo "No chaotic mirror found"
        read -p "Do you want to install and configure it? (y/n): " answer_install_chaotic
        if [[ "$answer_install_chaotic" == "y" ]]; then
            source ./Chaotic-aur.sh
            chmod +x ./Chaotic-aur.sh
            ./Chaotic-aur.sh
            if [ $? -ne 0 ]; then
                echo "Installation failed"
                exit 1
            fi
        fi
    fi
}

Direct_download_method(){

major_minor_version="3.16"
patch_version=5
update_frequency=10 # days

today=$(date +%s)
seconds_per_day=86400
update_seconds=$((update_frequency*seconds_per_day))

base_url="https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_$major_minor_version"

if [ $((today % update_seconds)) -eq 0 ]; then
  patch_version=$((patch_version+1))
fi

download_url="$base_url.$patch_version-stable.tar.xz"
if [ ! -d "$FLUTTER_INSTALL_PATH" ]; then
  mkdir -p "$FLUTTER_INSTALL_PATH"
fi

wget "$download_url" -O "/opt/flutter/flutter_linux.tar.xz"
if [ $? -eq 0 ]; then
    echo "Download successful"
tar -xf "/opt/flutter/flutter_linux.tar.xz" -C "/opt/flutter"
rm "/opt/flutter/flutter_linux.tar.xz"
else
    >&2 echo "Download failed"
    read -p "Do you want to try again? (y/n): " answer_download
    if [[ "$answer_download" == "y" ]]; then
        echo "Retrying download..."
        wget -c -P "$download_url" -O "/opt/flutter/flutter_linux.tar.xz"
        tar -xf "/opt/flutter/flutter_linux.tar.xz" -C "/opt/flutter"
        rm "/opt/flutter/flutter_linux.tar.xz"
    fi
fi

if [ -d "$FLUTTER_INSTALL_PATH" ]; then
echo "INSTALL_SOURCE=direct_download" > install-source.txt
fi

}

Do_arch_steps(){

PS3="$(echo -e 'Select installation method: ')"
select method in aur Chaotic-aur direct_download; do
    break 
done
if [[ "$method" == "aur" ]]; then
AUR_method
fi

if [[ "$method" == "Chaotic-aur" ]]; then
Chaotic_method
fi

if [[ "$method" == "direct_download" ]]; then
Direct_download_method
fi 
}
if [ -x "$(command -v pacman)" ]; then
Do_arch_steps
else 
    Direct_download_method
fi
