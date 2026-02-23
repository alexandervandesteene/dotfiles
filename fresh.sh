#!/usr/bin/env bash
set -euo pipefail

DOTFILES="${DOTFILES:-$HOME/.dotfiles}"
BREWFILE="$DOTFILES/Brewfile"

echo "🚀 Setting up your Mac..."

if [[ ! -d "$DOTFILES" ]]; then
  echo "❌ Dotfiles directory not found: $DOTFILES"
  exit 1
fi

# Check for Homebrew and install if we don't have it
if ! command -v brew >/dev/null 2>&1; then
  echo "📦 Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # Add Homebrew to PATH for Apple Silicon Macs
  if [[ "$(uname -m)" == "arm64" && -x /opt/homebrew/bin/brew ]]; then
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$HOME/.zprofile"
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
else
  echo "✅ Homebrew already installed"
fi

# Ensure brew environment is available in this shell
if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /usr/local/bin/brew ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

# Update Homebrew recipes
echo "🔄 Updating Homebrew..."
brew update

# Install all our dependencies with bundle (See Brewfile)
echo "📦 Installing packages from Brewfile..."
brew tap homebrew/bundle
if brew bundle check --file="$BREWFILE" >/dev/null 2>&1; then
  echo "✅ Brew dependencies already satisfied"
else
  brew bundle --file="$BREWFILE"
fi

# Initialize git submodules (e.g. powerlevel10k theme)
if [[ -d "$DOTFILES/.git" ]]; then
  echo "🧩 Initializing git submodules..."
  git -C "$DOTFILES" submodule sync --recursive
  git -C "$DOTFILES" submodule update --init --recursive
fi

# Create a Sites directory
echo "📁 Creating Sites directory..."
mkdir -p "$HOME/Sites"

# Symlink .zshrc
echo "🔗 Symlinking .zshrc..."
ln -sfn "$DOTFILES/.zshrc" "$HOME/.zshrc"

# Symlink tmux config
if [[ -f "$DOTFILES/.tmux.conf" ]]; then
  echo "🔗 Symlinking .tmux.conf..."
  ln -sfn "$DOTFILES/.tmux.conf" "$HOME/.tmux.conf"
fi

# Symlink Ghostty config
if [[ -f "$DOTFILES/ghostty/config" ]]; then
  echo "🔗 Symlinking Ghostty config..."
  mkdir -p "$HOME/.config/ghostty"
  ln -sfn "$DOTFILES/ghostty/config" "$HOME/.config/ghostty/config"
fi

# Create env.zsh if it doesn't exist
if [[ ! -f "$DOTFILES/env.zsh" ]]; then
  echo "📝 Creating env.zsh from template..."
  cp "$DOTFILES/env.zsh.example" "$DOTFILES/env.zsh" 2>/dev/null || touch "$DOTFILES/env.zsh"
fi

# Symlink the Mackup config file to the home directory (if it exists)
if [[ -f "$DOTFILES/.mackup.cfg" ]]; then
  echo "🔗 Symlinking Mackup config..."
  ln -sfn "$DOTFILES/.mackup.cfg" "$HOME/.mackup.cfg"
fi

# Initialize NVM directory if installed via Homebrew
if brew list nvm >/dev/null 2>&1; then
  echo "🟢 Initializing NVM directory..."
  mkdir -p "$HOME/.nvm"
fi

# Warn if Oh My Zsh is missing
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  echo "⚠️  Oh My Zsh is not installed. Install it with:"
  echo "   sh -c \"\$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)\""
fi

# Optionally set macOS preferences
if [[ -f "$DOTFILES/.macos" ]]; then
  if [[ "${APPLY_MACOS_DEFAULTS:-0}" == "1" ]]; then
    echo "⚙️  Applying macOS preferences..."
    bash "$DOTFILES/.macos"
  else
    echo "⏭️  Skipping macOS defaults. Run with APPLY_MACOS_DEFAULTS=1 to apply."
  fi
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
echo "  6. Apply macOS defaults (optional): APPLY_MACOS_DEFAULTS=1 ./fresh.sh"
echo ""
