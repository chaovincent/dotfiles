#!/bin/bash

DOTFILES_DIR="$(git rev-parse --show-toplevel)"
SCRIPTS_DIR="${DOTFILES_DIR}/.scripts"
PACKAGES=(
    neofetch
    neovim
)

# Create ${HOME}/.config if it doesn't exist
if [ ! -d "${HOME}/.config" ]; then
    mkdir -pv "${HOME}/.config"
fi

# Create ${HOME}/.local/bin if it doesn't exist
if [ ! -d "${HOME}/.local/bin" ]; then
    mkdir -pv "${HOME}/.local/bin"
fi

echo "========================================"
echo " Modular Package Installer"
echo "========================================"

# 1. Run the base system installs (e.g. `apt`)
sudo apt install "${PACKAGES[@]}"

echo "========================================"
echo " Optional Binary & Toolchain Setups:"
echo "========================================"

# 2. Dynamically discover and prompt for modular scripts
for script in "${SCRIPTS_DIR}/install_*.sh"; do
    # Skip if no scripts are found
    [ -e "$script" ] || continue

    # Extract a clean name from the filename (e.g. install_rust.sh -> rust)
    tool_name=$(basename "$script" | sed 's/install_//' | sed 's/\.sh//')

    read -p "Run setup for '$tool_name'? [y/N]: " choice
    if [[ "$choice" =~ ^[Yy]$ ]]; then
        echo "--> Executing '$script'..."
	bash $script
	echo "--> '$tool_name' setup complete."
    fi
done

echo "========================================"
echo " Installation Complete!"
echo "========================================"
