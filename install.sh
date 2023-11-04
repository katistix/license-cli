#!/bin/bash

# Set the repository details
REPO="katistix/license-cli"
TOOL_NAME="license"

# Determine the latest release version
latest_release_url="https://api.github.com/repos/$REPO/releases/latest"
latest_release_version=$(curl -s $latest_release_url | grep -oP '"tag_name": "\K(.*)(?=")')

# Define the URL for the release archive
release_url="https://github.com/$REPO/releases/download/$latest_release_version/$TOOL_NAME-$latest_release_version.tar.gz"

# Define the installation directory
INSTALL_DIR="/usr/local/bin"

# Download and extract the release archive
curl -LO $release_url
tar -xzvf $TOOL_NAME-$latest_release_version.tar.gz

# Make the tool executable and move it to the installation directory
sudo chmod +x $TOOL_NAME.sh
sudo mv $TOOL_NAME.sh $INSTALL_DIR/

# Clean up downloaded files
rm $TOOL_NAME-$latest_release_version.tar.gz

# Provide a success message
echo "$REPO $latest_release_version has been installed to $INSTALL_DIR"
