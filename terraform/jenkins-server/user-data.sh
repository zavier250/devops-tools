#!/bin/bash
set -e

# Install Java (required for Jenkins)
sudo yum update -y

sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo

sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

sudo yum upgrade -y

sudo dnf install java-17-amazon-corretto -y

sudo yum install jenkins -y

# Start and enable Jenkins service
sudo systemctl enable jenkins
sudo systemctl start jenkins


# Display initial admin password
echo "Jenkins installed successfully!"
echo "Use the following command to get the initial admin password:"
echo "sudo cat /var/lib/jenkins/secrets/initialAdminPassword"