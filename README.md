# Computer Set Up

## 🚀 Automated Installation (NEW!)

Fresh Ubuntu 24.04 LTS setup in 3 commands:

```bash
# 1. Clone this repo
git clone https://github.com/yourusername/dotfiles.git ~/personal/dotfiles

# 2. Run basic setup
cd ~/personal/dotfiles && ./install.sh

# 3. Run DevOps tools (optional)
./devops-setup.sh
```

## Manual Steps After Installation

### Firefox
turn off smart tabbing
https://support.mozilla.org/en-US/kb/tab-preferences-and-settings

### Slack
```bash
sudo snap install slack --classic
```

## ssh 
- generate ssh 
- add ssh key to github

## prereq
- apt install zsh tmux vim htop xclip git openssl -y

## Oh My Zsh
- chsh -s $(which zsh) $USER
- wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
- restart machine

## tfenv
- https://github.com/kamatama41/tfenv

## golang

## other stuff
- Powerline Fonts

## Vundle
https://github.com/VundleVim/Vundle.vim#quick-start

## HUB
- https://www.calazan.com/installing-hub-git-wrapper-on-ubuntu-the-easy-way/
- apt install hub
- consider getting zsh autocomplete

## theme
https://github.com/Mayccoll/Gogh 
or
wget -O gogh https://git.io/vQgMr && chmod +x gogh && ./gogh && rm gogh

## /etc/resolv.conf
add cloudflare nameservers 
```
nameserver 1.1.1.1
nameserver 1.0.0.1
```

## vim deps
- ripgrep
- fzf 

