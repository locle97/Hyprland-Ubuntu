#!/bin/bash
set -e
# Install NerdFont SourceCodePro
cd ~/Downloads
mkdir -p SourceCodePro && cd ./SourceCodePro
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/SourceCodePro.zip
unzip SourceCodePro.zip
mkdir -p ~/.local/share/fonts
mv ./*.ttf ~/.local/share/fonts/
fc-cache -f -v
cd -
