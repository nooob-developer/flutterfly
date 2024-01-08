#!/bin/bash

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
    ## Install Android build-tools and unzip it
    URL_build_tools="https://dl.google.com/android/repository/build-tools_r34-linux.zip"
    save_build_tools="/opt/android-sdk/build-tools"


    if [ ! -d "$save_build_tools" ]; then ##check if directory exist
        mkdir -p "$save_build_tools"
    ## Download Android build-tools
    wget -O "$save_build_tools/build_tools.zip" "$URL_build_tools"

else
    echo "Android build-tools already downloaded"
fi
## check if file downloaded
if [ -f "$save_build_tools/build_tools.zip" ]; then
    echo "file downloaded"
else
    echo "file not downloaded"
    ## if file not downloaded   resume download
    wget -c  "$save_build_tools/build_tools.zip" "$URL_build_tools"
fi
    unzip "$save_build_tools/build_tools.zip" -d "$save_build_tools"
## unzip and remove zip
    rm "$save_build_tools/build_tools.zip"
}
Download
## check if success process
if [ $? -eq 0 ]; then
    echo "build-tools downloaded and extracted"
else
    echo "Download failed"
fi
