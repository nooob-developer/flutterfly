#!/bin/bash

# Define variables
UPGRADE_METHOD_REPO="upgrade_flutter_in_repo[only_Arch-base]"
UPGRADE_METHOD_FLUTTER="flutter_upgrade"

# Helper function to display help
function help() {
    echo "Usage: $0 [options]"
    echo "Options:"
    echo "  change_channel   Upgrade Flutter channel to beta"
    echo "  pub_upgrade      Upgrade Dart Pub packages"
    echo "  flutter_upgrade  Upgrade Flutter SDK"
    echo "  back             Go back to the main menu"
    echo "  -h, --help       Display this help message"
    exit 0
}

# Function to upgrade Flutter channel
function change_channel() {
    PS3="Select Flutter channel to upgrade: "
    select channel in "beta" "stable" "master" "back"; do
        case "$channel" in
            "beta")
                flutter channel beta
                flutter upgrade
                ;;
            "stable")
                flutter channel stable
                flutter upgrade
                ;;
            "master")
                flutter channel master
                flutter upgrade
                ;;
            "back")
                main
                ;;
            *)
                echo "Invalid selection. Please try again."
                ;;
        esac
        break
    done
}

# Function to upgrade Dart Pub packages
function pub_upgrade() {
    PS3="Select Pub upgrade option: "
    select option in "pub_upgrade" "pub_upgrade-major" "pub_outdate" "back"; do
        case "$option" in
            "pub_upgrade")
                flutter pub upgrade
                ;;
            "pub_upgrade-major")
                flutter pub upgrade --major-versions
                ;;
            "pub_outdate")
                flutter pub outdated
                ;;
            "back")
                main
                ;;
            *)
                echo "Invalid selection. Please try again."
                ;;
        esac
        break
    done
}

# Function to upgrade Flutter SDK
function flutter_upgrade() {
    PS3="Select Flutter upgrade method: "
    select method in "$UPGRADE_METHOD_REPO" "$UPGRADE_METHOD_FLUTTER" "back"; do
        case "$method" in
            "$UPGRADE_METHOD_REPO")
                if command -v pacman &>/dev/null; then
                    paru -S flutter
                else
                    echo "Error: pacman package manager not found." >&2
                fi
                ;;
            "$UPGRADE_METHOD_FLUTTER")
                if command -v flutter &>/dev/null; then
                    pkexec flutter upgrade
                else
                    echo "Error: Flutter is not installed." >&2
                    read -p "Do you want to update with the flutter command? (y/n) " answer
                    if [[ "$answer" == "y" || "$answer" == "Y" || "$answer" == "yes" ]]; then
                        pkexec flutter upgrade
                    fi
                fi
                ;;
            "back")
                main
                ;;
            *)
                echo "Invalid selection. Please try again."
                continue
                ;;
        esac
        break
    done
}

# Main function
function main() {
    while true; do
        PS3="Select task: "
        select task in "change_channel" "pub_upgrade" "flutter_upgrade" "help" "exit"; do
            case "$task" in
                "change_channel")
                    change_channel
                    ;;
                "pub_upgrade")
                    pub_upgrade
                    ;;
                "flutter_upgrade")
                    flutter_upgrade
                    ;;
                "help")
                    help
                    ;;
                "exit")
                    echo "Exiting..."
                    exit 0
                    ;;
                *)
                    echo "Invalid selection. Please try again."
                    ;;
            esac
            break
        done
    done
}

# Call the main function
main

