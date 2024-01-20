#!/bin/zsh
if [[ "$(uname)" == "Darwin" ]]; then
echo "flutter_mac file for install flutter"
echo "------------------------------------"
echo "MacOS_config file for install required tools and etc"
echo "------------------------------------"
PS3="please choose file for run: "
select file in "MacOS_config" "flutter_mac"; do
    break
done
if [[ "$file" == "MacOS_config" ]]; then
    chmod +x MacOS_config.sh
    ./MacOS_config.sh
elif [[ "$file" == "flutter_mac" ]]; then
    chmod +x flutter_mac.sh
    ./flutter_mac.sh
fi
fi
