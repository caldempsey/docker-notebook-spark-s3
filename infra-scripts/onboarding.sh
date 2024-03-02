#!/bin/bash

# This script is used to check if the required tools are installed and to provide installation instructions if they are not.
# It is designed to be ran from the root of the repository.

# Function to prompt user for installation confirmation
prompt_installation() {
    read -p "🚀 Do you want to install $1? (y/n): " choice
    if [[ $choice == "y" || $choice == "Y" ]]; then
        echo "🛠️ Please follow the installation instructions at: $2"
    else
        echo "❗ $1 installation is required to continue."
    fi
}

# Check if JDK 21 is installed
if ! command -v java &> /dev/null; then
    echo "🚫 JDK 21 is not installed."
    prompt_installation "JDK 21" "<insert JDK 21 installation instructions link>"
else
    echo "✅ JDK 21 is already installed."
fi

# Check if Scala is installed
if ! command -v scala &> /dev/null; then
    echo "🚫 Scala is not installed."
    prompt_installation "Scala" "https://www.scala-lang.org/download/"
else
    echo "✅ Scala is already installed."
fi

# Additional information
echo "💡 If you're using VSCode, you can install the Scala Syntax and Metals extension to get Scala support. You want 'use pre release version' for this."
echo "🎉 Happy coding!"