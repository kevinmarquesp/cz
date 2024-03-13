#!/usr/bin/env bash

## ARGUMENT PARSER
## 	For this application, the arguments should'b be so flexible, because it has
##  a specific propurse. No need to put too much arguments

OPTIONS="h,a,d,j:"
LONG_OPTIONS="help,ammend,description,json:"

eval -- set -- $(getopt --name "${BASH_SOURCE}" --options "${OPTIONS}" \
						--longoptions "${LONG_OPTIONS}" -- "${@}")
unset OPTIONS LONG_OPTIONS

## OPTIONS SETUP
## 	This section will asing/overwrite values to the options variables, most of
##  is bolean variables that the script will use to know how to build the git
##  commit command

is_ammend=0
is_description=0
types_json="${HOME}/.local/share/committizen_emoji_sh/types.json"

while true
do
	case "${1}" in
		#todo: write a good help command

		"-h" | "--help")
			echo
			echo "${BASH_SOURCE} - v0.3.0"
			echo
			echo ""
			exit
		;;

		"-a" | "--amend")
			is_ammend=1
			shift
		;;

		"-d" | "--description")
			is_description=1
			shift
		;;

		"-j" | "--json")
			types_json="${2}"
			shift 2
		;;

		"--")
			break
		;;
	esac
done
