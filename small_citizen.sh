#!/usr/bin/env bash

## ARGUMENT PARSER
## 	For this application, the arguments should'b be so flexible, because it has
##  a specific propurse. No need to put too much arguments

OPTIONS="h,a,d,j:"
LONG_OPTIONS="help,ammend,description,json:"

eval -- set -- $(getopt --name "${BASH_SOURCE}" --options "${OPTIONS}" \
						--longoptions "${LONG_OPTIONS}" -- "${@}")
unset OPTIONS LONG_OPTIONS

