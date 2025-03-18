#!/bin/bash

set -e

# Define the Java version
JAVA_VERSION="jdk-17"
INSTALL_DIR="/home/ncs/Anil/java"

# Install dependencies
echo "Installing dependencies"
sudo apt-get update -y
sudo apt-get install -y wget tar

# Download OpenJDK binary distribution
echo "Downloading OpenJDK ${JAVA_VERSION} binary distribution"
cd /tmp
wget https://download.java.net/openjdk/jdk17/ri/openjdk-17+35_linux-x64_bin.tar.gz

# Extract OpenJDK binary distribution
echo "Extracting OpenJDK binary distribution"
tar -xvzf openjdk-17+35_linux-x64_bin.tar.gz

# Move the extracted directory to the install location
echo "Installing OpenJDK to ${INSTALL_DIR}"
sudo mkdir -p ${INSTALL_DIR}
sudo mv jdk-17 ${INSTALL_DIR}

# Clean up downloaded tarball
echo "Cleaning up"
rm openjdk-17+35_linux-x64_bin.tar.gz

# Verify the Installation
echo "Verifying Java installation"
${INSTALL_DIR}/jdk-17/bin/java -version
${INSTALL_DIR}/jdk-17/bin/javac -version

# Add Java to the PATH
echo "Updating PATH environment variable"
echo "export PATH=\${PATH}:${INSTALL_DIR}/jdk-17/bin" >> ~/.bashrc
source ~/.bashrc

echo "Java installation complete!"

