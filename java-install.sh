#!/bin/bash


echo "Updating system packages"
sudo apt update -y
sudo apt upgrade -y

# Install dependencies for building Java from source

echo "Installing dependencies"
sudo apt install -y wget tar build-essential gcc g++ make openjdk-11-jdk git

# Set Java version and download URL (OpenJDK 17 example)

JAVA_VERSION="jdk-17.0.2"
JAVA_URL="https://download.java.net/openjdk/jdk17/ri/$JAVA_VERSION_linux-x64_bin.tar.gz"

# Download OpenJDK source code

echo "Downloading Java source code from: $JAVA_URL"
wget $JAVA_URL -P /tmp

# Extract the downloaded tar.gz file

echo "Extracting Java source code..."
tar -xvzf /tmp/$JAVA_VERSION_linux-x64_bin.tar.gz -C /opt

# Set environment variables (Optional: add to .bashrc or .profile)

echo "Setting up environment variables..."
echo "export JAVA_HOME=/opt/$JAVA_VERSION" >> ~/.bashrc
echo "export PATH=\$JAVA_HOME/bin:\$PATH" >> ~/.bashrc

# Source the .bashrc to apply the changes
source ~/.bashrc

# Verify Java installation
echo "Verifying Java installation..."
java -version
javac -version

echo "Java installation complete."

