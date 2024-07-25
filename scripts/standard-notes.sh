#!/bin/sh

FILENAME="standard-notes-3.193.10-linux-x86_64.AppImage"
OUTPUT_PATH="/home/${USER}/.local/bin/standard-notes"

if [ ! -f ${FILENAME} ]; then
    wget https://github.com/standardnotes/app/releases/download/%40standardnotes/desktop%403.193.10/${FILENAME} -O ${OUTPUT_PATH}
    chmod a+x ${OUTPUT_PATH}
fi
