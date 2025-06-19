#!/bin/bash
# Hyprland v0.48.0 installation script for Ubuntu
set -e

# 0. Precondition: Install dependencies
sudo apt update
sudo apt install -y meson wget build-essential ninja-build cmake-extras cmake gettext gettext-base fontconfig libfontconfig-dev libffi-dev libxml2-dev libdrm-dev libxkbcommon-x11-dev libxkbregistry-dev libxkbcommon-dev libpixman-1-dev libudev-dev libseat-dev seatd libxcb-dri3-dev libegl-dev libgles2 libegl1-mesa-dev glslang-tools libinput-bin libinput-dev libxcb-composite0-dev libavutil-dev libavcodec-dev libavformat-dev libxcb-ewmh2 libxcb-ewmh-dev libxcb-present-dev libxcb-icccm4-dev libxcb-render-util0-dev libxcb-res0-dev libxcb-xinput-dev libtomlplusplus3 libre2-dev

# 1. Install hyprscanner
sudo apt install -y hyprwayland-scanner

# 2. wayland-client
sudo apt install -y libwayland*

# 3. wayland-protocols
sudo apt install -y wayland-protocols

# 4. hyprutils >=0.5.2
git clone https://github.com/hyprwm/hyprutils.git || true
cd hyprutils/
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
cmake --build ./build --config Release --target all -j$(nproc 2>/dev/null || getconf NPROCESSORS_CONF)
sudo cmake --install build
cd ..

# 5. gbm
sudo apt install -y libgbm*

# 6. libdisplay-info
sudo apt install -y libdisplay*

# 7. Install aquamarine
git clone https://github.com/hyprwm/aquamarine || true
cd aquamarine
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
cmake --build ./build --config Release --target all -j$(nproc 2>/dev/null || getconf _NPROCESSORS_CONF)
cd ./build
sudo make install
cd ../..

# 8. hyprlang
sudo apt install -y libhyprlang*

# 9. hyprcursor
sudo apt install -y libhyprcursor*

# 10. cairo
sudo apt install -y libcairo*

# 11. libjpeg
sudo apt install -y libjpeg-dev

# 12. libwebp
sudo apt install -y libwebp-dev

# 13. libmagic
sudo apt install -y libmagic-dev

# 14. hyprgraphics
git clone https://github.com/hyprwm/hyprgraphics || true
cd hyprgraphics/
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
cmake --build ./build --config Release --target all -j$(nproc 2>/dev/null || getconf NPROCESSORS_CONF)
sudo cmake --install build
cd ..

# 15. pango
sudo apt install -y libpango*
# 16. pangocairo
sudo apt install -y libpangocairo*
# 17. xcursor
sudo apt install -y libxcursor*
# 18. xcb-errors
sudo apt install -y libxcb*
# 19. tomlplusplus
sudo apt install -y libtomlplusplus-dev
# 20. Hyprland-qtutils
sudo apt install -y qt6*
git clone https://github.com/hyprwm/hyprland-qtutils || true
cd hyprland-qtutils
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
cmake --build ./build --config Release --target all -j$(nproc 2>/dev/null || getconf NPROCESSORS_CONF)
cd ./build
sudo make install
cd ../..

# Clone and install Hyprland
git clone -b v0.48.0 https://github.com/hyprwm/Hyprland --recursive ~/Hyprland || true
cd ~/Hyprland
make all && sudo make install
cd -

# Ricing tools
sudo apt install -y neofetch tmux eza zoxide fzf
sudo apt install -y npm && sudo npm install yarn -g

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm || true
git clone https://github.com/locle97/nvim ~/.config/nvim || true

# Install lazygit
cd ~/Downloads/
wget https://github.com/jesseduffield/lazygit/releases/download/v0.52.0/lazygit_0.52.0_Linux_x86_64.tar.gz
tar -xzf lazygit_0.52.0_Linux_x86_64.tar.gz
rm ./lazygit_0.52.0_Linux_x86_64.tar.gz
mv lazygit ~/.local/bin/
cd -

# Install NerdFont
cd ~/Downloads
mkdir -p SourceCodePro && cd ./SourceCodePro
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/SourceCodePro.zip
unzip SourceCodePro.zip
mkdir -p ~/.local/share/fonts
mv ./*.ttf ~/.local/share/fonts/
fc-cache -f -v
cd -

# Oh-My-Posh
curl -s https://ohmyposh.dev/install.sh | bash -s

# Git config
git config user.email "lpl212757@gmail.com" -g
git config user.name "Loc Le" -g
git config credential.helper store -g

echo "Hyprland and related tools installation complete!"
