#!/bin/bash 
function min {
	tput setaf 3
	echo "Data e hora (Durante 1 minuto)"
	echo " > Cancelar [Ctrl + C]"
	tput sgr 0

	# Translating to Portuguese and storing in a variable
	if [ $(date +%A) == "Monday" ]; then v_dia=Segunda; fi
	if [ $(date +%A) == "Tuesday" ]; then v_dia=Terça; fi
	if [ $(date +%A) == "Wednesday" ]; then v_dia=Quarta; fi
	if [ $(date +%A) == "Thursday" ]; then v_dia=Quinta; fi
	if [ $(date +%A) == "Friday" ]; then v_dia=Sexta; fi
	if [ $(date +%A) == "Saturday" ]; then v_dia=Sabado; fi
	if [ $(date +%A) == "Sunday" ]; then v_dia=Domingo; fi

	# Output the date and time for 60 seconds
	for i in {1..60}
	do
		echo -n "$v_dia "
		date +"%d/%m/%Y %H:%M:%S"
		sleep 1
	done
}

function seg {
	tput setaf 3
	echo "Data e hora (Durante 1 segundo)"
	tput sgr 0

	# Translating to Portuguese and storing in a variable
	if [ $(date +%A) == "Monday" ]; then v_dia=Segunda; fi
	if [ $(date +%A) == "Tuesday" ]; then v_dia=Terça; fi
	if [ $(date +%A) == "Wednesday" ]; then v_dia=Quarta; fi
	if [ $(date +%A) == "Thursday" ]; then v_dia=Quinta; fi
	if [ $(date +%A) == "Friday" ]; then v_dia=Sexta; fi
	if [ $(date +%A) == "Saturday" ]; then v_dia=Sabado; fi
	if [ $(date +%A) == "Sunday" ]; then v_dia=Domingo; fi

	# Output the date and time for 1 second
	echo -n "$v_dia "
	date +"%d/%m/%Y %H:%M:%S"
}
