#!/bin/bash

# Set the repository details
REPO="katistix/license-cli"
TOOL_NAME="license"

# Determine the latest release version
latest_release_url="https://api.github.com/repos/$REPO/releases/latest"
echo "Checking for the latest release at $latest_release_url"

latest_release_info=$(curl -sL $latest_release_url)

latest_release_version=$(echo "$latest_release_info" | grep -o '"tag_name": "[^"]*' | awk -F '"' '{print $4}')
echo "Latest release: $latest_release_version"


tarball_url=$(echo "$latest_release_info" | grep -o '"tarball_url": "[^"]*' | awk -F '"' '{print $4}')
echo "Tarball URL: $tarball_url"

# Define the installation directory
INSTALL_DIR="/usr/local/bin"

# Create a temporary directory and change to it
temp_dir=$(mktemp -d)
cd $temp_dir

# Download and extract the release archive
curl -sL $tarball_url | sudo tar -xz --strip-components=1

# Make the tool executable and move it to the installation directory
sudo chmod +x $TOOL_NAME.sh
sudo mv $TOOL_NAME.sh $INSTALL_DIR/$TOOL_NAME

# Clean up downloaded files
cd ..
sudo rm -rf $temp_dir

# Provide a success message
echo "$REPO $latest_release_version has been installed to $INSTALL_DIR"
