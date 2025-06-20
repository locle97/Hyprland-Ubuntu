#!/bin/bash
# Hyprland v0.48.0 installation script for Ubuntu
set -e

echo "[+] Installing dependencies..."
# 0. Precondition: Install dependencies
sudo apt update
echo "[+] Installing apt packages..."
sudo apt install -y meson wget build-essential ninja-build cmake-extras cmake gettext gettext-base fontconfig libfontconfig-dev libffi-dev libxml2-dev libdrm-dev libxkbcommon-x11-dev libxkbregistry-dev libxkbcommon-dev libpixman-1-dev libudev-dev libseat-dev seatd libxcb-dri3-dev libegl-dev libgles2 libegl1-mesa-dev glslang-tools libinput-bin libinput-dev libxcb-composite0-dev libavutil-dev libavcodec-dev libavformat-dev libxcb-ewmh2 libxcb-ewmh-dev libxcb-present-dev libxcb-icccm4-dev libxcb-render-util0-dev libxcb-res0-dev libxcb-xinput-dev libtomlplusplus3 libre2-dev

echo "[+] Building hyprwayland-scanner v0.40 from source..."
# 1. Build hyprwayland-scanner v0.40 from source
git clone --depth 1 https://github.com/hyprwm/hyprwayland-scanner.git || true
cd hyprwayland-scanner
cmake -B build -DCMAKE_BUILD_TYPE=Release
cmake --build build -j$(nproc)
sudo cmake --install build
cd ..
echo "[+] hyprwayland-scanner v0.40 installed."

echo "[+] Installing wayland-client..."
# 2. wayland-client
sudo apt install -y libwayland*

echo "[+] Building wayland-protocols (latest) from source..."
# 3. Build wayland-protocols (latest) from source
git clone --depth 1 https://gitlab.freedesktop.org/wayland/wayland-protocols.git || true
cd wayland-protocols
meson setup build --prefix=/usr
ninja -C build
sudo ninja -C build install
cd ..
echo "[+] wayland-protocols (latest) installed."

echo "[+] Building hyprutils..."
# 4. hyprutils >=0.5.2
git clone https://github.com/hyprwm/hyprutils.git || true
cd hyprutils/
echo "[+] Configuring hyprutils with CMake..."
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
echo "[+] Building hyprutils..."
cmake --build ./build --config Release --target all -j$(nproc 2>/dev/null || getconf NPROCESSORS_CONF)
echo "[+] Installing hyprutils..."
sudo cmake --install build
cd ..

echo "[+] Installing gbm..."
# 5. gbm
sudo apt install -y libgbm*

echo "[+] Installing libdisplay-info..."
# 6. libdisplay-info
sudo apt install -y libdisplay*

echo "[+] Building aquamarine..."
# 7. Install aquamarine
git clone https://github.com/hyprwm/aquamarine || true
cd aquamarine
echo "[+] Configuring aquamarine with CMake..."
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
echo "[+] Building aquamarine..."
cmake --build ./build --config Release --target all -j$(nproc 2>/dev/null || getconf _NPROCESSORS_CONF)
cd ./build
echo "[+] Installing aquamarine..."
sudo make install
cd ../..

echo "[+] Installing hyprlang..."
# 8. hyprlang
sudo apt install -y libhyprlang*

echo "[+] Installing hyprcursor..."
# 9. hyprcursor
sudo apt install -y libhyprcursor*

echo "[+] Installing cairo..."
# 10. cairo
sudo apt install -y libcairo*

echo "[+] Installing libjpeg..."
# 11. libjpeg
sudo apt install -y libjpeg-dev

echo "[+] Installing libwebp..."
# 12. libwebp
sudo apt install -y libwebp-dev

echo "[+] Installing libmagic..."
# 13. libmagic
sudo apt install -y libmagic-dev

echo "[+] Building hyprgraphics..."
# 14. hyprgraphics
git clone https://github.com/hyprwm/hyprgraphics || true
cd hyprgraphics/
echo "[+] Configuring hyprgraphics with CMake..."
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
echo "[+] Building hyprgraphics..."
cmake --build ./build --config Release --target all -j$(nproc 2>/dev/null || getconf NPROCESSORS_CONF)
echo "[+] Installing hyprgraphics..."
sudo cmake --install build
cd ..

echo "[+] Installing pango..."
# 15. pango
sudo apt install -y libpango*
echo "[+] Installing pangocairo..."
# 16. pangocairo
sudo apt install -y libpangocairo*
echo "[+] Installing xcursor..."
# 17. xcursor
sudo apt install -y libxcursor*
echo "[+] Installing xcb-errors..."
# 18. xcb-errors
sudo apt install -y libxcb*
echo "[+] Installing tomlplusplus..."
# 19. tomlplusplus
sudo apt install -y libtomlplusplus-dev
echo "[+] Building Hyprland-qtutils..."
# 20. Hyprland-qtutils
sudo apt install -y qt6*
git clone https://github.com/hyprwm/hyprland-qtutils || true
cd hyprland-qtutils
echo "[+] Configuring hyprland-qtutils with CMake..."
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
echo "[+] Building hyprland-qtutils..."
cmake --build ./build --config Release --target all -j$(nproc 2>/dev/null || getconf NPROCESSORS_CONF)
cd ./build
echo "[+] Installing hyprland-qtutils..."
sudo make install
cd ../..

echo "[+] Cloning and installing Hyprland..."
# Clone and install Hyprland
git clone -b v0.48.0 https://github.com/hyprwm/Hyprland --recursive ~/Hyprland || true
cd ~/Hyprland
echo "[+] Building Hyprland..."
make all && sudo make install
cd -

echo "[+] Installing ricing tools..."
# Ricing tools
sudo apt install -y neofetch tmux eza zoxide fzf
echo "[+] Installing npm and yarn..."
sudo apt install -y npm && sudo npm install yarn -g

echo "[+] Cloning tmux and nvim configs..."
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm || true
git clone https://github.com/locle97/nvim ~/.config/nvim || true

echo "[+] Installing lazygit..."
# Install lazygit
cd ~/Downloads/
wget https://github.com/jesseduffield/lazygit/releases/download/v0.52.0/lazygit_0.52.0_Linux_x86_64.tar.gz
tar -xzf lazygit_0.52.0_Linux_x86_64.tar.gz
rm ./lazygit_0.52.0_Linux_x86_64.tar.gz
mv lazygit ~/.local/bin/
cd -

echo "[+] Installing NerdFont..."
# Install NerdFont
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

echo "[+] Installing Oh-My-Posh..."
# Oh-My-Posh
curl -s https://ohmyposh.dev/install.sh | bash -s

echo "[+] Setting up git config..."
# Git config
git config user.email "lpl212757@gmail.com" -g
git config user.name "Loc Le" -g
git config credential.helper store -g

echo "Hyprland and related tools installation complete!"
