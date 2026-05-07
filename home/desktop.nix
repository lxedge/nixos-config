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
    direnv
    zellij
    just
    emacs-pgtk
    vscode
    claude-code
    docker
    # tableplus
    #
  ];
}
