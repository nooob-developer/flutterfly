#!/bin/bash

function Script(){

install_flutter(){
    source ./install-flutter.sh
    chmod +x ./install-flutter.sh
./install-flutter.sh
}

flutter_path(){
    source ./flutter-PATH.sh
    chmod +x ./flutter-PATH.sh
./flutter-PATH.sh
}

upgrade_flutter(){
    source ./update_flutter.sh
    chmod +x ./update_flutter.sh
}

flutter-requirements-linux(){ 
    source ./flutter_linux_prerequisites.sh
    chmod +x ./flutter_linux_prerequisites.sh
./flutter_linux_prerequisites.sh
}

install_Chaotic(){
    source ./Chaotic-aur.sh
    chmod +x ./Chaotic-aur.sh
sudo ./Chaotic-aur.sh
}

install_java(){
    source ./JAVA-PATH.sh
    chmod +x ./JAVA-PATH.sh
./JAVA-PATH.sh
}

PATH_android-sdk(){
    source ./Android-PATH.sh
    chmod +x ./Android-PATH.sh
./Android-PATH.sh
}

Android_sdk(){
    source ./Android-sdk.sh
    chmod +x ./Android-sdk.sh
./Android-sdk.sh
}
  while true; do

PS3="Please select the function to run: "
select func in install_flutter flutter_path flutter-requirements-linux upgrade_flutter install_java install_Chaotic PATH_android-sdk Android_sdk; do
  case $func in
  install_flutter)
    install_flutter
    ;;

  flutter_path)
    flutter_path
    ;;

  flutter-requirements-linux)
    flutter-requirements-linux
    ;;

  upgrade_flutter)
    upgrade_flutter
    ;;

  install_java)  
    install_java
    ;;  

  PATH_android-sdk)
    PATH_android-sdk
    ;;

  Android_sdk)
    Android_sdk
    ;;
 install_Chaotic)
    install_Chaotic
    ;;

  *)
    echo "Invalid function selected"
    ;;
   esac

    break

done

read -p "Continue script? (yes/no)" ans
    if [ "$ans" != "yes" ] && [ "$ans" != "y" ]; then
      break
    fi
done

}

Script
