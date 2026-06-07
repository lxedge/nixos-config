{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    google-chrome
    brave
    telegram-desktop
    wechat-uos
    qqmusic
    discord
    #
    coredns
    corectrl
    wezterm
    emacs-pgtk
    vscode
    claude-code
    dbeaver-bin
    podman
    podman-tui
  ];
}
