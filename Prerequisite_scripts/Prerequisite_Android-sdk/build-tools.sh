#!/bin/bash
Download(){
    URL_build_tools="https://dl.google.com/android/repository/build-tools_r34-linux.zip"
    save_build_tools=$(zenity --file-selection --directory --title="Select Download Path")
wget "$URL_build_tools" -O "$save_build_tools/build-tools.zip"
}

Extract_other(){
    location_file=$(zenity --file-selection --directory --title="Select file for unzip or other")
    unzip "$location_file"
}

PS3="select process for build-tools
"
select process in Download Extract_or_other; do
    break 
done

if [[ "$process" == "Download" ]]; then
    Download
elif [[ "$process" == "Extract_or_other" ]]; then
    Extract_other
fi
