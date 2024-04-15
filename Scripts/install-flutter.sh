#!/bin/bash

# Set default installation path
FLUTTER_INSTALL_PATH="/opt/flutter"

# Helper function to display help
function help() {
    echo "Usage: $0 [options]"
    echo "Options:"
    echo "  aur            Install Flutter using the AUR method"
    echo "  Chaotic-aur    Install Flutter using the Chaotic AUR method"
    echo "  direct_download Install Flutter using the direct download method"
    echo "  back           Go back to the main menu"
    echo "  -h, --help     Display this help message"
    exit 0
}

# Function to install Flutter using the AUR method
aur_method() {
    read -p "Which AUR helper do you use? (yay/paru/etc): " helper
    helper=$(echo "$helper" | sed 's/ *$//')

    PS3="Please select Flutter release: "
    select release_flutter in "flutter-stable" "flutter-beta" "flutter-git" "back"; do
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
            "back")
                do_arch_steps
                ;;
            *)
                echo "Invalid choice"
                exit 1
                ;;
        esac
        break
    done

    if [ -n "$aur_package" ]; then
        $helper -S "$aur_package"
        output=$($helper -Q | grep flutter)
        if [ -n "$output" ]; then
            echo "INSTALL_SOURCE=aur" > install-source.txt
        fi
    fi
}

# Function to install Flutter using the Chaotic AUR method
chaotic_method() {
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

# Function to install Flutter using the direct download method
direct_download_method() {
    major_minor_version="3.19"
    patch_version=5

    base_url="https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_$major_minor_version"
    download_url="$base_url.$patch_version-stable.tar.xz"

    if [ ! -d "$FLUTTER_INSTALL_PATH" ]; then
        mkdir -p "$FLUTTER_INSTALL_PATH"
    fi

    wget "$download_url" -O "/opt/flutter/flutter_linux.tar.xz"
    if [ $? -eq 0 ]; then
        echo "Download successful"
        tar -xf "/opt/flutter/flutter_linux.tar.xz" -C "/opt/flutter"
        rm "/opt/flutter/flutter_linux.tar.xz"

        # Check if the user wants to set the directory permissions to 777
        read -p "Do you want to set the permissions of the Flutter installation directory to 777? (y/n): " set_permissions
        if [[ "$set_permissions" == "y" ]]; then
            chmod -R 777 "$FLUTTER_INSTALL_PATH"
            echo "Directory permissions set to 777."
        fi
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


}

# Main function to select the installation method
do_arch_steps() {
    while true; do
        PS3="$(echo -e 'Select installation method: ')"
        select method in "aur" "Chaotic-aur" "direct_download" "help" "back"; do
            case "$method" in
                "aur")
                    aur_method
                    ;;
                "Chaotic-aur")
                    chaotic_method
                    ;;
                "direct_download")
                    direct_download_method
                    ;;
                "help")
                    help
                    ;;
                "back")
                    return
                    ;;
                *)
                    echo "Invalid choice"
                    exit 1
                    ;;
            esac
            break
        done
    done
}

# Check if pacman is available, and run the appropriate installation method
if [ -x "$(command -v pacman)" ]; then
    do_arch_steps
else
    direct_download_method
fi
