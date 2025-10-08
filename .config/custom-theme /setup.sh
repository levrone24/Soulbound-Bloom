#!/bin/bash

## Keyitdev https://github.com/Keyitdev/sddm-astronaut-theme
## Copyright (C) 2022-2025 Keyitdev
## Distributed under the GPLv3+ License https://www.gnu.org/licenses/gpl-3.0.html

red='\033[0;31m'
green='\033[0;32m'
no_color='\033[0m'
date=$(date +%s)


install_dependencies(){
    if [ -x "$(command -v pacman)" ];
    then
        echo -e "${green}[*] Installing packages using pacman.${no_color}"
        sudo pacman --noconfirm --needed -S sddm qt6-svg qt6-virtualkeyboard qt6-multimedia-ffmpeg
    elif [ -x "$(command -v xbps-install)" ];
    then
        echo -e "${green}[*] Installing packages using xbps-install.${no_color}"
        sudo xbps-install sddm qt6-svg qt6-virtualkeyboard qt6-multimedia
    elif [ -x "$(command -v dnf)" ];
    then
        echo -e "${green}[*] Installing packages using dnf.${no_color}"
        sudo dnf install sddm qt6-qtsvg qt6-qtvirtualkeyboard qt6-qtmultimedia
    elif [ -x "$(command -v zypper)" ];
    then
        echo -e "${green}[*] Installing packages using zypper.${no_color}"
        sudo zypper install sddm-qt6 libQt6Svg6 qt6-virtualkeyboard qt6-virtualkeyboard-imports qt6-multimedia qt6-multimedia-imports
    else
        echo -e "${red}[*] FAILED TO INSTALL PACKAGE: Package manager not found. You must manually install dependencies.">&2;
    fi
}






