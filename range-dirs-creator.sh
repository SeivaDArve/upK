#!/bin/bash
# Title: Create dirs by range number
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
