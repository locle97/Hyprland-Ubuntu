#!/bin/bash
set -e
# Build and install from source: hyprutils, aquamarine, hyprgraphics, hyprland-qtutils, Hyprland

ROOT_DIR="$(pwd)"

log() {
  echo -e "\033[1;34m[INFO]\033[0m $1"
}

# hyprutils
log "Building hyprutils..."
if [ ! -d hyprutils ]; then
  log "Cloning hyprutils repository."
  git clone https://github.com/hyprwm/hyprutils.git
fi
pushd hyprutils > /dev/null
log "Configuring hyprutils with CMake."
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release \
  -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
log "Building hyprutils."
cmake --build ./build --config Release --target all -j$(nproc 2>/dev/null || getconf NPROCESSORS_CONF)
log "Installing hyprutils."
sudo cmake --install build
popd > /dev/null

# aquamarine
log "Building aquamarine..."
if [ ! -d aquamarine ]; then
  log "Cloning aquamarine repository."
  git clone https://github.com/hyprwm/aquamarine
fi
pushd aquamarine > /dev/null
log "Configuring aquamarine with CMake."
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release \
  -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
log "Building aquamarine."
cmake --build ./build --config Release --target all -j$(nproc 2>/dev/null || getconf _NPROCESSORS_CONF)
pushd build > /dev/null
log "Installing aquamarine."
sudo make install
popd > /dev/null
popd > /dev/null

# hyprgraphics
log "Building hyprgraphics..."
if [ ! -d hyprgraphics ]; then
  log "Cloning hyprgraphics repository."
  git clone https://github.com/hyprwm/hyprgraphics
fi
pushd hyprgraphics > /dev/null
log "Configuring hyprgraphics with CMake."
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release \
  -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
log "Building hyprgraphics."
cmake --build ./build --config Release --target all -j$(nproc 2>/dev/null || getconf NPROCESSORS_CONF)
log "Installing hyprgraphics."
sudo cmake --install build
popd > /dev/null

# hyprland-qtutils
log "Building hyprland-qtutils..."
if [ ! -d hyprland-qtutils ]; then
  log "Cloning hyprland-qtutils repository."
  git clone https://github.com/hyprwm/hyprland-qtutils
fi
pushd hyprland-qtutils > /dev/null
log "Configuring hyprland-qtutils with CMake."
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release \
  -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
log "Building hyprland-qtutils."
cmake --build ./build --config Release --target all -j$(nproc 2>/dev/null || getconf NPROCESSORS_CONF)
pushd build > /dev/null
log "Installing hyprland-qtutils."
sudo make install
popd > /dev/null
popd > /dev/null

# Hyprland
log "Building Hyprland..."
if [ ! -d ~/Hyprland ]; then
  log "Cloning Hyprland repository."
  git clone -b v0.48.0 https://github.com/hyprwm/Hyprland --recursive ~/Hyprland
fi
pushd ~/Hyprland > /dev/null
log "Building Hyprland."
make all
log "Installing Hyprland."
sudo make install
popd > /dev/null

cd "$ROOT_DIR"
log "All source builds completed."
