#!/bin/sh

curl -s https://api.github.com/repos/jgraph/drawio-desktop/releases/latest \
    | grep browser_download_url \
    | grep 'amd64\.deb' \
    | cut -d '"' -f 4 \
    | wget -i -
