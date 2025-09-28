#!/bin/bash

# Ubuntu 24.04 LTS Automated Setup Script
# Based on your existing dotfiles configuration

set -e  # Exit on any error

echo "🚀 Starting Ubuntu 24.04 automated setup..."

# Update system
echo "📦 Updating system packages..."
sudo apt update && sudo apt upgrade -y

# Install prerequisite packages
echo "🔧 Installing prerequisite packages..."
sudo apt install -y zsh tmux vim htop xclip git openssl curl wget build-essential \
                    ripgrep fzf apt-transport-https ca-certificates gnupg lsb-release

# Install Docker (Ubuntu repository version)
echo "🐳 Installing Docker..."
if ! command -v docker &> /dev/null; then
    sudo apt install -y docker.io
    sudo usermod -aG docker $USER
    sudo systemctl enable docker
else
    echo "Docker already installed, skipping..."
fi

# Install development tools
echo "🛠️  Installing development tools..."
# Kubectl
if ! command -v kubectl &> /dev/null; then
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
    sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
    rm kubectl
else
    echo "kubectl already installed, skipping..."
fi

# Helm
if ! command -v helm &> /dev/null; then
    curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
    sudo apt update && sudo apt install -y helm
else
    echo "Helm already installed, skipping..."
fi

# Hub
sudo apt install -y hub

# Install asdf version manager
echo "🔧 Installing asdf version manager..."
if [ ! -d "$HOME/.asdf" ]; then
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0
else
    echo "asdf already installed, skipping..."
fi

# Add asdf to shell profile (only if not already present)
if ! grep -q "asdf.sh" ~/.zshrc 2>/dev/null; then
    echo '' >> ~/.zshrc
    echo '# asdf version manager' >> ~/.zshrc
    echo '. "$HOME/.asdf/asdf.sh"' >> ~/.zshrc
    echo '. "$HOME/.asdf/completions/asdf.bash"' >> ~/.zshrc
fi

# Change default shell to zsh
echo "🐚 Setting up zsh..."
if [ "$SHELL" != "$(which zsh)" ]; then
    chsh -s $(which zsh) $USER
else
    echo "zsh already set as default shell, skipping..."
fi

# Install Oh My Zsh
echo "✨ Installing Oh My Zsh..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Install Vundle for vim
echo "📝 Setting up Vim plugins..."
if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

# Link dotfiles
echo "🔗 Linking dotfiles..."
ln -sf ~/personal/dotfiles/.vimrc ~/.vimrc
ln -sf ~/personal/dotfiles/.zshrc ~/.zshrc
ln -sf ~/personal/dotfiles/.tmux.conf ~/.tmux.conf

# Install vim plugins
echo "🔌 Installing vim plugins..."
vim +PluginInstall +qall

# Set up DNS (Cloudflare)
echo "🌐 Configuring DNS..."
echo "nameserver 1.1.1.1" | sudo tee /etc/resolv.conf.head
echo "nameserver 1.0.0.1" | sudo tee -a /etc/resolv.conf.head

echo "✅ Setup complete! Please reboot your system."
echo "After reboot, Docker and all tools should be ready to use."