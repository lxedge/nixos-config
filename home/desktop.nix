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
    zellij
    just
    emacs-pgtk
    vscode
    claude-code
    docker
    dbeaver-bin
  ];
}
