#!/bin/bash
Download(){
    URL_cmdline_tools="https://dl.google.com/android/repository/commandlinetools-linux-10406996_latest.zip"
    save_cmdline_tools=$(zenity --file-selection --directory --title="Select Download Path")
wget "$URL_cmdline_tools" -o "$save_cmdline_tools/cmdline-tools.zip"
}

Extract_other(){
    location_file=$(zenity --file-selection --directory --title="Select file for unzip or other")
    unzip "$location_file"
}

PS3="select process for cmdline-tools
"
select process in Download Extract_or_other; do
    break 
done

if [[ "$process" == "Download" ]]; then
    Download
elif [[ "$process" == "Extract_or_other" ]]; then
    Extract_other
fi
