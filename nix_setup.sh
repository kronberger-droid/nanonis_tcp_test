#!/bin/bash

set -e  # Exit on any error

echo "Starting setup..."

# Clone the repository
echo "Cloning nanonis_tcp_test repository..."
git clone https://github.com/kronberger-droid/nanonis_tcp_test

# Install Nix
echo "Installing Nix..."
curl -L https://nixos.org/nix/install | sh

# Configure Nix for flakes
echo "Configuring Nix for flakes and new commands..."
mkdir -p ~/.config/nix
echo "experimental-features = nix-command flakes" > ~/.config/nix/nix.conf

# Source Nix environment
echo "Setting up Nix environment..."
if [ -f ~/.nix-profile/etc/profile.d/nix.sh ]; then
    . ~/.nix-profile/etc/profile.d/nix.sh
    echo '. ~/.nix-profile/etc/profile.d/nix.sh' >> ~/.bashrc
fi

echo "Setup complete!"
echo "Please restart your shell or run: source ~/.bashrc"
echo "Then you can use Nix commands and flakes."
