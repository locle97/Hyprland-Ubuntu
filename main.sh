#!/bin/bash
set -e

echo "[+] Running install_deps.sh..."
bash ./install_deps.sh
echo "[+] Running build_from_source.sh..."
bash ./build_from_source.sh
echo "[+] Running install_ricing.sh..."
bash ./install_ricing.sh
echo "[+] Running install_fonts.sh..."
bash ./install_fonts.sh
echo "[+] Running setup_git.sh..."
bash ./setup_git.sh

echo "Hyprland and related tools installation complete!"
