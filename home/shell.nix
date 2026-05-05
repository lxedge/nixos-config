{ config, pkgs, ... }:

{
  programs.home-manager.enable = true;

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;

    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
      ignoreDups = true;
      ignoreAllDups = true;
    };

    initExtra = ''
      if [ -f "$HOME/.secrets" ]; then
        source "$HOME/.secrets"
      fi
    '';
  };
}
