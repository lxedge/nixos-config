# CLAUDE.md

## Commands

```bash
# Apply system config
sudo nixos-rebuild switch --flake .#nixos

# Check flake without building
nix flake check

# Update all inputs
nix flake update

# Enter a dev shell
nix develop .#base
nix develop .#go
nix develop .#evm
nix develop .#kucoin
```

## Notes

- System target: `nixosConfigurations.nixos` (x86_64-linux)
- Dev shells support both x86_64-linux and aarch64-darwin
- `shells/kucoin.nix` uses a custom Go 1.24.6 build and sets `GOPRIVATE=bitbucket.kucoin.net`
- Rust is provided via `rust-overlay` (stable latest), available system-wide
