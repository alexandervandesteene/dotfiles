#!/bin/sh

echo "🚀 Setting up your Mac..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  echo "📦 Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  
  # Add Homebrew to PATH for Apple Silicon Macs
  if [[ $(uname -m) == 'arm64' ]]; then
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
else
  echo "✅ Homebrew already installed"
fi

# Update Homebrew recipes
echo "🔄 Updating Homebrew..."
brew update

# Install all our dependencies with bundle (See Brewfile)
echo "📦 Installing packages from Brewfile..."
brew tap homebrew/bundle
brew bundle --file=$HOME/.dotfiles/Brewfile

# Create a Sites directory
echo "📁 Creating Sites directory..."
mkdir -p $HOME/Sites

# Symlink .zshrc
echo "🔗 Symlinking .zshrc..."
rm -rf $HOME/.zshrc
ln -sf $HOME/.dotfiles/.zshrc $HOME/.zshrc

# Create env.zsh if it doesn't exist
if [ ! -f $HOME/.dotfiles/env.zsh ]; then
  echo "📝 Creating env.zsh from template..."
  cp $HOME/.dotfiles/env.zsh.example $HOME/.dotfiles/env.zsh 2>/dev/null || touch $HOME/.dotfiles/env.zsh
fi

# Symlink the Mackup config file to the home directory (if it exists)
if [ -f $HOME/.dotfiles/.mackup.cfg ]; then
  echo "🔗 Symlinking Mackup config..."
  ln -sf $HOME/.dotfiles/.mackup.cfg $HOME/.mackup.cfg
fi

# Initialize NVM
if [ -d "$(brew --prefix)/opt/nvm" ]; then
  echo "🟢 Initializing NVM..."
  mkdir -p $HOME/.nvm
fi

# Initialize pyenv
if command -v pyenv &> /dev/null; then
  echo "🐍 Initializing pyenv..."
  eval "$(pyenv init -)"
fi

# Set macOS preferences (if .macos file exists)
if [ -f $HOME/.dotfiles/.macos ]; then
  echo "⚙️  Setting macOS preferences..."
  source $HOME/.dotfiles/.macos
fi

echo ""
echo "✅ Setup complete!"
echo ""
echo "📝 Next steps:"
echo "  1. Restart your terminal"
echo "  2. Configure Powerlevel10k: run 'p10k configure'"
echo "  3. If using Herd, open it and complete setup"
echo "  4. If using Mackup, run 'mackup restore' to restore app settings"
echo "  5. Generate SSH keys: ssh-keygen -t ed25519 -C 'your_email@example.com'"
echo ""
