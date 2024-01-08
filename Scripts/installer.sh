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

flutter-requirements-linux(){ 
source ./flutter_linux_prerequisites.sh
chmod +x ./flutter_linux_prerequisites.sh
./flutter_linux_prerequisites.sh
}

install_Chaotic(){
source ./Choatic-aur.sh
chmod +x ./Choatic-aur.sh
./Choatic-aur.sh
}

<<<<<<< HEAD
install_java(){
source ./JAVA-PATH.sh
chmod +x ./JAVA-PATH.sh
./JAVA-PATH.sh
}

install_android-sdk(){
source ./Android-PATH.sh
chmod +x ./Android-PATH.sh
./Android-PATH.sh
=======
PATH_android-sdk(){
    chmod +x ./Android-PATH.sh
    ./Android-PATH.sh
}

Android_sdk(){
    chmod +x ./Android-sdk.sh
    ./Android-sdk.sh
>>>>>>> 5ed0b7a (fix bugs)
}
  while true; do

PS3="Please select the function to run: "
<<<<<<< HEAD
select func in install_flutter flutter_path flutter-requirements-linux install_java install_Chaotic install_android-sdk; do
=======
select func in install_flutter flutter_path flutter-requirements-linux upgrade_flutter install_Chaotic PATH_android-sdk Android_sdk; do
>>>>>>> 5ed0b7a (fix bugs)
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

<<<<<<< HEAD
  install_java)  
    install_java
    ;;  

  install_android-sdk)
    install_android-sdk
    ;;

 install_Chaotic)
     install_Chaotic
     ;;
=======
  upgrade_flutter)
    upgrade_flutter
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

>>>>>>> 5ed0b7a (fix bugs)
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
