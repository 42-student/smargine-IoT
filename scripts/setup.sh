#!/bin/bash

# script to install Docker, K3d, and kubectl on the VM

echo "[INFO] Updating package list..."
sudo apt-get update

echo "[INFO] Installing prerequisites..."
sudo apt-get install -y curl wget apt-transport-https ca-certificates gnupg lsb-release

echo "[INFO] Installing Docker..."
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $USER
rm get-docker.sh

echo "[INFO] Installing kubectl..."
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
rm kubectl

echo "[INFO] Installing K3d..."
curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash

echo "[INFO] Verifying installations..."
docker --version
kubectl version --client
k3d --version

echo "[INFO] Setup complete."

