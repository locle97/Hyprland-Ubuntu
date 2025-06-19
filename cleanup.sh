#!/bin/bash
set -e

# Hyprland-Ubuntu Cleanup Script
# This script removes build directories, source repos, and temporary files left after installation.

ROOT_DIR="$(pwd)"

log() {
  echo -e "\033[1;34m[INFO]\033[0m $1"
}

echo "[+] Starting cleanup..."

# Remove cloned source directories in workspace
for dir in hyprutils aquamarine hyprgraphics hyprland-qtutils wayland-protocols hyprwayland-scanner; do
  if [ -d "$ROOT_DIR/$dir" ]; then
    log "Removing $dir source directory."
    rm -rf "$ROOT_DIR/$dir"
  fi
done

# Remove Hyprland source from home if present
if [ -d "$HOME/Hyprland" ]; then
  log "Removing Hyprland source directory from home."
  rm -rf "$HOME/Hyprland"
fi

# Remove build folders inside source directories (if any remain)
for dir in hyprutils aquamarine hyprgraphics hyprland-qtutils wayland-protocols hyprwayland-scanner; do
  if [ -d "$ROOT_DIR/$dir/build" ]; then
    log "Removing build directory in $dir."
    rm -rf "$ROOT_DIR/$dir/build"
  fi
done

# Remove downloaded fonts and lazygit archives
if [ -d "$HOME/Downloads/SourceCodePro" ]; then
  log "Removing SourceCodePro font directory."
  rm -rf "$HOME/Downloads/SourceCodePro"
fi
if [ -f "$HOME/Downloads/lazygit_0.52.0_Linux_x86_64.tar.gz" ]; then
  log "Removing lazygit archive."
  rm -f "$HOME/Downloads/lazygit_0.52.0_Linux_x86_64.tar.gz"
fi

# Remove any leftover .git directories in workspace
find "$ROOT_DIR" -type d -name ".git" -exec rm -rf {} +

log "Cleanup complete."
echo "[+] Cleanup complete."
