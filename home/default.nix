{ config, pkgs, ... }:

{
  imports = [
    ./git.nix
    ./shell.nix
    ./desktop.nix
    ./dotfiles.nix
  ];

  home.username = "miles";
  home.homeDirectory = "/home/miles";
  home.stateVersion = "25.11";
}
