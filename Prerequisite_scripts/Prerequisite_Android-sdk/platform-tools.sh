#!/bin/bash
Download(){
    URL_platform_tools="https://dl.google.com/android/repository/platform-tools_r34.0.4-linux.zip"
    save_platform_tool=$(zenity --file-selection --directory --title="Select Download Path")
wget "$URL_platform_tools" -o "$save_platform_tool/platform-tools.zip"
}

Extract_other(){
   location_file=$(zenity --file-selection --directory --title="Select file for unzip or other")
    unzip "$location_file" 
}

PS3="select process for platform-tools
"
select process in Download Extract_or_other; do
    break 
done

if [[ "$process" == "Download" ]]; then
    Download
elif [[ "$process" == "Extract_or_other" ]]; then
    Extract_other
fi
