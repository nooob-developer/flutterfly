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
    URL_platform_tools="https://dl.google.com/android/repository/platform-tools_r34.0.4-linux.zip"

    save_platform_tools="/opt/android-sdk/platform-tools"

    if [ ! -d "$save_platform_tools" ]; then ##check if directory exist
        mkdir -p "$save_platform_tools"
    ## Download Android platform
    wget -O "$save_platform_tools/platform_tools.zip" "$URL_platform_tools"
    else
        echo "Android platform already downloaded"
    fi
    ## check if file downloaded
    if [ -f "$save_platform_tools/platform_tools.zip" ]; then
        echo "file downloaded"
    else
        echo "file not downloaded"
        ## if file not downloaded   resume download
        wget -c  "$save_platform_tools/platform_tools.zip" "$URL_platform_tools"
    fi

    unzip "$save_platform_tools/platform_tools.zip" -d "$save_platform_tools"
    ## unzip and remove zip
    rm "$save_platform_tools/platform_tools.zip"
}
Download
## check if success process
if [ $? -eq 0 ]; then
    echo "Android platform-tools downloaded and extracted"
else
    echo "Download failed"
fi
