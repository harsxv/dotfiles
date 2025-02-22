#!/bin/bash

# Check Homebrew is installed
if ! command -v brew &>/dev/null; then
    echo "Homebrew not found. Installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update Homebrew
echo "Updating Homebrew..."
brew update

# Brew Packages
echo "Installing packages..."
while IFS= read -r package; do
    [[ -z "$package" || "$package" =~ ^# ]] && continue
    if brew list --formula | grep -q "^$package\$"; then
        echo "$package is already installed, skipping..."
    else
        brew install "$package"
    fi
done < brew-packages.txt

# Cask Apps
echo "Installing Cask applications..."
while IFS= read -r app; do
    [[ -z "$app" || "$app" =~ ^# ]] && continue
    if brew list --cask | grep -q "^$app\$"; then
        echo "$app is already installed, skipping..."
    else
        brew install --cask "$app"
    fi
done < brew-packages.txt

# Custom Installations
if [ -f "custom-install.sh" ]; then
    chmod +x custom-install.sh
    ./custom-install.sh
fi

echo "All installations completed!"
