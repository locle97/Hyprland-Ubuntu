#!/bin/bash
set -e
echo "[+] Installing ricing tools and configs..."

# 1. Install terminal emulators and utilities
sudo apt update
sudo apt install -y kitty wlsunset wl-clipboard waybar neofetch tmux eza zoxide fzf npm

# Install latest ghostty
GHOSTTY_DEB_URL="https://github.com/mkasberg/ghostty-ubuntu/releases/download/1.1.3-0-ppa2/ghostty_1.1.3-0.ppa2_amd64_24.10.deb"
GHOSTTY_DEB="/tmp/ghostty.deb"
echo "[+] Downloading ghostty from $GHOSTTY_DEB_URL"
wget -O "$GHOSTTY_DEB" "$GHOSTTY_DEB_URL"
sudo apt install -y "$GHOSTTY_DEB" || sudo dpkg -i "$GHOSTTY_DEB"
sudo apt-get install -f -y

# Install latest google-chrome-stable
# Download and install the latest Google Chrome .deb package
CHROME_DEB=/tmp/google-chrome-stable_current_amd64.deb
echo "[+] Downloading Google Chrome..."
curl -L -o "$CHROME_DEB" https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install -y "$CHROME_DEB" || sudo dpkg -i "$CHROME_DEB"
sudo apt-get install -f -y

# 2. Install yarn
sudo npm install yarn -g

# 3. Install fish shell and set as default
sudo apt install -y fish
chsh -s /usr/bin/fish

# 4. Oh-My-Posh
curl -s https://ohmyposh.dev/install.sh | bash -s

# 5. Tmux plugin manager
if [ ! -d ~/.tmux/plugins/tpm ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm || true
fi

# 6. nvim config
if [ ! -d ~/.config/nvim ]; then
  git clone https://github.com/locle97/nvim ~/.config/nvim || true
fi

# 7. lazygit
cd ~/Downloads/
wget https://github.com/jesseduffield/lazygit/releases/download/v0.52.0/lazygit_0.52.0_Linux_x86_64.tar.gz
if [ -f lazygit_0.52.0_Linux_x86_64.tar.gz ]; then
  tar -xzf lazygit_0.52.0_Linux_x86_64.tar.gz
  rm lazygit_0.52.0_Linux_x86_64.tar.gz
  mkdir -p ~/.local/bin
  mv lazygit ~/.local/bin/
fi
cd -

# 8. Build and install hyprlang from source
if [ ! -d hyprlang ]; then
  git clone https://github.com/hyprwm/hyprlang.git
fi
cd hyprlang
cmake -B build -DCMAKE_BUILD_TYPE=Release
cmake --build build -j$(nproc)
sudo cmake --install build
cd ..
echo "[+] hyprlang (latest) installed."

# 9. Install sdbus-c++ using apt
sudo apt install -y libsdbus-c++-dev

# 10. Build and install hyprland-protocols from source
if [ ! -d hyprland-protocols ]; then
  git clone https://github.com/hyprwm/hyprland-protocols.git
fi
cd hyprland-protocols
meson setup build
sudo meson install -C build
cd ..
echo "[+] hyprland-protocols (latest) installed."

# 11. Build and install latest hypridle from source
if [ ! -d hypridle ]; then
  git clone https://github.com/hyprwm/hypridle.git
fi
cd hypridle
cmake -B build -DCMAKE_BUILD_TYPE=Release
cmake --build build -j$(nproc)
sudo cmake --install build
cd ..
echo "[+] hypridle (latest) installed."

# 12. Build and install latest hyprlock from source
if [ ! -d hyprlock ]; then
  git clone https://github.com/hyprwm/hyprlock.git
fi
cd hyprlock
cmake -B build -DCMAKE_BUILD_TYPE=Release
cmake --build build -j$(nproc)
sudo cmake --install build
cd ..
echo "[+] hyprlock (latest) installed."

echo "[+] Ricing tools installation complete."
