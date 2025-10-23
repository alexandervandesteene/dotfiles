# Alexander's Dotfiles

This repository serves as my way to help me setup and maintain my Mac. It takes the effort out of installing everything manually. Everything needed to install my preferred setup of macOS is detailed in this readme.

Based on [Dries Vints' dotfiles](https://driesvints.com/blog/getting-started-with-dotfiles) with personal customizations.

## A Fresh macOS Setup

These instructions are for when you've already set up your dotfiles. If you want to get started with your own dotfiles you can [find instructions below](#your-own-dotfiles).

### Before you re-install

First, go through the checklist below to make sure you didn't forget anything before you wipe your hard drive.

- Did you commit and push any changes/branches to your git repositories?
- Did you remember to save all important documents from non-iCloud directories?
- Did you save all of your work from apps which aren't synced through iCloud?
- Did you remember to export important data from your local database?
- Did you update [mackup](https://github.com/lra/mackup) to the latest version and ran `mackup backup`?

### Installing macOS cleanly

After going to our checklist above and making sure you backed everything up, we're going to cleanly install macOS with the latest release. Follow [this article](https://www.imore.com/how-do-clean-install-macos) to cleanly install the latest macOS version.

### Setting up your Mac

If you did all of the above you may now follow these install instructions to setup a new Mac.

1. **Update macOS** to the latest version through System Settings
2. **Install Xcode Command Line Tools**
   ```bash
   xcode-select --install
   ```
3. **Generate SSH keys** and add to GitHub
   ```bash
   ssh-keygen -t ed25519 -C "your_email@example.com"
   eval "$(ssh-agent -s)"
   ssh-add ~/.ssh/id_ed25519
   pbcopy < ~/.ssh/id_ed25519.pub
   # Then paste into GitHub Settings > SSH Keys
   ```
4. **Clone this repo** to `~/.dotfiles`
   ```bash
   git clone git@github.com:yourusername/dotfiles.git ~/.dotfiles
   cd ~/.dotfiles
   ```
5. **Install Oh My Zsh**
   ```bash
   sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
   ```
6. **Install Powerlevel10k theme**
   ```bash
   git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
   ```
7. **Run the setup script**
   ```bash
   cd ~/.dotfiles
   chmod +x fresh.sh
   ./fresh.sh
   ```
8. **Configure your environment**
   - Copy `env.zsh.example` to `env.zsh` and customize for your machine
   - Run `p10k configure` to set up your prompt
9. **Restore app settings** (optional)
   ```bash
   mackup restore
   ```
10. **Restart your terminal** to apply all changes

Your Mac is now ready to use!

> **Note:** The dotfiles must be located at `~/.dotfiles` as this path is referenced in `.zshrc`.

## File Structure

- **`.zshrc`** - Main zsh configuration, loads Oh My Zsh and custom files
- **`aliases.zsh`** - Custom command aliases
- **`path.zsh`** - PATH configuration for Composer, Node, etc.
- **`env.zsh`** - Machine-specific environment variables (gitignored)
- **`env.zsh.example`** - Template for env.zsh
- **`Brewfile`** - Homebrew packages, apps, and fonts to install
- **`fresh.sh`** - Setup script for new Mac installations
- **`themes/powerlevel10k/`** - Powerlevel10k theme (git submodule)

### Machine-Specific Configuration

The `env.zsh` file is gitignored and contains machine-specific paths and configurations like:
- NVM (Node Version Manager)
- Pyenv (Python Version Manager)
- Laravel Herd
- Google Cloud SDK
- Any other tools that may differ between machines

Copy `env.zsh.example` to `env.zsh` and uncomment/customize the sections you need.

## Your Own Dotfiles

**Please note that the instructions below assume you already have set up Oh My Zsh so make sure to first [install Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh#getting-started) before you continue.**

If you want to start with your own dotfiles from this setup, it's pretty easy to do so. First of all you'll need to fork this repo. After that you can tweak it the way you want.

Go through the [`.macos`](./.macos) file and adjust the settings to your liking. You can find much more settings at [the original script by Mathias Bynens](https://github.com/mathiasbynens/dotfiles/blob/master/.macos) and [Kevin Suttle's macOS Defaults project](https://github.com/kevinSuttle/MacOS-Defaults).

Check out the [`Brewfile`](./Brewfile) file and adjust the apps you want to install for your machine. Use [their search page](https://caskroom.github.io/search) to check if the app you want to install is available.

Check out the [`aliases.zsh`](./aliases.zsh) file and add your own aliases. If you need to tweak your `$PATH` check out the [`path.zsh`](./path.zsh) file. These files get loaded in because the `$ZSH_CUSTOM` setting points to the `.dotfiles` directory. You can adjust the [`.zshrc`](./.zshrc) file to your liking to tweak your Oh My Zsh setup. More info about how to customize Oh My Zsh can be found [here](https://github.com/robbyrussell/oh-my-zsh/wiki/Customization).

When installing these dotfiles for the first time you'll need to backup all of your settings with Mackup. Install Mackup and backup your settings with the commands below. Your settings will be synced to iCloud so you can use them to sync between computers and reinstall them when reinstalling your Mac. If you want to save your settings to a different directory or different storage than iCloud, [checkout the documentation](https://github.com/lra/mackup/blob/master/doc/README.md#storage). Also make sure your `.zshrc` file is symlinked from your dotfiles repo to your home directory. 

```zsh
brew install mackup
mackup backup
```

You can tweak the shell theme, the Oh My Zsh settings and much more. Go through the files in this repo and tweak everything to your liking.

Enjoy your own Dotfiles!

## Thanks To...

I first got the idea for starting this project by visiting the [Github does dotfiles](https://dotfiles.github.io/) project. Both [Zach Holman](https://github.com/holman/dotfiles) and [Mathias Bynens](https://github.com/mathiasbynens/dotfiles) were great sources of inspiration. [Sourabh Bajaj](https://twitter.com/sb2nov/)'s [Mac OS X Setup Guide](http://sourabhbajaj.com/mac-setup/) proved to be invaluable. Thanks to [@subnixr](https://github.com/subnixr) for [his awesome Zsh theme](https://github.com/subnixr/minimal)! And lastly, I'd like to thank [Emma Fabre](https://twitter.com/anahkiasen) for [her excellent presentation on Homebrew](https://speakerdeck.com/anahkiasen/a-storm-homebrewin) which made me migrate a lot to a [`Brewfile`](./Brewfile) and [Mackup](https://github.com/lra/mackup).

In general, I'd like to thank every single one who open-sources their dotfiles for their effort to contribute something to the open-source community. Your work means the world! :earth_africa: :heart:
