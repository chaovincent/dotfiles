#!/bin/sh

# Make user font directory if it doesn't exist
if [ ! -d "${HOME}/.local/share/fonts" ]; then
    mkdir -v "${HOME}/.local/share/fonts"
fi

echo "Downloading and installing font: VictorMono"

# Download
wget -P /tmp/ https://rubjo.github.io/victor-mono/VictorMonoAll.zip

# Unzip and install
unzip -d /tmp/VictorMonoAll /tmp/VictorMonoAll.zip
mv -v /tmp/VictorMonoAll/TTF/*.ttf ~/.local/share/fonts/

# Clear and regenerate font cache
fc-cache -f -v

# Cleanup
rm -r /tmp/VictorMonoAll.zip /tmp/VictorMonoAll/

