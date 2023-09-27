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

function f_c1 {
   # Defining a color number 1
   tput setaf 4
}

function f_c2 {
   # Defining a color number 1
   tput setaf 6
}

function f_c3 {
   # Defining a color number 1
   tput setaf 5
}

function f_cr {
   # Defining 'reset color'
   tput sgr0
}

#f_c1; echo hi; f_cr; echo sh
#read

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

   # Run this function only AFTER editing the file that was successfully opened
      function f_file_closed {
         f_c1; echo "File closed:" ; f_cr
         echo " > $v_choosen_repo/$v_choosen_file"
         echo
         f_c2; echo "Starting upldoad sequence..."; f_cr
         sleep 1
         echo
         f_c1; echo "Automatically adding all files to be commited:"; f_cr
         echo " > git add --all"
            git add --all && echo " > Success!"
         echo
         f_c1; echo "Commiting all files with the message:":; f_cr
         echo " > Starting: automatic git add --all; git commit; git push"
            f_c3; git commit -m "ezGIT: Automatic git add --all; git commit; git push" && f_cr && echo " > Success!"
         echo
         f_c1; echo "Uploading files with:"; f_cr
         echo " > git push:"
            echo
            f_c3; git push && f_cr && echo " > Success!"
         echo 
         f_c1; echo "Showing the status of the repository with: "; f_cr
         echo " > git status:"
            f_c3; git status && f_cr && echo " > Success!"
         echo
         f_c1; echo "This file edited by the app 'upk' closed at:"; f_cr
         v_date_now=$(date)
         echo " > $v_date_now"
         echo
      }
   
   # Run this function only BEFORE editing the file that has the need to be in sync with multiple devices
      function f_diary_master {
         # Function that will run in case this repository "upk" does find an external user repo with his personal dily log info

         # Emacs and vim can make a file if it does not exist. 
            # So it's existence must be verified with -f before, in order to prevent to create a new one. 
            # The file that is going to be open must exist there before
            # If -f finds a file, this function will run

         clear
         figlet UPK

         f_c1; echo "Time now is: "; f_cr
         v_date_now=$(date)
         echo " > $v_date_now"
         echo
         f_c1; echo "Note about this app 'upk': "; f_cr
         echo " > Any file this app opens is external and you can config to open your own"
         echo
         f_c1; echo "User Repository exists whit the name:"; f_cr
         echo " > ${v_REPOS_CENTER}/$v_choosen_repo/"
         echo
         f_c1; echo "For the user:"; f_cr
         echo " > $v_nickname"
         echo 
         f_c1; echo "File choosen for edition:"; f_cr
         echo " > ${v_REPOS_CENTER}/$v_choosen_repo/$v_choosen_file"
         echo
         f_c1; echo "You are asking to edit the file $v_choosen_repo"; f_cr
         echo " > To edit the latest version, we will check for updates"
         echo
         f_c1; echo "Starting download sequence (updating):"; f_cr
         echo " > git pull: "
            cd ${v_REPOS_CENTER}/$v_choosen_repo/
            f_c3; git pull && f_cr && echo " > Success!"
            echo " >> uDev: If git pull is rejected, the process should ask if we still want the file to open"
         echo
         f_c1; echo "Showing it's git status now:"; f_cr
         echo " > git status:"
            f_c3; git status ; f_cr
         echo
         f_c1; echo "After editin the files, they will be automatically uploaded with:"; f_cr
         echo " > git push"
         echo
         f_c1; echo "Or manually with:"; f_cr
         echo " > G upk ^"
         echo

         function f_warning_for_trigger {
            echo " >> uDev: A trigger can be added before opening"
            echo " >>       In order for this file to be open only in one device"
            echo " >>       At the same time"
            echo 
            f_c2; echo -e "File opening ... "; f_cr
            
         }
         # Try opening the file with the text editors available:

         # If windows with graphical interface is available, we will prefer that to the terminal version
            if [ -f /mnt/c/Program\ Files/Emacs/x86_64/bin/emacs.exe ]; then
               # if .exe is found, open GUI emacs on windows:
                  f_c1; echo "Opening file (in GUI windows):"; f_cr
                  echo " >  $v_choosen_repo/$v_choosen_file"
                  f_warning_for_trigger
                  echo

                  /mnt/c/Program\ Files/Emacs/x86_64/bin/emacs.exe $v_choosen_file && f_c2 && echo -e "File closed\n" && f_cr && f_file_closed

            else
               # Otherwise, open emacs in terminal:
                  f_c1; echo "Opening file (in Terminal Linux):"; f_cr
                  echo " >  $v_choosen_repo/$v_choosen_file"
                  f_warning_for_trigger
                  echo

                  emacs ${v_REPOS_CENTER}/$v_choosen_repo/$v_choosen_file && f_c2 && echo -e "File closed\n" && f_cr && f_file_closed #\
                  #|| vim ${v_REPOS_CENTER}/$v_choosen_repo/$v_choosen_file && f_file_closed \
                  #|| nano ${v_REPOS_CENTER}/$v_choosen_repo/$v_choosen_file && f_file_closed
            fi
      }



   if [ -f ${v_REPOS_CENTER}/$v_choosen_repo/$v_choosen_file ]; then
      # If file $v_choosen_repo exists, then:
         f_diary_master
   else
      # If file $v_choosen_repo does not exist, then:
         f_diary_help
   fi

elif [[ $1 == "vim" ]]; then
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
