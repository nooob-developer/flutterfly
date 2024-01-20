#!/bin/zsh

source=$(cat ./processor_type.txt)
manual_method(){
if [[ "$source" == "arm64" ]]; then
    proccessor="_arm64"
version="3.16.8"
download_path="/usr/local/share/flutter"
url="https://storage.googleapis.com/flutter_infra_release/releases/stable/macos/flutter_macos#{proccessor}_#{version}-stable.zip"
wget -c -P "$download_path" "$url"
unzip "$download_path/flutter_macos#{proccessor}_#{version}-stable.zip" -d "$download_path"
rm "$download_path/flutter_macos#{proccessor}_#{version}-stable.zip"

elif [[ "$source" != "arm64" ]]; then
version="3.16.8"
download_path="/usr/local/share/flutter"
url="https://storage.googleapis.com/flutter_infra_release/releases/stable/macos/flutter_macos_#{version}-stable.zip"
wget -c -P "$download_path" "$url"
unzip "$download_path/flutter_macos_#{version}-stable.zip" -d "$download_path"
rm "$download_path/flutter_macos_#{version}-stable.zip"
fi
}

brew_method() {
    brew install flutter
}

PS3="Please choose one of the following options: "
options=("Manual" "Homebrew")
select opt in "${options[@]}"
do
    case $opt in
        "Manual")
            manual_method
            break
            ;;
        "Homebrew")
            brew_method
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
if [ -d "$download_path" ]; then
     flutter doctor
     else
     echo "please install flutter first" 
fi
