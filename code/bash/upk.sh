#!/bin/bash # Tiltle: UPK aid app
# Bug: To run this app properly, you must cd into this directory, unless you find the absolute path to this

function f_grepReal_schedule {
	cd .../directkry of... upk - Diario 1
	grep "Dia:*" file
}

function f_grepMe {
	cat ./upk.sh > file
	grep img ./upk.sh
}

function f_ascii_logo {
	# Load upk-ascii-logo
	clear
	cat ./all/img/upk_ascii_logo
}

function f_findProperties {
	TERM_ROWS="$(tput lines)"
	TERM_COLS="$(tput cols)"
	
	echo "$TERM_ROWS, $TERMCOLS"
}

function f_exec {
	# Ask this app to reavel not ideal schedule, but real schedule done by the operator; f_grepReal_schedule
	f_ascii_logo
	f_grepMe
}
f_exec
