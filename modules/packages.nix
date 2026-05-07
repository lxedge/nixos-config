{ config, lib, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    man
    man-pages
    man-pages-posix
    libnotify
    vim
    wget
    nixfmt
    nixd
    tree
    zip
    unzip
    btop
    bat
    gcc
    cmake
    pkg-config
    ripgrep
    # ripgrep-all
    tokei
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    wqy_microhei
    fira-code
    nerd-fonts.fira-code
    nerd-fonts.meslo-lg
    nerd-fonts.jetbrains-mono
    maple-mono.CN
  ];
}
