#!/bin/bash
set -e
echo "[+] Installing ricing tools and configs..."
sudo npm install yarn -g
echo "[+] Installing fish shell..."
sudo apt update && sudo apt install -y fish
echo "[+] Changing default shell to fish for user $USER..."
chsh -s /usr/bin/fish

echo "[+] Cloning tmux plugin manager..."
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm || true
echo "[+] Cloning nvim config..."
git clone https://github.com/locle97/nvim ~/.config/nvim || true

echo "[+] Installing lazygit..."
cd ~/Downloads/
wget https://github.com/jesseduffield/lazygit/releases/download/v0.52.0/lazygit_0.52.0_Linux_x86_64.tar.gz
tar -xzf lazygit_0.52.0_Linux_x86_64.tar.gz
rm ./lazygit_0.52.0_Linux_x86_64.tar.gz
if [ ! -d ~/.local/bin ]; then
  mkdir -p ~/.local/bin
fi
mv lazygit ~/.local/bin/
cd -

echo "[+] Installing Oh-My-Posh..."
curl -s https://ohmyposh.dev/install.sh | bash -s
echo "[+] Ricing tools installation complete."
