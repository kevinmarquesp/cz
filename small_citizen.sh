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
			echo "${BASH_SOURCE} - v0.4.0"
			echo
			echo "I was anoyed that the cz-emoji tool was written in Javascript"
			echo "and depends on NPM, PNPM or whatever you use to manage your node"
			echo "packages, so I made my own commit cittizen script with emoji"
			echo "support using only bash and some system utilities. Feel free"
			echo "to contribute at https://github.com/kevinmarquesp/committizen_emoji_sh"
			echo
			echo "Command Options:"
			echo "  -h --help         Displays this help message."
			echo "  -a --ammend       Ammends the commit to the last one"
			echo "  -d --description  Ask for a longer description after commit"
			echo "  -j --json [PATH]  Path to the types.json file with the commit types."
			echo "                      (Current setted as ${types_json})"
			echo
			echo "Context Prompt:"
			echo "  A helper information that helps the developer know what the"
			echo "  commit message is related to. Could be a file name or a custom"
			echo "  tag, for an example."
			echo
			echo "Commit Prompt:"
			echo "  The commit message (duh) that git will use to commit the current"
			echo "  changes. It's recommended that this message has less than 80"
			echo "  characters length, you need to be specific."
			echo
			echo "Description Prompt:  (optional)"
			echo "  If you've setted the -d or --description flag on the command"
			echo "  this script will ask for another message to put in the commit"
			echo "  body. Use this to detail what this changes does and warnings."
			echo
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
