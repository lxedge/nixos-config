{ config, pkgs, ... }:

{
  # home.file entries go here
  home.file = {
    ".local/share/fcitx5/rime" = {
      recursive = true;
      source = ../dotfiles/rime;
    };
  };

  xdg.configFile."fcitx5/conf/classicui.conf".text = ''
    Theme=Nord-Dark
  '';
}
