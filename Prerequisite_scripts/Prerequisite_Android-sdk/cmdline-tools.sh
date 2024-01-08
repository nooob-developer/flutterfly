#!/bin/bash
<<<<<<< HEAD
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
=======

# Check required binaries
require_binary() {
  if ! command -v $1 &> /dev/null
  then
    echo "$1 could not be found"
    echo "Please install $1" 
    exit
  fi
}

require_binary wget
require_binary unzip

# Rest of script...

Download(){
    ## Install Android cmdline-tools and unzip it
    URL_cmdline_tools="https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip"
    save_cmdline_tools="/opt/android-sdk/cmdline-tools"


    if [ ! -d "$" ]; then ##check if directory exist
        mkdir -p "$save_cmdline_tools"
    ## Download Android cmdline-tools
    wget -O "$save_cmdline_tools/cmdline_tools.zip" "$URL_cmdline_tools"
else
    echo "Android cmdline-tools already downloaded"
fi
## check if file downloaded
    if [ -f "$save_cmdline_tools/cmdline_tools.zip"]; then
         echo "file downloaded"
    else
         echo "file not downloaded"
         ## if file not downloaded   resume download
          wget -c "$save_cmdline_tools/cmdline_tools.zip "$URL_cmdline_tools" 
    fi

    unzip "$save_cmdline_tools/cmdline_tools.zip" -d "$save_cmdline_tools"
    ## unzip and remove zip
    rm "$save_cmdline_tools/cmdline_tools.zip"
}
Download
## check if success process
if [ $? -eq 0 ]; then
    echo "Android cmdline-tools downloaded and extracted"
else
    echo "Download failed"
>>>>>>> fbea7d4 (Refactor all files and resolve bugs)
fi
