#!/bin/bash
Download(){
    URL_android_platform="https://dl.google.com/android/repository/platform-34-ext7_r02.zip"
    save_android_platform=$(zenity --file-selection --directory --title="Select Download Path")
wget "$URL_android_platform" -o "$save_android_platform/android_platform.zip"
}

Extract_other(){
   location_file=$(zenity --file-selection --directory --title="Select file for unzip or other")
    unzip "$location_file" 
}

PS3="select process for android_platforms
"
select process in Download Extract_or_other; do
    break 
done

if [[ "$process" == "Download" ]]; then
    Download
elif [[ "$process" == "Extract_or_other" ]]; then
    Extract_other
fi 
