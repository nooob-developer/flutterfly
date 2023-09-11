#!/bin/bash
PS3="$(echo -e 'please select package manager: \n \b')"
select choice in pacman apt xbps zypper dnf; do
     
if [[ "$choice" == "pacman" ]]; then
    if [ -x "$(command -v pacman)" ]; then
        package_manager="pacman"
            pkexec pacman -S clang cmake ninja pkg-config gtk3 gcc xz
    fi
fi

if [[ "$choice" == "apt" ]]; then
    if [ -x "$(command -v apt)" ]; then
        package_manager="apt"
            pkexec apt install clang cmake ninja-build pkg-config libgtk-3-dev liblzma-dev
    fi
fi

if [[ "$choice" == "dnf" ]]; then
    if [ -x "$(command -v dnf)" ]; then
        package_manager="dnf"
            pkexec dnf install clang cmake ninja-build pkgconfig gtk3-devel xz-devel
    fi
fi

if [[ "$choice" == "xbps" ]]; then
    if [ -x "$(command -v xbps)" ]; then
        package_manager="xbps"
            pkexec xbps-install clang cmake ninja gtk+3-devel pkg-config xz-devel
    fi
fi

if [[ "$choice" == "zypper" ]]; then
    if [ -x "$(command -v zypper)" ]; then
        package_manager="zypper"
            pkexec zypper install clang cmake ninja pkg-config libgtk-3-devel xz-devel 
    fi
    
fi
break 
done
