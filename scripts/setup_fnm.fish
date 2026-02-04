#!/usr/bin/env fish

echo "Installing FNM (Fast Node Manager)..."

# Install FNM
if not type -q fnm
    echo "Installing fnm."
    curl -fsSL https://fnm.vercel.app/install | bash
else
    echo "fnm already installed."
end
source "$HOME/.config/fish/conf.d/fnm.fish"

# Adding fnm completions to fish config.
fnm completions --shell fish >$HOME/.config/fish/completions/fnm.fish
# Install latest node.
fnm install --lts
