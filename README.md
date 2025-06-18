# Install Hyprland v0.48.0 in Ubuntu


## Steps
0. Precondition

- Install dependencies from Hyprland installation page
```
sudo apt install -y meson wget build-essential ninja-build cmake-extras cmake gettext gettext-base fontconfig libfontconfig-dev libffi-dev libxml2-dev libdrm-dev libxkbcommon-x11-dev libxkbregistry-dev libxkbcommon-dev libpixman-1-dev libudev-dev libseat-dev seatd libxcb-dri3-dev libegl-dev libgles2 libegl1-mesa-dev glslang-tools libinput-bin libinput-dev libxcb-composite0-dev libavutil-dev libavcodec-dev libavformat-dev libxcb-ewmh2 libxcb-ewmh-dev libxcb-present-dev libxcb-icccm4-dev libxcb-render-util0-dev libxcb-res0-dev libxcb-xinput-dev libtomlplusplus3 libre2-dev
```

1. Install hyprscanner
```
sudo apt install hyprwayland-scanner
```

2. wayland-client
sudo apt install libwayland*

3. wayland-protocols
sudo apt install wayland-protocols

4. hyprutils>=0.5.2
git clone https://github.com/hyprwm/hyprutils.git
cd hyprutils/
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
cmake --build ./build --config Release --target all -j`nproc 2>/dev/null || getconf NPROCESSORS_CONF`
sudo cmake --install build

5. gbm
sudo apt install libgbm*

6. libdisplay-info
sudo apt install libdisplay*

7. Install aquamarine

```sh
git clone https://github.com/hyprwm/aquamarine
cd ./aquamarine
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
cmake --build ./build --config Release --target all -j`nproc 2>/dev/null || getconf _NPROCESSORS_CONF`
cd ./build
sudo make install
```

8. hyprlang
sudo apt install libhyprlang*

9. hyprcursor
sudo apt install libhyprcursor*

10. cairo
sudo apt install libcairo*

11. libjpeg
sudo apt install libjpeg-dev

12. libwebp
sudo apt install libwebp-dev

13. libmagic
sudo apt install libmagic-dev

14. hyprgraphics
git clone https://github.com/hyprwm/hyprgraphics
cd hyprgraphics/
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
cmake --build ./build --config Release --target all -j`nproc 2>/dev/null || getconf NPROCESSORS_CONF`
sudo cmake --install build

15. pango
sudo apt install libpango*
16. pangocairo
sudo apt install libpangocairo*

17. xcursor
sudo apt install libxcursor*

18. xcb-errors
sudo apt install libxcb*

19. tomlplusplus
sudo apt install libtomlplusplus-dev

20. Hyprland-qtutils
sudo apt install qt6*

```
git clone https://github.com/hyprwm/hyprland-qtutils
cd hyprland-qtutils
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
cmake --build ./build --config Release --target all -j`nproc 2>/dev/null || getconf NPROCESSORS_CONF`
cd ./build
sudo make install
cd -
```

n. Clone and install Hyprland
```sh
git clone -b v0.48.0 https://github.com/hyprwm/Hyprland --recursive ~/Hyprland
cd ~/Hyprland
make all && sudo make install

```

n+1. Ricing
- ghostty
- kitty
- wlsunset
- wl-clipboard
- Google-Chrome

- Oh-My-Posh
curl -s https://ohmyposh.dev/install.sh | bash -s

- NeoFetch
sudo apt install neofetch

- Tmux
sudo apt install tmux
- Tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

- npm && yarn
sudo apt install npm && sudo npm install yarn -g

- nvim
git clone https://github.com/locle97/nvim ~/.config/nvim

- lazygit
cd ~/Downloads/
wget https://github.com/jesseduffield/lazygit/releases/download/v0.52.0/lazygit_0.52.0_Linux_x86_64.tar.gz
tar -xzf lazygit_0.52.0_Linux_x86_64.tar.gz
rm ./lazygit_0.52.0_Linux_x86_64.tar.gz
mv lazygit ~/.local/bin/
cd -

- fzf zoxide eza
sudo apt install eza zoxide fzf

- waybar

- NerdFont
```
cd ~/Downloads
mkdir SourceCodePro && cd ./SourceCodePro
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/SourceCodePro.zip
unzip SourceCodePro.zip
mkdir ~/.local/share/fonts

mv ./*.ttf ~/.local/share/fonts/

fc-cache -f -v

cd -
```

- git config
```
git config user.email "lpl212757@gmail.com" -g
git config user.name "Loc Le" -g
git config credential.helper store -g
```
