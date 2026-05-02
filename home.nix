{ config, pkgs, ... }:

{
  home.username = "miles";
  home.homeDirectory = "/home/miles";
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    tree
    emacs-pgtk
    google-chrome
    btop
    bat
    just
  ];

  programs.git = {
    enable = true;
    userName = "Miles";
    userEmail = "mileslee1215@gmail.com";
  };

  programs.home-manager.enable = true;
}
