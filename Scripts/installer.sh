#!/bin/bash

function Script(){

install_flutter(){
    chmod +x ./install-flutter.sh
    ./install-flutter.sh
}

flutter_path(){
    chmod +x ./flutter-PATH.sh
    ./flutter-PATH.sh
}

upgrade_flutter(){
    chmod +x ./update_flutter.sh
    ./update_flutter.sh
}

flutter-requirements-linux(){ 
    chmod +x ./flutter_linux_prerequisites.sh
    ./flutter_linux_prerequisites.sh
}

install_Chaotic(){
    chmod +x ./Chaotic-aur.sh
    ./Chaotic-aur.sh
}

<<<<<<< HEAD
install_java(){
    chmod +x ./JAVA-PATH.sh
    ./JAVA-PATH.sh
}

=======
>>>>>>> fbea7d4 (Refactor all files and resolve bugs)
PATH_android-sdk(){
    chmod +x ./Android-PATH.sh
    ./Android-PATH.sh
}

Android_sdk(){
    chmod +x ./Android-sdk.sh
    ./Android-sdk.sh
}
  while true; do

PS3="Please select the function to run: "
<<<<<<< HEAD
select func in install_flutter flutter_path flutter-requirements-linux upgrade_flutter install_java install_Chaotic PATH_android-sdk Android_sdk; do
=======
select func in install_flutter flutter_path flutter-requirements-linux upgrade_flutter install_Chaotic PATH_android-sdk Android_sdk; do
>>>>>>> fbea7d4 (Refactor all files and resolve bugs)
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

<<<<<<< HEAD
  install_java)  
    install_java
    ;;  

=======
>>>>>>> fbea7d4 (Refactor all files and resolve bugs)
  PATH_android-sdk)
    PATH_android-sdk
    ;;

  Android_sdk)
    Android_sdk
    ;;
<<<<<<< HEAD
 install_Chaotic)
=======

  install_Chaotic)
>>>>>>> fbea7d4 (Refactor all files and resolve bugs)
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
