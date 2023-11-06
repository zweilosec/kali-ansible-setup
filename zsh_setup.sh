#!/bin/sh
# Set up ZSH using oh-my-zsh

# Clone The Repository 
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh

#Backup Your Existing ~/.zshrc File 
cp ~/.zshrc ~/.zshrc.orig

# Create A New Zsh Configuration File by copying the template included in oh-my-zsh.
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

# Install fonts
# https://github.com/romkatv/powerlevel10k#manual-font-installation

# Download powerlevel10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Set ZSH_THEME="powerlevel10k/powerlevel10k" in ~/.zshrc
