# Changelog

## 2025-10-23 - Dotfiles Cleanup & Modernization

### ✨ Nieuwe bestanden
- **`.gitignore`** - Voorkomt dat machine-specifieke bestanden worden gecommit
- **`env.zsh`** - Machine-specifieke environment configuratie (gitignored)
- **`env.zsh.example`** - Template voor env.zsh met voorbeelden
- **`CHANGELOG.md`** - Dit bestand

### 🔧 Belangrijke wijzigingen

#### `.zshrc`
- ✅ Verwijderd: Hardcoded username "Alexander" → vervangen door `$HOME`
- ✅ Verwijderd: Dubbele MySQL PATH entry
- ✅ Verplaatst: Alle machine-specifieke configuratie naar `env.zsh`
- ✅ Toegevoegd: Ondersteuning voor zsh-autosuggestions en zsh-syntax-highlighting
- ✅ Toegevoegd: Extra Oh My Zsh plugins (docker, npm, composer)

#### `Brewfile`
- ✅ Toegevoegd: `nvm` (Node Version Manager)
- ✅ Toegevoegd: `pyenv` (Python Version Manager)
- ✅ Toegevoegd: `zsh-autosuggestions`
- ✅ Toegevoegd: `zsh-syntax-highlighting`
- ✅ Toegevoegd: `herd` (Laravel Herd)
- ✅ Verwijderd: Duplicaat `gd` entry
- ✅ Verwijderd: Duplicaat `cyberduck` entry
- ✅ Gecommentarieerd: PHP/MySQL/Nginx (omdat Herd deze levert)

#### `fresh.sh`
- ✅ Verwijderd: Laravel Valet installatie (vervangen door Herd)
- ✅ Verwijderd: MySQL configuratie
- ✅ Verwijderd: PECL extensies installatie
- ✅ Verwijderd: Project-specifieke directory creatie
- ✅ Toegevoegd: Apple Silicon (M1/M2/M3) ondersteuning
- ✅ Toegevoegd: Betere error handling en checks
- ✅ Toegevoegd: Duidelijke emoji's en feedback
- ✅ Toegevoegd: NVM en pyenv initialisatie
- ✅ Toegevoegd: Optionele .macos en .mackup.cfg checks

#### `README.md`
- ✅ Bijgewerkt: Installatie instructies met moderne commando's
- ✅ Toegevoegd: Powerlevel10k installatie stappen
- ✅ Toegevoegd: File Structure sectie
- ✅ Toegevoegd: Machine-Specific Configuration uitleg
- ✅ Verbeterd: Duidelijkere stap-voor-stap instructies

### 🎯 Resultaat

De dotfiles zijn nu:
- ✅ **Portable** - Geen hardcoded usernames of paths
- ✅ **Modulair** - Machine-specifieke config gescheiden van algemene config
- ✅ **Modern** - Ondersteuning voor Apple Silicon en moderne tools
- ✅ **Schoon** - Geen duplicaten of verouderde configuraties
- ✅ **Gedocumenteerd** - Duidelijke README met alle stappen

### 📝 Volgende stappen voor nieuwe laptop

1. Clone de repo naar `~/.dotfiles`
2. Voer `./fresh.sh` uit
3. Kopieer `env.zsh.example` naar `env.zsh`
4. Pas `env.zsh` aan voor je nieuwe machine
5. Run `p10k configure` voor je prompt
6. Herstart je terminal

Klaar! 🚀

