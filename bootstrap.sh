#!/bin/bash

set -e

REPO_URL="https//github.com/chaovincent/dotfiles.git"
DOTFILES_DIR="$(git rev-parse --show-toplevel)"
PACKAGES=(
    bash
    git
    mpv
    nvim
    tmux
    wezterm
    # AwesomeWM
    awesome
    nitrogen
    rofi
)

# Create ${HOME}/.config if it doesn't exist
if [ ! -d "${HOME}/.config" ]; then
    mkdir -pv "${HOME}/.config"
fi

echo "========================================"
echo " Bootstrapping Dotfiles Environment"
echo "========================================"

# 1. Ensure dependencies are installed
if ! command -v git &> /dev/null || ! command -v stow &> /dev/null; then
    echo "Git or Store is missing. Installing core dependencies..."
    if command -v apt &> /dev/null; then
        sudo apt update && sudo apt install -y git stow
    else
	echo "Please install git and stow manually, then re-run."
	exit 1
    fi
fi
    

# 2. Clone the repository
if [ ! -d "$DOTFILES_DIR" ]; then
    echo "--> Cloning repository into '$DOTFILES_DIR'..."
    git clone "$REPO_URL" "$DOTFILES_DIR"
else
    echo "--> Repository already exists. Pulling latest..."
    # cd "$DOTFILES_DIR" && git pull
fi

cd "$DOTFILES_DIR"

# 3. Handle conflicts
if [ -f "$HOME/.bashrc" ] && [ ! -L "$HOME/.bashrc" ]; then
    mv "$HOME/.bashrc" "$HOME/.bashrc.bak"
    echo "    Backed up ~/.bashrc"
fi

# 4. Stow the core packages
echo "--> Stowing packages..."
stow -t ~ "${PACKAGES[@]}"

# 5. (Optional) Trigger the binary installer
if [ -f "$DOTFILES_DIR/install.sh" ]; then
    read -p "Run the interactive package installer now? [y/N]: " run_install
    if [[ "$run_install" =~ ^[Yy]$ ]]; then
        bash "$DOTFILES_DIR/install.sh"
    fi
fi

# 6. Source updated shell config
source "$HOME/.bashrc"

echo "========================================"
echo " Bootstrap complete!"
echo "========================================"
