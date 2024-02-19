#!/bin/zsh

# check macos
if [[ "$(uname)" == "Darwin" ]]; then
PS3='what target do you want to install? '
select target in "Desktop-development" "Android-development" "iOS-development" "web-development"; do
   break 
done

    require_binary() {
        case "$target" in 
            "Desktop-development")
                brew install cocoapods
                ;;
            "Android-development")
                echo "install the required tools youself :)"
                ;;
            "iOS-development")
                brew install cocoapods
                ;;
            "web-development")
                echo "install the required tools youself again :)"
                ;;
        esac

        echo "install basic tools"  
        brew install git wget
    }

    check_processor() {
        if [[ "$(uname -m)" == "arm64" ]]; then
            echo "arm64"
            Processor=arm64
            echo $Processor > ./processor_type.txt
        else
            Processor=x86_64
            echo "x86_64"
            echo $Processor > ./processor_type.txt
        fi
    }

    require_binary
    check_processor
fi
