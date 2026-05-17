# nix-config

Personal NixOS configuration using Flakes and Home Manager.

## Overview

- **System**: NixOS unstable (x86_64-linux)
- **Desktop**: KDE Plasma 6 (SDDM)
- **Shell**: Zsh + Oh My Zsh + Powerlevel10k
- **Input Method**: Fcitx5 + RIME (rime-ice)
- **Proxy**: v2rayA (xray backend)
- **Locale**: en_US.UTF-8 / zh_CN.UTF-8

## What This Flake Provides

### NixOS System (`nixosConfigurations.nixos`)
Full desktop system for x86_64-linux with KDE Plasma, Zsh, Home Manager, and Rust (via rust-overlay).

### Dev Shells (`devShells`) — Linux & macOS (x86_64-linux, aarch64-darwin)

| Shell | Language / Stack | Key Tools |
|-------|-----------------|-----------|
| `base` | General | git, curl, direnv, jq, yq |
| `go` | Go + gRPC/protobuf | go, gopls, delve, goctl, protoc, protoc-gen-go |
| `evm` | EVM / Web3 | Node.js 24, TypeScript, solc, Foundry, pnpm, yarn |
| `kucoin` | Go (KuCoin backend) | Go 1.24.6, gopls, delve, goctl, grpcurl |

## Structure

```
.
├── flake.nix                  # Flake entry point
├── configuration.nix          # Top-level system config
├── hardware-configuration.nix # Hardware-specific settings
├── modules/
│   ├── system.nix             # Boot, networking, packages, fonts, v2rayA
│   ├── shell.nix              # Zsh, direnv, p10k
│   └── i18n.nix               # Locale, timezone, fcitx5
├── home/
│   ├── default.nix            # Home Manager entry point (user: miles)
│   ├── desktop.nix            # GUI apps
│   ├── git.nix                # Git configuration
│   └── dotfiles.nix           # Dotfile management
├── shells/
│   ├── base.nix               # Base tools (git, curl, direnv, jq, yq)
│   ├── go.nix                 # Go + protobuf toolchain
│   ├── evm.nix                # Node.js, Solidity, Foundry (cross-platform)
│   └── kucoin.nix             # Go 1.24.6 + KuCoin private repo config
├── dotfiles/
│   └── rime/                  # RIME input method config
└── vpn/                       # WireGuard client configs
```

## Usage

```bash
# Rebuild system
sudo nixos-rebuild switch --flake .#nixos

# Update flake inputs
nix flake update

# Enter a dev shell
nix develop .#base
nix develop .#go
nix develop .#evm
nix develop .#kucoin
```

### macOS (with direnv)

1. Install [Nix](https://nixos.org/download/) and enable flakes:
   ```bash
   echo 'experimental-features = nix-command flakes' >> ~/.config/nix/nix.conf
   ```

2. Install direnv and hook it into your shell (`~/.zshrc`):
   ```bash
   brew install direnv
   echo 'eval "$(direnv hook zsh)"' >> ~/.zshrc
   ```

3. In your project directory, create an `.envrc`:
   ```bash
   echo 'use flake /path/to/nixos-config#kucoin' > .envrc
   direnv allow
   ```

   Or to use a shell from this repo directly:
   ```bash
   echo 'use flake github:your-username/nixos-config#kucoin' > .envrc
   direnv allow
   ```

## Key Packages

**System**: vim, ripgrep, btop, bat, gcc, cmake, nixd, nixfmt, tree, zip, unzip

**Desktop**: Google Chrome, Brave, Telegram, WeChat, QQ Music, Discord, Emacs, VS Code, WezTerm, Zellij, Claude Code, DBeaver, just

**Fonts**: Noto (CJK + Emoji), Fira Code, Meslo LG, JetBrains Mono, Maple Mono CN
