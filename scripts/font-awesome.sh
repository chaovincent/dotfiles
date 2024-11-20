#!/bin/sh

echo "Downloading and installing font: Awesome"

FONT_PATH="/tmp/font-awesome.deb"

wget -O $FONT_PATH http://ftp.de.debian.org/debian

sudo apt install $FONT_PATH

# Cleanup
rm $FONT_PATH

