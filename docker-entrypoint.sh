#!/bin/bash

set -e

# if command starts with an option, prepend transmission-daemon
if [ "${1:0:1}" = '-' ]; then
	set -- transmission-daemon -u ${TRANSMISSION_USER} -v ${TRANSMISSION_PASSWORD} "$@"
fi

exec "$@"

