#!/bin/bash
if [ -x "$(command -v pacman)" ]; then
pkexec pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
		pkexec pacman-key --lsign-key 3056513887B78AEB
		pkexec pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
pkexec bash -c 'echo " 
        [chaotic-aur]
        Include = /etc/pacman.d/chaotic-mirrorlist"  >> /etc/pacman.conf'
    pkexec pacman -Sy  
fi
