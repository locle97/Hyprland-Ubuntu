#!/bin/bash
set -e
# Build and install from source: hyprutils, aquamarine, hyprgraphics, hyprland-qtutils, Hyprland

ROOT_DIR="$(pwd)"

echo "[+] Starting build from source..."

log() {
  echo -e "\033[1;34m[INFO]\033[0m $1"
}

# hyprutils
log "Building hyprutils..."
echo "[+] Building hyprutils..."
if [ ! -d hyprutils ]; then
  log "Cloning hyprutils repository."
  echo "[+] Cloning hyprutils repository."
  git clone https://github.com/hyprwm/hyprutils.git
fi
pushd hyprutils > /dev/null
log "Configuring hyprutils with CMake."
echo "[+] Configuring hyprutils with CMake."
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release \
  -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
log "Building hyprutils."
echo "[+] Building hyprutils (make)..."
cmake --build ./build --config Release --target all -j$(nproc 2>/dev/null || getconf NPROCESSORS_CONF)
log "Installing hyprutils."
echo "[+] Installing hyprutils..."
sudo cmake --install build
popd > /dev/null

echo "[+] hyprutils done."

# aquamarine
log "Building aquamarine..."
echo "[+] Building aquamarine..."
if [ ! -d aquamarine ]; then
  log "Cloning aquamarine repository."
  echo "[+] Cloning aquamarine repository."
  git clone https://github.com/hyprwm/aquamarine
fi
pushd aquamarine > /dev/null
log "Configuring aquamarine with CMake."
echo "[+] Configuring aquamarine with CMake."
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release \
  -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
log "Building aquamarine."
echo "[+] Building aquamarine (make)..."
cmake --build ./build --config Release --target all -j$(nproc 2>/dev/null || getconf _NPROCESSORS_CONF)
pushd build > /dev/null
log "Installing aquamarine."
echo "[+] Installing aquamarine..."
sudo make install
popd > /dev/null
popd > /dev/null

echo "[+] aquamarine done."

# hyprgraphics
log "Building hyprgraphics..."
echo "[+] Building hyprgraphics..."
if [ ! -d hyprgraphics ]; then
  log "Cloning hyprgraphics repository."
  echo "[+] Cloning hyprgraphics repository."
  git clone https://github.com/hyprwm/hyprgraphics
fi
pushd hyprgraphics > /dev/null
log "Configuring hyprgraphics with CMake."
echo "[+] Configuring hyprgraphics with CMake."
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release \
  -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
log "Building hyprgraphics."
echo "[+] Building hyprgraphics (make)..."
cmake --build ./build --config Release --target all -j$(nproc 2>/dev/null || getconf NPROCESSORS_CONF)
log "Installing hyprgraphics."
echo "[+] Installing hyprgraphics..."
sudo cmake --install build
popd > /dev/null

echo "[+] hyprgraphics done."

# hyprland-qtutils
log "Building hyprland-qtutils..."
echo "[+] Building hyprland-qtutils..."
if [ ! -d hyprland-qtutils ]; then
  log "Cloning hyprland-qtutils repository."
  echo "[+] Cloning hyprland-qtutils repository."
  git clone https://github.com/hyprwm/hyprland-qtutils
fi
pushd hyprland-qtutils > /dev/null
log "Configuring hyprland-qtutils with CMake."
echo "[+] Configuring hyprland-qtutils with CMake."
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release \
  -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
log "Building hyprland-qtutils."
echo "[+] Building hyprland-qtutils (make)..."
cmake --build ./build --config Release --target all -j$(nproc 2>/dev/null || getconf NPROCESSORS_CONF)
pushd build > /dev/null
log "Installing hyprland-qtutils."
echo "[+] Installing hyprland-qtutils..."
sudo make install
popd > /dev/null
popd > /dev/null

echo "[+] hyprland-qtutils done."

# Hyprland
log "Building Hyprland..."
echo "[+] Building Hyprland..."
if [ ! -d ~/Hyprland ]; then
  log "Cloning Hyprland repository."
  echo "[+] Cloning Hyprland repository."
  git clone -b v0.48.0 https://github.com/hyprwm/Hyprland --recursive ~/Hyprland
fi
pushd ~/Hyprland > /dev/null
log "Building Hyprland."
echo "[+] Building Hyprland (make)..."
make all
log "Installing Hyprland."
echo "[+] Installing Hyprland..."
sudo make install
popd > /dev/null

echo "[+] Hyprland build done."

cd "$ROOT_DIR"
echo "[+] All source builds completed."
log "All source builds completed."
