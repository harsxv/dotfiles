#!/bin/bash

echo "Installing custom CLI applications..."

# Fisher (for Fish shell)
if ! fish -c "fisher --version" &>/dev/null; then
    echo "Installing Fisher..."
    curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
else
    echo "Fisher is already installed, skipping..."
fi

# Z (for Fish shell)
echo "Installing Z..."
fisher install jethrokuan/z

echo "Custom CLI applications installed!"
