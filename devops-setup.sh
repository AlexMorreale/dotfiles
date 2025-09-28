#!/bin/bash

# DevOps-specific tools installation
# Run this after the main install.sh

set -e

echo "🚀 Installing DevOps-specific tools..."

# Source asdf for this session (skip if not available)
if [ -f ~/.asdf/asdf.sh ]; then
    source ~/.asdf/asdf.sh

    # Install asdf plugins and tools
    echo "🏗️  Installing development tools via asdf..."

    # Add plugins (only if not already added)
    for plugin in terraform golang nodejs python; do
        if ! asdf plugin list | grep -q "^$plugin$"; then
            echo "Adding asdf plugin: $plugin"
            asdf plugin add $plugin
        else
            echo "Plugin $plugin already installed, skipping..."
        fi
    done

    # Install and set latest versions (only if not already installed)
    echo "📦 Installing latest versions..."
    for tool in terraform golang nodejs python; do
        if ! asdf list $tool 2>/dev/null | grep -q "latest"; then
            echo "Installing $tool latest..."
            asdf install $tool latest
            asdf global $tool latest
        else
            echo "$tool latest already installed, skipping..."
        fi
    done
else
    echo "asdf not found. Please run install.sh first."
fi

# Kind (Kubernetes in Docker)
echo "☸️  Installing Kind..."
if ! command -v kind &> /dev/null; then
    curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-linux-amd64
    chmod +x ./kind
    sudo mv ./kind /usr/local/bin/kind
else
    echo "Kind already installed, skipping..."
fi

# Minikube
echo "🎡 Installing Minikube..."
if ! command -v minikube &> /dev/null; then
    curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
    sudo install minikube-linux-amd64 /usr/local/bin/minikube
    rm minikube-linux-amd64
else
    echo "Minikube already installed, skipping..."
fi

# AWS CLI
echo "☁️  Installing AWS CLI..."
if ! command -v aws &> /dev/null; then
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    sudo ./aws/install
    rm -rf aws awscliv2.zip
else
    echo "AWS CLI already installed, skipping..."
fi

# Azure CLI
echo "☁️  Installing Azure CLI..."
if ! command -v az &> /dev/null; then
    curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
else
    echo "Azure CLI already installed, skipping..."
fi

# Claude Code
echo "🤖 Installing Claude Code..."
if ! command -v claude &> /dev/null; then
    curl -sSL https://claude.ai/install.sh | bash
    # Add Claude to PATH if not already there
    if ! grep -q 'claude' ~/.zshrc 2>/dev/null; then
        echo '' >> ~/.zshrc
        echo '# Claude Code CLI' >> ~/.zshrc
        echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc
    fi
else
    echo "Claude Code already installed, skipping..."
fi

echo "✅ DevOps tools installation complete!"
echo "Run 'source ~/.zshrc' to refresh your shell environment."