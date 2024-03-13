#!/usr/bin/env bash

OPTIONS="h,a,d,j:"
LONG_OPTIONS="help,ammend,description,json:"

eval -- set -- $(getopt --name "${BASH_SOURCE}" --options "${OPTIONS}" \
						--longoptions "${LONG_OPTIONS}" -- "${@}")

unset OPTIONS LONG_OPTIONS

