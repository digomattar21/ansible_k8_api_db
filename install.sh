#!/bin/bash

# Update system and install software-properties-common for add-apt-repository
sudo apt-get update
sudo apt-get install -y software-properties-common

# Add Ansible PPA and install Ansible
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt-get install -y ansible

# Check Ansible version to confirm installation
ansible --version

# Install curl and apt-transport-https if not already installed
sudo apt-get update
sudo apt-get install -y curl apt-transport-https

# Install VirtualBox
sudo apt-get install -y virtualbox virtualbox-ext-pack

# Download and install Minikube
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
chmod +x minikube
sudo mv minikube /usr/local/bin/

# Install kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/

# Start Minikube
minikube start

# Check kubectl configuration
kubectl cluster-info

