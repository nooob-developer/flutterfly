#!/bin/bash
## get executable for Scripts
chmod +x ../Prerequisite_scripts/Prerequisite_Android-sdk/*

 method_site(){
     PS3="select version android sdk
     "
      

      select version in build-tools platform-tools cmdline-tools android-platforms All-options; do
        
          case "$version" in 

           build-tools)
               source ../Prerequisite_scripts/Prerequisite_Android-sdk/build-tools.sh
               ../Prerequisite_scripts/Prerequisite_Android-sdk/build-tools.sh
               ;;

           platform-tools)
    source ../Prerequisite_scripts/Prerequisite_Android-sdk/platform-tools.sh
              ../Prerequisite_scripts/Prerequisite_Android-sdk/platform-tools.sh
               ;;

           cmdline-tools)
               source ../Prerequisite_scripts/Prerequisite_Android-sdk/cmdline-tools.sh
               ../Prerequisite_scripts/Prerequisite_Android-sdk/cmdline-tools.sh
               ;;

           android-platforms)
               source ../Prerequisite_scripts/Prerequisite_Android-sdk/android_platforms.sh
               ../Prerequisite_scripts/Prerequisite_Android-sdk/android_platforms.sh
               ;;

           All-options)
               source ../Prerequisite_scripts/Prerequisite_Android-sdk/*
                ../Prerequisite_scripts/Prerequisite_Android-sdk/*
                ;; 
           *)
               echo "Invalid selection"
                ;;
        esac
 break 
              done

        

}

method_site

