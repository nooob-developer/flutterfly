#!/bin/bash
Download(){
    URL_platform_tools="https://dl.google.com/android/repository/platform-tools_r34.0.4-linux.zip"
    save_platform_tool=$(zenity --file-selection --directory --title="Select Download Path")
wget "$URL_platform_tools" -o "$save_platform_tool/platform-tools.zip"
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
