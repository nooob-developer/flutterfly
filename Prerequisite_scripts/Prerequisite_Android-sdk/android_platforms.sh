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
    ## Install Android platform and unzip it
    URL_android_platform="https://dl.google.com/android/repository/platform-34-ext7_r02.zip"
    
    save_android_platform="/opt/android-sdk"

    if [ ! -d "$save_android_platform" ]; then ##check if directory exist
        mkdir -p "$save_android_platform"
    ## Download Android platform
    wget -O "$save_android_platform/android_platform.zip" "$URL_android_platform"

else
    echo "Android platform already downloaded"
fi
## check if file downloaded
if [ -f "$save_android_platform/android_platform.zip" ]; then
    echo "file downloaded"
else
    echo "file not downloaded"
    ## if file not downloaded   resume download
    wget -c  "$save_android_platform/android_platform.zip" "$URL_android_platform"
fi
    unzip "$save_android_platform/android_platform.zip" -d "$save_android_platform"
## unzip and remove zip
    rm "$save_android_platform/android_platform.zip"
}
Download
## check if success process
if [ $? -eq 0 ]; then
    echo "Android platform downloaded and extracted"
else
    echo "Download failed"
fi
