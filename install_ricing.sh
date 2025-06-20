#!/bin/bash
set -e
echo "[+] Installing ricing tools and configs..."

# 1. Install terminal emulators and utilities
sudo apt update
sudo apt install -y kitty wlsunset wl-clipboard waybar neofetch tmux eza zoxide fzf npm

# Install latest ghostty
GHOSTTY_URL=$(curl -s https://api.github.com/repos/ghostty-org/ghostty/releases/latest | grep browser_download_url | grep linux-x86_64 | grep -v .sig | cut -d '"' -f 4 | head -n 1)
echo "[+] Downloading ghostty from $GHOSTTY_URL"
curl -L "$GHOSTTY_URL" -o /tmp/ghostty.tar.gz
tar -xzf /tmp/ghostty.tar.gz -C /tmp/
GHOSTTY_BIN=$(find /tmp -type f -path "/tmp/ghostty-*-linux-x86_64/ghostty" | head -n 1)
sudo mv "$GHOSTTY_BIN" /usr/local/bin/ghostty
sudo chmod +x /usr/local/bin/ghostty

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

# 8. Build and install latest hypridle from source
if [ ! -d hypridle ]; then
  git clone https://github.com/hyprwm/hypridle.git
fi
cd hypridle
cmake -B build -DCMAKE_BUILD_TYPE=Release
cmake --build build -j$(nproc)
sudo cmake --install build
cd ..
echo "[+] hypridle (latest) installed."

# 9. Build and install latest hyprlock from source
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
