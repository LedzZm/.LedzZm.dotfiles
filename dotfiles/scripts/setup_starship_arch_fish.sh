#!/usr/bin/env bash

set -e

REPO_URL="https://github.com/LedzZm/.LedzZm.dotfiles"
CLONE_DIR="$HOME/.LedzZm.dotfiles"
STARSHIP_TOML="$HOME/.config/starship.toml"
FISH_CONFIG="$HOME/.config/fish/config.fish"

sudo pacman -S --needed --noconfirm starship

mkdir -p "$HOME/.config/fish"

# Checking if fish shell is installed
if ! command -v fish &>/dev/null; then
  echo "Error: fish shell is not installed. Exiting."
  exit 1
fi

if [ -d "$CLONE_DIR" ]; then
  echo "Updating starship config."
  git -C "$CLONE_DIR" pull
else
  git clone "$REPO_URL" "$CLONE_DIR"
fi

# Overwriting starship config (Symlinking from cloned config).
echo "Symlinking starship.toml to $STARSHIP_TOML"
ln -sf "$CLONE_DIR/starship.toml" "$STARSHIP_TOML"
# Configure fish to init starship.
if ! grep -q "starship init fish" "$FISH_CONFIG" 2>/dev/null; then
  echo "Adding the starship init script to fish config."
  printf "\n# Should better be kept at the end of the file\nstarship init fish | source" >>"$FISH_CONFIG"
fi
