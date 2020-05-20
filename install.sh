#!/bin/sh

echo "Stay awhile..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# No longer using Brewfile, see notes
# Update Homebrew recipes
# brew update

# Install all our dependencies with bundle (See Brewfile)
# brew tap homebrew/bundle
# brew bundle

# Make ZSH the default shell environment
chsh -s $(which zsh)

# Create ~/texts
# mkdir $HOME/texts

# Set OS X preferences
# Tun this last because this will reload the shell
source .macos

