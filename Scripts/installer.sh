#!/bin/bash


install_flutter(){
source ./flutter-PATH.sh
chmod +x ./flutter-PATH.sh
./flutter-PATH.sh

source ./install-flutter.sh
chmod +x ./install-flutter.sh
./install-flutter.sh
}

install_Chaotic(){
source ./Choatic-aur.sh
chmod +x ./Choatic-aur.sh
./Choatic-aur.sh
}

install_java(){
source ./JAVA-PATH.sh
chmod +x ./JAVA-PATH.sh
./JAVA-PATH.sh
}

install_android-sdk(){
source ./Android-PATH.sh
chmod +x ./Android-PATH.sh
./Android-PATH.sh
}

PS3="Please select the function to run: "
select func in install_flutter install_java install_Chaotic install_android-sdk; do
  case $func in
  install_flutter)
    install_flutter
       ;;

  install_java)  
    install_java
    ;;  

  install_android-sdk)
    install_android-sdk
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

