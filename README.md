# nix-config

Personal NixOS configuration using Flakes and Home Manager.

## Overview

- **System**: NixOS unstable (x86_64-linux)
- **Desktop**: KDE Plasma 6 (SDDM)
- **Shell**: Zsh + Oh My Zsh + Powerlevel10k
- **Input Method**: Fcitx5 + RIME (rime-ice)
- **Locale**: en_US.UTF-8 / zh_CN.UTF-8

## Structure

```
.
├── flake.nix                  # Flake entry point
├── configuration.nix          # Top-level system config
├── hardware-configuration.nix # Hardware-specific settings
├── modules/
│   ├── system.nix             # Boot, networking, packages, fonts
│   ├── shell.nix              # Zsh, direnv, p10k
│   └── i18n.nix               # Locale, timezone, fcitx5
└── home/
    ├── default.nix            # Home Manager entry point (user: miles)
    ├── desktop.nix            # GUI apps (Chrome, Emacs, VS Code, etc.)
    ├── git.nix                # Git configuration
    └── dotfiles.nix           # Dotfile management
```

## Usage

```bash
# Rebuild system
sudo nixos-rebuild switch --flake .#nixos

# Update flake inputs
nix flake update
```

## Key Packages

**System**: vim, ripgrep, btop, bat, gcc, cmake, tokei, nixd, nixfmt

**Desktop**: Google Chrome, Brave, Telegram, WeChat, Discord, Emacs, VS Code, WezTerm, Claude Code, DBeaver

**Fonts**: Noto (CJK + Emoji), Fira Code, Meslo LG, JetBrains Mono, Maple Mono CN
