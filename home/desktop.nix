{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    tree
    unzip
    emacs-pgtk
    google-chrome
    btop
    bat
    just
    claude-code
  ];
}
