#!/bin/bash

# Update the package list
sudo apt-get update -y

# Install required packages for Docker
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# Add Docker's official GPG key
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Set up the Docker repository
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update the package list again to include Docker's packages
sudo apt-get update -y

# Install Docker CE, Docker CLI, and containerd
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Verify that Docker is installed and running
sudo systemctl status docker --no-pager

# Optional: Add the current user to the docker group to run Docker without sudo
sudo usermod -aG docker $USER

# Print installation success message
echo "Docker CE installation completed successfully!"

# Reminder for user to re-login if they added to docker group
echo "Note: If you added your user to the Docker group, please log out and back in for the change to take effect."

