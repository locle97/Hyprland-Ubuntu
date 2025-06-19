#!/bin/bash
set -e
echo "[+] Installing NerdFont SourceCodePro..."
cd ~/Downloads
mkdir -p SourceCodePro && cd ./SourceCodePro
echo "[+] Downloading SourceCodePro.zip..."
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/SourceCodePro.zip
echo "[+] Unzipping SourceCodePro.zip..."
unzip SourceCodePro.zip
echo "[+] Moving fonts to ~/.local/share/fonts..."
mkdir -p ~/.local/share/fonts
mv ./*.ttf ~/.local/share/fonts/
echo "[+] Updating font cache..."
fc-cache -f -v
cd -
echo "[+] NerdFont installation complete."
