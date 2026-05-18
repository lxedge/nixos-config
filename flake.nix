{
  description = "Personal NixOS Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    # flake-utils.url = "github:numtide/flake-utils";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      # flake-utils,
      home-manager,
      rust-overlay,
      ...
    }@inputs:
    let
      supportedSystems = [
        "aarch64-darwin"
        "x86_64-linux"
      ];

      makePkgs =
        system:
        import nixpkgs {
          inherit system;
          overlays = [ rust-overlay.overlays.default ];
          config.allowUnfree = true;
        };
    in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./configuration.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.miles = import ./home;
          }

          (
            { pkgs, ... }:
            let
              linuxPkgs = makePkgs "x86_64-linux";

              baseShell = import ./shells/base.nix { pkgs = linuxPkgs; };
              goShell = import ./shells/go.nix { pkgs = linuxPkgs; };
              evmShell = import ./shells/evm.nix { pkgs = linuxPkgs; };
            in
            {
              nixpkgs.overlays = [ rust-overlay.overlays.default ];

              environment.systemPackages = [
                pkgs.rust-bin.stable.latest.default
              ]
              ++ baseShell.buildInputs
              ++ goShell.buildInputs
              ++ evmShell.buildInputs;
            }
          )
        ];
      };

      devShells = nixpkgs.lib.genAttrs supportedSystems (
        system:
        let
          targetPkgs = makePkgs system;
        in
        {
          base = import ./shells/base.nix { pkgs = targetPkgs; };
          go = import ./shells/go.nix { pkgs = targetPkgs; };
          go-kucoin = import ./shells/kucoin.nix { pkgs = targetPkgs; };
          evm = import ./shells/evm.nix { pkgs = targetPkgs; };
        }
      );
    };
}
