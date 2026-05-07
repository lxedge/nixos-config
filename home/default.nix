{ config, pkgs, ... }:

{
  programs.home-manager.enable = true;

  imports = [
    ./git.nix
    ./desktop.nix
    ./dotfiles.nix
  ];

  home.username = "miles";
  home.homeDirectory = "/home/miles";
  home.stateVersion = "25.11";
}
