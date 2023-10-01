#!/bin/bash
Download(){
    URL_cmdline_tools="https://dl.google.com/android/repository/commandlinetools-linux-10406996_latest.zip"
    save_cmdline_tools=$(zenity --file-selection --directory --title="Select Download Path")
wget "$URL_cmdline_tools" -o "$save_cmdline_tools/cmdline-tools.zip"
}

Extract_other(){
location_file=$(zenity --file-selection --file-filter='*.zip'  --title="Select file for unzip or other")

if [ -n "$location_file" ]; then
  # zip file selected
    echo "Selected: $location_file" 
     unzip "$location_file" 
   else
  # user canceled
    echo "No file selected"
fi
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
