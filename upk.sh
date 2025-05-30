#!/bin/bash

# This is main Branch

# Change these values according to user-specific repos/infos/choosen nick/choosen files to make use of
   function f_file1 {
      # In case you are Dv (the user Dv) the repo name and location is:
         v_choosen_repo="upK-diario-Dv"

      # User name (for a prety presentation):
         v_nickname="Dv"

      # Chosen file to edit whitin the repo:
         v_choosen_file="dailyLog.org"

      # Name of repo to sync (by ezGIT)
         v_sync_name="UPK"
   }

   function f_file2 {
      # In case you are Dv (the user Dv) the repo name and location is:
         v_choosen_repo="upK-diario-Dv"

      # User name (for a prety presentation):
         v_nickname="Dv"

      # Chosen file to edit whitin the repo:
         v_choosen_file="exemplo.org"

      # Name of repo to sync (by ezGIT)
         v_sync_name="UPK"
   }

   # unComment file to load
      f_file1
      #f_file2

function f_call_drya {
	# All software by Seiva D'Arve is connected by a 'package manager' called drya. Each app may be a simple app, but it connects to all other mainbapps. So, every app may ask drya for help. By running this function you will copy drya to your device without installing it and without modifying anything
   echo 
}

function f_c1 {
   # Defining a color number 1
   # Used by: f_talk 
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

function f_rc {
   # Defining 'reset color'
   tput sgr0
}

function f_greet {
   clear
   f_c2
   figlet "UPK" 2>/dev/null || echo -e "( UPK )\n"
   f_rc 
}

function f_talk {
   # After colors are defined, create a "Face" for each "ezGIT:

   f_c1; echo -n "UPK: "
   f_rc
}

function f_anyK {
   # Press Any key to continue
   # Or wait X seconds

   # uDev: Use the drya-lib-4 instead

   
   # A variavel $v_txt tem de ser definida antes desta fx ser chamada
      # EXEMPLO:
      #
      # v_txt="Vai ser de seguida editado o ficheiro X"
      # f_anyK


   # Set how many seconds to wait before automatically continue
      v_secs=5

   # Message 
      v_msg=" > ( Continue: ANY KEY | Cancel: Ctrl-C ) "

   # Text to print
         #echo
   f_talk; echo "$v_txt"  # A variavel $v_txt tem de ser definida antes desta fx ser chamada
   f_c2;   echo "$v_msg"
           read -s -n 1 -p " > "
   f_rc;   echo
}

function f_done {
   # After each ezGIT function finishes, say "done"
           echo
   f_talk; echo "Done!"
}

function f_AT_tutorial {
   # Verbose help: both ways to reach this fx

      f_greet
      f_talk; echo 'Tutorial: Opcoes sobre ATs:'
              echo
              echo ' > Pesquisar AT (com menu fzf): `upk . RET 2 RET`'
              echo ' >     "     "  (com terminal): `upk at`'
              echo ' >     "     "  (com terminal): `upk at fzf`'
              echo ' >     "     "  (com terminal): `upk at <pesquisa>`'
              echo
              echo ' > Editar grelhas (com vim):   `upk at .`'
              echo ' >   "       "    (com emacs): `upk at . em`'
              echo
}

function f_AT_list_edit_vim {
   # Se quisermos editar ou visualizar a grelha inteira das AT do centro   

   f_AT_tutorial

   if [[ -d ${v_REPOS_CENTER}/upK-diario-Dv/ ]]; then
      # Se o ficheiro existir, é editado

      # Para usar a fx "f_anyK" ou "f_press_Key_to_continue" tem de se definir uma msg antes, e chamar a fx depois
         v_txt="A ver/editar a lista de ATs do Vasco da Gama (com vim)" 
         f_anyK

      # Editar o ficheiro
         vim ${v_REPOS_CENTER}/upK-diario-Dv/all/lista-at-vg.org

   else
      f_talk; echo "Erro: Falta repo upK-diario-Dv"
              echo ' > Faz download com `D clone upkd`'
   fi

}

function f_variables_about_at {
   v_repo_of_at_list=${v_REPOS_CENTER}/upK-diario-Dv
   v_at_file_inside_repo=all/lista-at-vg.org

   v_at_file=$v_repo_of_at_list/$v_at_file_inside_repo
}

function f_AT_list_fzf {
   # Se quisermos editar ou visualizar a grelha inteira das AT do centro   

   #f_AT_tutorial

   if [[ -d ${v_REPOS_CENTER}/upK-diario-Dv/ ]]; then

      # Para usar a fx "f_anyK" ou "f_press_Key_to_continue" tem de se definir uma msg antes, e chamar a fx depois
         v_txt="A ver a lista de ATs do Vasco da Gama (com fzf)" 
         f_anyK

         cat ${v_REPOS_CENTER}/upK-diario-Dv/all/lista-at-vg.org | fzf -m --tac --prompt="SELECT (1 ou +): Lista de ATs VG: "

   else
      f_talk; echo "Erro: Falta repo upK-diario-Dv"
              echo ' > Faz download com `D clone upkd`'
   fi
}

function f_AT_list_edit_emacs {
   # Se quisermos editar ou visualizar a grelha inteira das AT do centro   

   f_AT_tutorial

   if [[ -d ${v_REPOS_CENTER}/upK-diario-Dv/ ]]; then

      # Para usar a fx "f_anyK" ou "f_press_Key_to_continue" tem de se definir uma msg antes, e chamar a fx depois
         v_txt="A ver/editar a lista de ATs do Vasco da Gama (com emacs)" 
         f_anyK

      emacs ${v_REPOS_CENTER}/upK-diario-Dv/all/lista-at-vg.org

   else
      f_talk; echo "Erro: Falta repo upK-diario-Dv"
              echo ' > Faz download com `D clone upkd`'
   fi
}

function f_search_AT {
   # Pedr ao utilizador para inserir texto que posso existir na lista de ATs do Centro VG

   f_variables_about_at

   f_AT_tutorial

   function f_actually_ask_for_at {
      f_talk; echo -e "Pesquisa: ATs do Vasco da Gama"
              echo -n " > "
              read v_ans
              echo
      sed "s/  \+/ /g" $v_at_file | grep --color=auto  -i $v_ans 
   }

   if [[ -d $v_repo_of_at_list ]]; then
      f_actually_ask_for_at 

   else
      f_talk; echo "Erro: Falta repo upK-diario-Dv"
              echo ' > Faz download com `D clone upkd`'
   fi
}

function f_diary_help {
   # Funtion that will run in case this repository "upK" does not find an external user repository (like the one upK-diario-Dv)

   f_greet
   f_talk

   echo "upK: No valid arguments were given"
   echo " > When arguments are not given, if installed"
   echo "   a separate repository will open "
   echo "   That has a daily log of actvities (user specific)"
   echo
   echo " > If you want to use your user specific \"account\" here"
   echo '   install your text file as: ${v_REPOS_CENTER}/your-diary-name-here'
   echo
   echo " > The standard log repo is: upK-diario-Dv"
   echo "   You can download it by: drya clone upK-diario-Dv"
   echo "   or: https://github.com/SeivaDArve/upK-diario-Dv.git"
}


function f_range_dir_creator {
   # Description: When there are lots of images to send AND sort from phone to PC, this script creates all directoies needed. 

   # Use: specify a range of days you want this script to create directories 
      # Example: enter: '20 31' and it will create:
         # 20 Dez 2022
         # 21 Dez 2022
         # 22 Dez 2022
         # 23 Dez 2022
         # 24 Dez 2022
         # 25 Dez 2022
         # 26 Dez 2022
         # 27 Dez 2022
         # 28 Dez 2022
         # 29 Dez 2022
         # 30 Dez 2022
         # 31 Dez 2022
         # (all this at internal storage on android phone)

   v_uname=$(uname -a)
         
   # When running script, a directory must be specified, unless it is Androi
      # In case of Android, create always at interanal storage
      
      if [[ $v_uname =~ "Android" ]]; then
         # If devide is Android, create necessary directories for the script to work
         mkdir -p /sdcard/termux/ranged-dirs
         
         # ask for range
         read -p "Range dir Creator: input low ranged number: " v_low
         read -p "Range dir Creator: input high ranged number: " v_high
         read -p "Range dir Creator: input month (Example: Sep): " v_month

         for i in $(seq $v_low $v_high); do
            echo "pasta-$i-$v_month-2025"
            i=$((i+1))
         done

      elif [[ $v_uname =~ "Microsoft" ]]; then
         clear

         echo "You are not at Android"
         echo "Dirs will be created at your current dir"
         echo

         # ask for range
         read -p "Range dir Creator: input low ranged number: " v_low
         read -p "Range dir Creator: input high ranged number: " v_high

         # Create half of the name to be specified for the directory that is going to be created
            v_month_year=$(date +%b-%Y)

         if [[ $v_low > $v_high ]]; then
            echo " > Must input low range before high range; aborting"

         else
            while true; do
               mkdir -p "${v_low}-${v_month_year}"
               v_low=$((v_low+1))
            
               if [[ $v_low > $v_high ]]; then break; fi
            done
         fi

      fi

}




function f_file_closed {
   # Run this function only AFTER editing the file that was successfully opened

   f_c1; echo "File closed:" 
   f_rc; echo " > $v_choosen_repo/$v_choosen_file"
         echo
   f_c2; echo "Starting upldoad sequence..."
   f_rc; sleep 1
         echo
   f_c1; echo "Automatically adding all files to be commited:"
   f_rc; echo " > git add --all"
         git add --all && echo " > Success!"
         echo
   f_c1; echo "Commiting all files with the message:":
   f_rc; echo " > Starting: automatic git add --all; git commit; git push"
   f_c3; git commit -m "ezGIT: Automatic git add --all; git commit; git push" && f_rc && echo " > Success!"; echo
   f_c1; echo "Uploading files with:"
   f_rc; echo " > git push:"
         echo
   f_c3; git push && f_rc && echo " > Success!"
         echo 
   f_c1; echo "Showing the status of the repository with: "
   f_rc; echo " > git status:"
   f_c3; git status && f_rc && echo " > Success!"
         echo
   f_c1; echo "This file edited by the app 'upk' closed at:"
   f_rc; v_date_now=$(date)
         echo " > $v_date_now"
         echo
         echo " >> uDev: Sum of time (between openning and closing file)"

}


function f_diary_master {
   # Run this function only BEFORE editing the file that has the need to be in sync with multiple devices

   # Function that will run in case this repository "upk" does find an external user repo with his personal dily log info

   # Emacs and vim can make a file if it does not exist. 
      # So it's existence must be verified with -f before, in order to prevent to create a new one. 
      # The file that is going to be open must exist there before
      # If -f finds a file, this function will run

   clear
   figlet $v_sync_name

   f_c1; echo "Time now is: "
   f_rc; v_date_now=$(date)
         echo " > $v_date_now"
         echo
   f_c1; echo "Note about this app 'upk': "
   f_rc; echo " > Any file this app opens is external and you can config to open your own"
         echo
   f_c1; echo "User Repository exists with the name:"
   f_rc; echo " > ${v_REPOS_CENTER}/$v_choosen_repo/"
         echo
   f_c1; echo "For the user:"
   f_rc; echo " > $v_nickname"
         echo 
   f_c1; echo "File choosen for edition:"
   f_rc; echo " > ${v_REPOS_CENTER}/$v_choosen_repo/$v_choosen_file"
         echo
   f_c1; echo "You are asking to edit the main file at: $v_choosen_repo"
   f_rc; echo " > And to edit the latest version, we will check for updates on github.com"
         echo
   f_c1; echo "Starting download sequence (updating):"
   f_rc; echo " > git pull: "

         cd ${v_REPOS_CENTER}/$v_choosen_repo/
   f_c3; git pull && f_rc && echo " > Success!"; echo

         echo " >> uDev: If git pull is rejected (downloading updates)"
         echo "          this script should ask if we still want the file to open"
         echo
   f_c1; echo "Showing current git status:"
   f_rc; echo " > git status:"

   f_c3; git status
   f_rc; echo
   f_c1; echo "After editin the files, they will be automatically uploaded with:"
   f_rc; echo " > git push"
         echo
   f_c1; echo "Or manually with:"
   f_rc; echo " > G upk ^"
         echo

   function f_warning_for_trigger {
      # Text with color
            echo " >> uDev: A trigger should be added before opening"
            echo " >>         In order to allow the choice for this file to be "
            echo " >>         open only in one device at the same time"
            echo " >> "
            echo " >>       Before opening:"
            echo " >>         send the trigger/info to github.com telling"
            echo " >>         Which device and repo is currently if the file open"
            echo " >>         Then the user chooses whether or not to open the file anyway"
            echo " >> " 
            echo " >>       After closing:"
            echo " >>         removes the trigger/info from github.com"
            echo 
      f_c2; echo -e "File opening ... "
      f_rc
      
   }

   # Try opening the file with the text editors available:
      # If windows with graphical interface is available, we will prefer that to the terminal version
         if [ -f /mnt/c/Program\ Files/Emacs/x86_64/bin/emacs.exe ]; then
            # if .exe is found, open GUI emacs on windows:
               f_c1; echo "Opening file (in GUI windows):"; f_rc
               echo " >  $v_choosen_repo/$v_choosen_file"
               f_warning_for_trigger
               echo

               /mnt/c/Program\ Files/Emacs/x86_64/bin/emacs.exe $v_choosen_file && f_c2 && echo -e "... File closed\n" && f_rc && f_file_closed

         else
            # Otherwise, open emacs in terminal:
               f_c1; echo "Opening file (in Terminal Linux):"; f_rc
               echo " >  $v_choosen_repo/$v_choosen_file"
               echo
               f_warning_for_trigger
               echo

               emacs ${v_REPOS_CENTER}/$v_choosen_repo/$v_choosen_file && f_c2 && echo -e "... File closed\n" && f_rc && f_file_closed #\
               #|| vim ${v_REPOS_CENTER}/$v_choosen_repo/$v_choosen_file && f_file_closed \
               #|| nano ${v_REPOS_CENTER}/$v_choosen_repo/$v_choosen_file && f_file_closed
         fi
}






# -------------------------------------------
# -- Functions above --+-- Arguments Below --
# -------------------------------------------







if [ -z "$*" ]; then
   # open diary (stored on a separate repository) on purpose
   
   if [ -f ${v_REPOS_CENTER}/$v_choosen_repo/$v_choosen_file ]; then
      # If file $v_choosen_repo exists, then:
         f_diary_master
   else
      # If file $v_choosen_repo does not exist, then:
         f_diary_help
   fi

elif [[ $1 == "h" ]]; then
   echo "Help is uDev"

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

elif [ $1 == "clone-drya" ]; then
   echo "uDev: cloning repo DRYa"

elif [ $1 == "." ]; then
   # Menu principal fzf desta repo
   
   function f_stop_duplicates {
      #f_stop_duplicates should be the uncut name
      echo
   }

   # Lista de opcoes para o menu `fzf`
      Lz1='Save '; Lz2='upk .'; Lz3="$Lz1\`$Lz2\`"; Lz4=$v_drya_fzf_menu_hist

      L7="7. Registar/Consulstar horario do VG"
      L6="6. Registar ENTRADA/SAIDA no VG"
      L5="5. Comboios CP"
      L4="4. Credenciais SIIGO"
      L3="3. Abrir ficheiro 'diario' pre-definido"
      L2="2. Grep ATs do Centro VG"
      L1="1. Cancel"
      L0='REPO: upk: '
      
      #v_list=$(echo -e "$L1 \n$L2 \n$L3 \n\n$Lz3" | fzf --cycle --prompt="$L0")
      v_list=$(echo -e "$L1 \n$L2 \n$L3 \n$L4 \n$L5 \n\n$Lz3" | fzf --preview "echo history {}" --header="[Menu saved to: ... ](acess via: \`D ..\`)" -m --pointer=">" --border=rounded --header-first --cycle --prompt="$L0")

   # Perceber qual foi a escolha da lista
      [[ $v_list =~ $Lz3  ]] && echo "$Lz2" >> $Lz4
      [[ $v_list =~ "5. " ]] && echo "uDev" 
      [[ $v_list =~ "4. " ]] && echo -e "Credenciais SIIGO Vasco da Gama: \n > david.rodrigues.vg@siigo.com \n > 'David Rodrigues VG'"
      [[ $v_list =~ "3. " ]] && echo "uDev" && echo " > $v_choosen_file"
      [[ $v_list =~ "2. " ]] && f_search_AT && history -s "upk at"
      [[ $v_list =~ "1. " ]] && echo "Canceled: $Lz2"
      unset v_list
    

elif [ $1 == "at" ] || [ $1 == "AT" ] || [ $1 == "At" ]; then
   # Opcoes sobre ATs

   if [ -z "$2" ]; then
      # Pesquisa de ATs do Centro VG
      f_search_AT



   elif [ $2 == "." ]; then
      # Editar/Visualizar ficheiro de grelhas com AT

      if [ -z "$3" ]; then
         # Editar com vim (predefinido)
         f_AT_list_edit_vim

      elif [ $3 == "em" ]; then
         # Editar/Visualizar ficheiro de grelhas com AT
         f_AT_list_edit_emacs

      else
         # In case the user inputs wrong, print tutorial
         f_AT_tutorial

      fi



   elif [ $2 == "fzf" ] || [ $2 == "f" ]; then
      # Visualizar ficheiro de grelhas com AT com menu fzf
      f_AT_list_fzf

   elif [ $2 == "h" ]; then
      # Help Fx
      f_AT_tutorial

   else
      # In case the user inputs wrong, print tutorial
      #f_AT_tutorial


      f_variables_about_at

      if [[ -d $v_repo_of_at_list ]]; then
         shift
         for i in $*; do
            sed "s/  \+/ /g" $v_at_file | grep --color=auto -i "$i"
            #f_search_AT
         done

      else
         f_talk; echo "Erro: Falta repo upK-diario-Dv"
                 echo ' > Faz download com `D clone upkd`'
      fi


   fi

elif [ $1 == "range-dirs" ]; then
   f_range_dir_creator  # uDev: runs on Android and Windows, but not on Linux

elif [ $1 == "+" ] || [ $1 == "entrada" ]; then
   # Registar entrada no Vasco da Gama 
   # (picar o ponto/dar entrada na central)

   echo "foo" >> ${v_REPOS_CENTER}/$v_choosen_repo/$v_choosen_file
   vim ${v_REPOS_CENTER}/$v_choosen_repo/$v_choosen_file

elif [ $1 == "-" ] || [ $1 == "saida" ]; then
   # Registar entrada no Vasco da Gama 
   # (picar o ponto/dar entrada na central)

   echo "bar" >> ${v_REPOS_CENTER}/$v_choosen_repo/$v_choosen_file
   vim ${v_REPOS_CENTER}/$v_choosen_repo/$v_choosen_file

else
   echo "upk: Arg nao reconhecido"
   echo ' > Experimente `upk .`'

fi
