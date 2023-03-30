#!/bin/bash

# Change these values according to user-specific repos/infos/choosen nick/choosen files to make use of
   # In case you are Dv (the user Dv) the repo name and location is:
      declare v_choosen_repo="upK-diario-Dv"

   # User name (for a prety presentation):
      declare v_nickname="Dv"

   # Chosen file to edit whitin the repo:
      declare v_choosen_file="dailyLog.org"

function f_call_drya {
	# All software by Seiva D'Arve is connected by a 'package manager' called drya. Each app may be a simple app, but it connects to all other mainbapps. So, every app may ask drya for help. By running this function you will copy drya to your device without installing it and without modifying anything
   echo 
}


# Links para descrever todas asportas do shopping:
   alias 'PRT.C0.020'="echo \"Parque Central 0\""

if [ -z "$*" ]; then
   # open diary (stored on a separate repository) on purpose
   
   # Funtion that will run in case this repository "upK" does not find an external user repository (like the one upK-diario-Dv)
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
   
   # Function that will run in case this repository "upk" does find an external user repo with his personal dily log info
      function f_diary_master {
         # uDev: Emacs and vim can make a file if it does not exist. 
            #So existence must be verified with -f before, in order to prevent to create a new one. 
            #The file that is going to be open must exist there before

         clear
         figlet UPK
         echo "User Repository exists whit the name:"
         echo " > ${v_REPOS_CENTER}/$v_choosen_repo/"
         echo
         echo "For the user:"
         echo " > $v_nickname"
         echo 
         echo "File choosen for edition:"
         echo " > ${v_REPOS_CENTER}/$v_choosen_repo/$v_choosen_file"
         cd ${v_REPOS_CENTER}/$v_choosen_repo/
         echo "Git pulling (downloading)"
         git pull
         echo
         echo "Git status:"
         git status 
         echo
         echo "After edition if the files, they will be automatically uploaded"
         echo "With: git push"
         echo
         echo "Or manually with:"
         echo " > G upk ^"
         echo
         sleep 3
         echo "upk: opening: $v_choosen_repo"
         sleep 2

         emacs ${v_REPOS_CENTER}/$v_choosen_repo/dailyLog.org || vim ${v_REPOS_CENTER}/upK-diario-Dv/dailyLog.org || nano ${v_REPOS_CENTER}/upK-diario-Dv/dailyLog.org 
         echo "Adding all to git and Automatic commit:"
         echo " > Automatic git commit"

         git add --all
         git commit -m "ezGIT: Automatic git add --all; git commit; git push"
         echo -n "Git pushing: "
         git push
         echo " > Done"
         echo -n "git status: "
         git status
      }

   if [ -f ${v_REPOS_CENTER}/$v_choosen_repo/$v_choosen_file ]; then
      # If file $v_choosen_repo exists, then:
         f_diary_master
   else
      # If file $v_choosen_repo does not exist, then:
         f_diary_help
   fi

elif [ $1 == "vim" ]; then
      vim ${v_REPOS_CENTER}/$v_choosen_repo/dailyLog.org 

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
