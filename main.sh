#!/bin/bash
set -e

bash ./install_deps.sh
bash ./build_from_source.sh
bash ./install_ricing.sh
bash ./install_fonts.sh
bash ./setup_git.sh

echo "Hyprland and related tools installation complete!"
