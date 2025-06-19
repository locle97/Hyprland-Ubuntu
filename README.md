# Hyprland v0.48.0 Automated Installation for Ubuntu

This repository provides scripts to automate the installation of Hyprland v0.48.0 and related tools on Ubuntu. The process includes building key components from source, installing dependencies, setting up ricing tools, fonts, and configuring your development environment.

---

## Quick Start

1. **Clone this repository:**
   ```sh
   git clone <this-repo-url> && cd Hyprland-Ubuntu
   ```

2. **Run the main installation script:**
   ```sh
   chmod +x main.sh
   ./main.sh
   ```
   This will sequentially:
   - Install all required dependencies
   - Build Hyprland and related components from source
   - Install ricing tools and fonts
   - Set up git configuration

---

## Script Overview

- `main.sh` — Orchestrates the full installation process.
- `install_deps.sh` — Installs all required system dependencies via `apt`.
- `build_from_source.sh` — Clones and builds Hyprland, hyprutils, aquamarine, hyprgraphics, hyprland-qtutils from source.
- `install_ricing.sh` — Installs ricing tools (e.g., tmux, nvim config, lazygit, Oh-My-Posh).
- `install_fonts.sh` — Installs NerdFont (SourceCodePro) for a better terminal experience.
- `setup_git.sh` — Sets up global git configuration.

---

## What Gets Installed

- **Hyprland v0.48.0** (from source)
- **hyprutils, aquamarine, hyprgraphics, hyprland-qtutils** (from source)
- **Wayland, wayland-protocols, hyprwayland-scanner, hyprlang, hyprcursor, cairo, pango, pangocairo, xcursor, xcb, tomlplusplus, qt6, and more**
- **Ricing tools:**
  - Oh-My-Posh
  - NeoFetch
  - Tmux + TPM
  - nvim config
  - lazygit
  - eza, zoxide, fzf
- **NerdFont (SourceCodePro)**
- **Git global config**

---

## Customization & Notes

- All scripts are idempotent and can be re-run safely.
- You can run individual scripts if you only want to install a subset of tools.
- The scripts assume a fresh Ubuntu installation and may install a large number of packages.
- Hyprland is cloned to `~/Hyprland` by default.

---

## Troubleshooting

- If you encounter build errors, ensure all dependencies are installed and your system is up to date.
- For issues with fonts or ricing tools, re-run the respective script.
- For advanced configuration, edit the scripts as needed.

---

## Credits

- [Hyprland](https://github.com/hyprwm/Hyprland)
- [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts)
- [Oh-My-Posh](https://ohmyposh.dev)
- [lazygit](https://github.com/jesseduffield/lazygit)
- [locle97/nvim](https://github.com/locle97/nvim)

---

**Enjoy your new Hyprland setup!**
