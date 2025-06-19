#!/bin/bash
set -e
# Install ricing tools and configs
sudo npm install yarn -g
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm || true
git clone https://github.com/locle97/nvim ~/.config/nvim || true

# Install lazygit
cd ~/Downloads/
wget https://github.com/jesseduffield/lazygit/releases/download/v0.52.0/lazygit_0.52.0_Linux_x86_64.tar.gz
tar -xzf lazygit_0.52.0_Linux_x86_64.tar.gz
rm ./lazygit_0.52.0_Linux_x86_64.tar.gz
mv lazygit ~/.local/bin/
cd -

# Oh-My-Posh
curl -s https://ohmyposh.dev/install.sh | bash -s
