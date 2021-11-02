#!/bin/bash
# Title:        Docker setup for Ubuntu
# Description:  Installs the Docker engine from the official Docker repositories.
# Author:       Callum Lamont

# Update the apt package index and install packages to allow apt to use a repository over HTTPS
echo Updating apt and installing utility packages
sudo apt-get update

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# Add Docker’s official GPG key
echo Adding Docker\'s GPC key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Use the following command to set up the stable repository. To add the nightly
# or test repository, add the word nightly or test (or both) after the word
# stable in the commands below
echo Setting up stable Docker repository
echo \
    "deb [arch=arm64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install the latest version of Docker Engine and containerd
# TODO: This throws an error when run the first time saying "Package 'docker-ce' has no installation
# candidate". Perhaps try this script on an EC2 instance to see if this is just a raspberry pi quirk.
echo Installing latest version of Docker
sudo apt-get install docker-ce docker-ce-cli containerd.io
