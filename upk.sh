#!/bin/bash

function f_call_drya {
	# All software by Seiva D'Arve is connected by a 'package manager' called drya. Each app may be a simple app, but it connects to all other mainbapps. So, every app may ask drya for help. By running this function you will copy drya to your device without installing it and without modifying anything
   echo 
}


# Links para descrever todas asportas do shopping:
   alias 'PRT.C0.020'="echo \"Parque Central 0\""

if [ -z "$*" ]; then
   # open diary (stored on a separate repository) on purpose
   
   function f_diary_help {
      echo "upK app: No valid arguments were given"
      echo " > When arguments are not given,"
      echo " > a separate repository will open (if installed)"
      echo " > That has a daily log of actvities (user specific)"
      echo " > If you want to use your \"account\" here"
      echo ' > Install your text file as: ${v_REPOS_CENTER}/your-diary-name-here'
      echo " > The standard repo is: upK-diario-Dv"
      echo " > You can download it by: drya clone upK-diario-Dv"
      echo " > or: https://github.com/SeivaDArve/upK-diario-Dv.git"
   }
   
   # Change this value acording to user-specific repo
      v_choosen_repo=upK-diario-Dv

   # uDev: Emacs and vim can make a file if it does not exist. So existence must be verified before in order to prevent to create a new one. The file that is going to be open must exist there before
   if [ -f ${v_REPOS_CENTER}/$v_choosen_repo/dailyLog.org ]; then
      echo "upk: opening: $v_choosen_repo"
      emacs ${v_REPOS_CENTER}/$v_choosen_repo/dailyLog.org || vim ${v_REPOS_CENTER}/upK-diario-Dv/dailyLog.org || nano ${v_REPOS_CENTER}/upK-diario-Dv/dailyLog.org 
   else
      f_diary_help
   fi

elif [ $1 == "encrypt" ]; then
   # Misplace characters from order 1 to order 2. You may use order 1 as the readable order
   clear
   figlet UPK || echo -e "UPK \n" 
   echo "choose a file ar argument 2 and a destination for the encrypted file as argument 3"
   echo "EXAMPLE: upk encrypt ~/readable-file.txt ~/fileXYZ"
   # uDev: Put here an use case of command tr

elif [ $1 == "decrypt" ]; then
   # Misplace characters from order 1 to order 2. You may use order 2 as the readable order
   echo "uDev: decrypt"

elif [ $1 == "cdi" ]; then
   vim ${v_REPOS_CENTER}/upK/wiki/internal-education/CDI/Disparo-do-CDI

elif [ $1 == "1" ] && [ -z $2 ]; then
   echo 1 arg 
   echo no arg 2

elif [ $1 == "img" ]; then

   if [[ $2 == "planta" ]]; then
      if [[ $3 == "cota-0" ]]; then
         if [[ $4 == "no-guides" ]]; then
            # xdg-open planta x
            echo
            #uDev: Para se poder alterar a ordem destes argumentos à vontade, convem criar um evento com flags
         fi
      fi
   fi
else
   echo "upk: uDev: Description"

fi
