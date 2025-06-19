#!/bin/bash
set -e
# Install all apt dependencies for Hyprland and related tools
sudo apt update
sudo apt install -y \
  meson wget build-essential ninja-build cmake-extras cmake gettext \
  gettext-base fontconfig libfontconfig-dev libffi-dev libxml2-dev \
  libdrm-dev libxkbcommon-x11-dev libxkbregistry-dev libxkbcommon-dev \
  libpixman-1-dev libudev-dev libseat-dev seatd libxcb-dri3-dev \
  libegl-dev libgles2 libegl1-mesa-dev glslang-tools libinput-bin \
  libinput-dev libxcb-composite0-dev libavutil-dev libavcodec-dev \
  libavformat-dev libxcb-ewmh2 libxcb-ewmh-dev libxcb-present-dev \
  libxcb-icccm4-dev libxcb-render-util0-dev libxcb-res0-dev \
  libxcb-xinput-dev libtomlplusplus3 libre2-dev hyprwayland-scanner \
  libwayland* wayland-protocols libgbm* libdisplay* libhyprlang* \
  libhyprcursor* libcairo* libjpeg-dev libwebp-dev libmagic-dev \
  libpango* libpangocairo* libxcursor* libxcb* libtomlplusplus-dev \
  qt6* neofetch tmux eza zoxide fzf npm
