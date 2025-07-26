#!/bin/env bash

#
# Download the current version of Discord's compressed tarball.
#

DISCORD_URL='https://discord.com/api/download/stable?platform=linux&format=tar.gz'
REDIRECT_URL=$(curl ${DISCORD_URL} 2> /dev/null | awk -F "https" '{print $2}' | sed -e 's/\:\/\//https\:\/\//' -e 's/\">//')
DISCORD_TARBALL=$(echo ${REDIRECT_URL} | awk -F '/' '{print $7}')

curl -o ${DISCORD_TARBALL} ${REDIRECT_URL}
