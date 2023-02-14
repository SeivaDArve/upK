#!/bin/bash

function f_call_drya {
	# All software by Seiva D'Arve is connected by a 'package manager' called drya. Each app may be a simple app, but it connects to all other mainbapps. So, every app may ask drya for help. By running this function you will copy drya to your device without installing it and without modifying anything
   echo 
}


# Links para descrever todas asportas do shopping:
   alias 'PRT.C0.020'="echo \"Parque Central 0\""

if [ -z "$*" ]; then
   # Do something else if there are no arguments
      echo "upK app: No arguments where given"
      echo "0"
elif [ $1 == "encrypt" ]; then
   # Misplace characters from order 1 to order 2. You may use order 1 as the readable order
   clear
   figlet UPK || echo -e "UPK \n" 
   echo "choose a file ar argument 2 and a destination for the encrypted file as argument 3"
   echo "EXAMPLE: upk encrypt ~/readable-file.txt ~/fileXYZ"
   # uDev: Put here an use case of command tr

elif [ $1 == "decrypt" ]; then
   # Misplace characters from order 1 to order 2. You may use order 2 as the readable order

elif [[ $1 == "1" ]]; then
   echo 1 arg 

elif [ $1 == "1" ] && [ -z $2 ]; then
   echo 1 arg 
   echo no arg 2
fi
